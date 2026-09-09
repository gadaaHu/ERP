namespace ERP.API.Application.Services;

public interface IFaceRecognitionService
{
    Task<Guid> EnrollEmployeeFaceAsync(string employeeId, Stream imageStream);
    Task<bool> VerifyFaceAsync(Guid faceApiPersonId, Stream imageStream);
}
