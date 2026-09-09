using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using ERP.API.Shared.Data;
using ERP.API.Features.Employees;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ERP.API.Features.Recruitment
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecruitmentController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RecruitmentController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("jobs")]
        public async Task<IActionResult> GetJobOpenings()
        {
            var jobs = await _context.JobOpenings
                .OrderByDescending(j => j.PostedDate)
                .Select(j => new
                {
                    j.Id,
                    j.JobTitle,
                    j.JobDescription,
                    j.JobRequirements,
                    j.NumberOfPositions,
                    j.PostedDate,
                    j.DeadlineDate,
                    j.Status,
                    j.DepartmentId,
                    j.PositionId,
                    j.RequestedBy,
                    j.MinSalary,
                    j.MaxSalary,
                    ApplicationCount = _context.JobApplications.Count(a => a.JobOpeningId == j.Id)
                })
                .ToListAsync();

            return Ok(jobs);
        }

        [HttpGet("jobs/{id}/applications")]
        public async Task<IActionResult> GetApplications(int id)
        {
            var applications = await _context.JobApplications
                .Where(a => a.JobOpeningId == id)
                .OrderByDescending(a => a.AppliedDate)
                .Select(a => new
                {
                    a.Id,
                    a.ApplicantName,
                    a.Email,
                    a.Phone,
                    a.Status,
                    a.AppliedDate,
                    a.Score,
                    a.InterviewNotes,
                    a.OfferAccepted,
                })
                .ToListAsync();

            return Ok(applications);
        }

        [HttpPost("jobs")]
        public async Task<IActionResult> CreateJobOpening([FromBody] CreateJobRequest request)
        {
            var job = new JobOpening(
                request.JobTitle,
                request.JobDescription,
                request.JobRequirements,
                request.NumberOfPositions,
                request.DeadlineDate,
                request.DepartmentId,
                request.PositionId,
                request.RequestedBy
            );

            await _context.JobOpenings.AddAsync(job);
            await _context.SaveChangesAsync();
            return Ok(job);
        }

        [HttpPost("jobs/{id}/apply")]
        public async Task<IActionResult> ApplyForJob(int id, [FromBody] ApplyJobRequest request)
        {
            var job = await _context.JobOpenings.FindAsync(id);
            if (job == null) return NotFound();

            var application = new JobApplication(
                id,
                request.ApplicantName,
                request.Email,
                request.Phone,
                request.ResumeUrl,
                request.CoverLetter
            );

            await _context.JobApplications.AddAsync(application);
            await _context.SaveChangesAsync();
            return Ok(application);
        }

        /// <summary>
        /// Mark an applicant as PASSED — automatically creates them as an Employee.
        /// </summary>
        [HttpPost("applications/{id}/pass")]
        public async Task<IActionResult> PassApplicant(int id)
        {
            var application = await _context.JobApplications
                .Include(a => a.JobOpening)
                .FirstOrDefaultAsync(a => a.Id == id);

            if (application == null)
                return NotFound("Application not found.");

            // Promote the applicant status
            application.AcceptOffer();
            
            // Create a new Employee from applicant data
            var employee = new Employee
            {
                FullName = application.ApplicantName,
                Email = application.Email,
                Phone = application.Phone ?? string.Empty,
                Department = application.JobOpening?.JobTitle ?? "General",
                Position = application.JobOpening?.JobTitle ?? "Staff",
                HireDate = DateTime.UtcNow,
                Status = "Active",
                Salary = application.JobOpening?.MinSalary ?? 50000m,
                Gender = string.Empty,
                CreatedAt = DateTime.UtcNow,
            };

            await _context.Employees.AddAsync(employee);
            await _context.SaveChangesAsync();

            return Ok(new
            {
                message = $"{employee.FullName} has been added to the Employee list.",
                employee,
            });
        }
    }

    public class CreateJobRequest
    {
        public string JobTitle { get; set; } = string.Empty;
        public string JobDescription { get; set; } = string.Empty;
        public string JobRequirements { get; set; } = string.Empty;
        public int NumberOfPositions { get; set; }
        public DateTime DeadlineDate { get; set; }
        public int DepartmentId { get; set; }
        public int PositionId { get; set; }
        public int RequestedBy { get; set; }
    }

    public class ApplyJobRequest
    {
        public string ApplicantName { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Phone { get; set; } = string.Empty;
        public string ResumeUrl { get; set; } = string.Empty;
        public string CoverLetter { get; set; } = string.Empty;
    }
}
