using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using ERP.API.Shared.Data;

namespace ERP.API.Features.Onboarding
{
    [Route("api/[controller]")]
    [ApiController]
    public class OnboardingController : ControllerBase
    {
        private readonly AppDbContext _context;

        public OnboardingController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("employee/{employeeId}")]
        public async Task<IActionResult> GetEmployeeTasks(int employeeId)
        {
            var tasks = await _context.OnboardingTasks
                .Where(t => t.EmployeeId == employeeId)
                .OrderBy(t => t.DueDate)
                .ToListAsync();
            return Ok(tasks);
        }

        [HttpPost]
        public async Task<IActionResult> CreateTask([FromBody] CreateOnboardingTaskRequest request)
        {
            var task = new OnboardingTask
            {
                EmployeeId = request.EmployeeId,
                TaskName = request.TaskName,
                Description = request.Description,
                Category = request.Category,
                AssignedTo = request.AssignedTo,
                DueDate = request.DueDate
            };

            await _context.OnboardingTasks.AddAsync(task);
            await _context.SaveChangesAsync();
            return Ok(task);
        }

        [HttpPut("{id}/complete")]
        public async Task<IActionResult> CompleteTask(int id)
        {
            var task = await _context.OnboardingTasks.FindAsync(id);
            if (task == null) return NotFound();

            task.IsCompleted = true;
            task.CompletedAt = DateTime.UtcNow;

            await _context.SaveChangesAsync();
            return Ok(task);
        }

        [HttpPost("seed/{employeeId}")]
        public async Task<IActionResult> SeedDefaultTasks(int employeeId)
        {
            var defaultTasks = new[]
            {
                new { Task = "Sign employment contract", Cat = "HR Paperwork", Days = 1 },
                new { Task = "Set up workstation and email", Cat = "IT Setup", Days = 2 },
                new { Task = "Company orientation session", Cat = "Orientation", Days = 3 },
                new { Task = "Meet with HR Manager", Cat = "Orientation", Days = 3 },
                new { Task = "Complete safety training", Cat = "Training", Days = 5 },
                new { Task = "System access and credentials", Cat = "IT Setup", Days = 5 },
                new { Task = "Department introduction meeting", Cat = "Orientation", Days = 7 },
                new { Task = "Review company policies & handbook", Cat = "HR Paperwork", Days = 7 },
            };

            foreach (var t in defaultTasks)
            {
                await _context.OnboardingTasks.AddAsync(new OnboardingTask
                {
                    EmployeeId = employeeId,
                    TaskName = t.Task,
                    Category = t.Cat,
                    Description = string.Empty,
                    AssignedTo = "HR",
                    DueDate = DateTime.UtcNow.AddDays(t.Days)
                });
            }

            await _context.SaveChangesAsync();
            return Ok(new { message = "Default onboarding tasks seeded" });
        }
    }

    public class CreateOnboardingTaskRequest
    {
        public int EmployeeId { get; set; }
        public string TaskName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Category { get; set; } = "General";
        public string AssignedTo { get; set; } = string.Empty;
        public DateTime DueDate { get; set; }
    }
}
