using Microsoft.Azure.CognitiveServices.Vision.Face;
using Microsoft.Azure.CognitiveServices.Vision.Face.Models;

namespace ERP.API.Application.Services;

public class FaceRecognitionService : IFaceRecognitionService
{
    private readonly IFaceClient _faceClient;
    private readonly string _personGroupId = "erp-employees";
    private readonly ILogger<FaceRecognitionService> _logger;

    public FaceRecognitionService(IConfiguration configuration, ILogger<FaceRecognitionService> logger)
    {
        _logger = logger;
        
        string endpoint = configuration["AzureFaceApi:Endpoint"] ?? string.Empty;
        string key = configuration["AzureFaceApi:Key"] ?? string.Empty;

        _faceClient = new FaceClient(new ApiKeyServiceClientCredentials(key))
        {
            Endpoint = endpoint
        };
    }

    private async Task EnsurePersonGroupExistsAsync()
    {
        try
        {
            await _faceClient.PersonGroup.GetAsync(_personGroupId);
        }
        catch (APIErrorException ex) when (ex.Body.Error.Code == "PersonGroupNotFound")
        {
            await _faceClient.PersonGroup.CreateAsync(_personGroupId, "ERP Employees");
        }
    }

    public async Task<Guid> EnrollEmployeeFaceAsync(string employeeId, Stream imageStream)
    {
        await EnsurePersonGroupExistsAsync();

        // 1. Create a person in the person group
        var person = await _faceClient.PersonGroupPerson.CreateAsync(
            _personGroupId,
            name: $"Employee {employeeId}"
        );

        // 2. Add face to the person
        await _faceClient.PersonGroupPerson.AddFaceFromStreamAsync(
            _personGroupId,
            person.PersonId,
            imageStream
        );

        // 3. Train the person group
        await _faceClient.PersonGroup.TrainAsync(_personGroupId);

        return person.PersonId;
    }

    public async Task<bool> VerifyFaceAsync(Guid faceApiPersonId, Stream imageStream)
    {
        // 1. Detect the face in the incoming image stream
        var detectedFaces = await _faceClient.Face.DetectWithStreamAsync(
            imageStream,
            recognitionModel: RecognitionModel.Recognition04,
            detectionModel: DetectionModel.Detection03
        );

        if (detectedFaces == null || detectedFaces.Count == 0)
        {
            _logger.LogWarning("No face detected in the provided image.");
            return false;
        }

        if (detectedFaces.Count > 1)
        {
            _logger.LogWarning("Multiple faces detected in the provided image.");
            return false;
        }

        var faceId = detectedFaces.First().FaceId;
        if (!faceId.HasValue) return false;

        // 2. Verify the detected face against the pre-learned person profile
        var verifyResult = await _faceClient.Face.VerifyFaceToPersonAsync(
            faceId.Value,
            faceApiPersonId,
            _personGroupId
        );

        return verifyResult.IsIdentical;
    }
}
