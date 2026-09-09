using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using ERP.API.Shared.Data;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ERP.API.Features.Appraisal
{
    [Route("api/[controller]")]
    [ApiController]
    public class AppraisalController : ControllerBase
    {
        private readonly AppDbContext _context;

        public AppraisalController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("employee/{employeeId}")]
        public async Task<IActionResult> GetEmployeeAppraisals(int employeeId)
        {
            var appraisals = await _context.PerformanceAppraisals
                .Where(p => p.EmployeeId == employeeId)
                .OrderByDescending(p => p.ReviewDate)
                .ToListAsync();

            return Ok(appraisals);
        }

        [HttpPost]
        public async Task<IActionResult> CreateAppraisal([FromBody] CreateAppraisalRequest request)
        {
            var appraisal = new PerformanceAppraisal
            {
                EmployeeId = request.EmployeeId,
                ReviewerId = request.ReviewerId,
                ReviewDate = DateTime.UtcNow,
                Score = request.Score,
                Goals = request.Goals,
                Comments = request.Comments
            };

            await _context.PerformanceAppraisals.AddAsync(appraisal);
            await _context.SaveChangesAsync();
            return Ok(appraisal);
        }
    }

    public class CreateAppraisalRequest
    {
        public int EmployeeId { get; set; }
        public int ReviewerId { get; set; }
        public int Score { get; set; }
        public string Goals { get; set; } = string.Empty;
        public string Comments { get; set; } = string.Empty;
    }
}
