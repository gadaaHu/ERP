using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using ERP.API.Shared.Data;

namespace ERP.API.Features.Training
{
    [Route("api/[controller]")]
    [ApiController]
    public class TrainingController : ControllerBase
    {
        private readonly AppDbContext _context;

        public TrainingController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("programs")]
        public async Task<IActionResult> GetPrograms()
        {
            var programs = await _context.TrainingPrograms
                .Include(t => t.Enrollments)
                .OrderByDescending(t => t.StartDate)
                .ToListAsync();
            return Ok(programs);
        }

        [HttpPost("programs")]
        public async Task<IActionResult> CreateProgram([FromBody] CreateTrainingRequest request)
        {
            var program = new TrainingProgram
            {
                Title = request.Title,
                Description = request.Description,
                Trainer = request.Trainer,
                StartDate = request.StartDate,
                EndDate = request.EndDate,
                MaxParticipants = request.MaxParticipants,
                Status = "Upcoming"
            };

            await _context.TrainingPrograms.AddAsync(program);
            await _context.SaveChangesAsync();
            return Ok(program);
        }

        [HttpPost("enroll")]
        public async Task<IActionResult> Enroll([FromBody] EnrollRequest request)
        {
            var alreadyEnrolled = await _context.TrainingEnrollments
                .AnyAsync(e => e.EmployeeId == request.EmployeeId && e.TrainingProgramId == request.TrainingProgramId);

            if (alreadyEnrolled)
                return BadRequest("Employee is already enrolled in this program.");

            var enrollment = new TrainingEnrollment
            {
                EmployeeId = request.EmployeeId,
                TrainingProgramId = request.TrainingProgramId,
                Status = "Enrolled"
            };

            await _context.TrainingEnrollments.AddAsync(enrollment);
            await _context.SaveChangesAsync();
            return Ok(enrollment);
        }

        [HttpPut("enrollments/{id}/complete")]
        public async Task<IActionResult> Complete(int id)
        {
            var enrollment = await _context.TrainingEnrollments.FindAsync(id);
            if (enrollment == null) return NotFound();

            enrollment.Status = "Completed";
            enrollment.CompletionDate = DateTime.UtcNow;
            enrollment.CertificateUrl = $"/certificates/{enrollment.EmployeeId}/{enrollment.TrainingProgramId}.pdf";

            await _context.SaveChangesAsync();
            return Ok(enrollment);
        }
    }

    public class CreateTrainingRequest
    {
        public string Title { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Trainer { get; set; } = string.Empty;
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int MaxParticipants { get; set; }
    }

    public class EnrollRequest
    {
        public int EmployeeId { get; set; }
        public int TrainingProgramId { get; set; }
    }
}
