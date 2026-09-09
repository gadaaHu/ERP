using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ERP.API.Shared.Data;


namespace ERP.API.Features.Employees
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeesController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public EmployeesController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var employees = await _context.Employees.ToListAsync();
            return Ok(employees);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null)
                return NotFound();
            return Ok(employee);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Employee request)
        {
            request.CreatedAt = DateTime.UtcNow;
            await _context.Employees.AddAsync(request);
            await _context.SaveChangesAsync();
            return Ok(request);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] Employee request)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null)
                return NotFound();

            employee.FullName = request.FullName;
            employee.Email = request.Email;
            employee.Phone = request.Phone;
            employee.Department = request.Department;
            employee.Position = request.Position;
            employee.Status = request.Status;
            employee.Salary = request.Salary;

            await _context.SaveChangesAsync();
            return Ok(employee);
        }

        [HttpPost("{id}/photo")]
        public async Task<IActionResult> UploadPhoto(int id, IFormFile photo, [FromServices] ERP.API.Application.Services.IFaceRecognitionService faceRecognitionService)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null)
                return NotFound();

            if (photo == null || photo.Length == 0)
                return BadRequest("No file provided.");

            // Save to wwwroot/uploads/employees/
            var uploadsFolder = Path.Combine(_env.WebRootPath ?? "wwwroot", "uploads", "employees");
            Directory.CreateDirectory(uploadsFolder);

            var extension = Path.GetExtension(photo.FileName);
            var fileName = $"emp_{id}_{Guid.NewGuid():N}{extension}";
            var filePath = Path.Combine(uploadsFolder, fileName);

            await using var stream = new FileStream(filePath, FileMode.Create);
            await photo.CopyToAsync(stream);

            employee.PhotoUrl = $"/uploads/employees/{fileName}";

            try
            {
                // Enroll face to Azure Face API
                using var readStream = new FileStream(filePath, FileMode.Open);
                var personId = await faceRecognitionService.EnrollEmployeeFaceAsync(id.ToString(), readStream);
                employee.FaceApiPersonId = personId;

                // Also update the User record if one exists for this employee
                var user = await _context.Users.FirstOrDefaultAsync(u => u.EmployeeId == id.ToString());
                if (user != null)
                {
                    user.FaceApiPersonId = personId;
                }
            }
            catch (Exception ex)
            {
                // Log exception, maybe Azure is not configured yet
                Console.WriteLine($"Face API Enrollment Failed: {ex.Message}");
            }

            await _context.SaveChangesAsync();

            return Ok(new { photoUrl = employee.PhotoUrl });
        }

        [HttpPost("{id}/terminate")]
        public async Task<IActionResult> Terminate(int id)
        {
            var employee = await _context.Employees.FindAsync(id);
            if (employee == null)
                return NotFound();

            employee.Status = "Terminated";
            await _context.SaveChangesAsync();
            return Ok(employee);
        }
    }
}

