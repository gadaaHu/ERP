using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ERP.API.Shared.Data;

namespace ERP.API.Features.Leaves
{
    [Route("api/[controller]")]
    [ApiController]
    public class LeavesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public LeavesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] LeaveRequest request)
        {
            _context.LeaveRequests.Add(request);
            await _context.SaveChangesAsync();
            return Ok(request);
        }

        [HttpGet("employee/{employeeId}")]
        public async Task<IActionResult> GetEmployeeLeaves(int employeeId, [FromQuery] int year = 0)
        {
            var query = _context.LeaveRequests
                .Include(l => l.Employee)
                .Where(l => l.EmployeeId == employeeId);

            if (year > 0)
            {
                query = query.Where(l => l.RequestDate.Year == year);
            }

            var leaves = await query.ToListAsync();
            return Ok(leaves);
        }

        [HttpPut("{id}/approve")]
        public async Task<IActionResult> Approve(int id, [FromBody] ApproveLeaveRequest request)
        {
            var leave = await _context.LeaveRequests.FindAsync(id);
            if (leave == null)
                return NotFound();

            leave.Approve(request.ApproverId);
            await _context.SaveChangesAsync();

            return Ok(leave);
        }

        [HttpPut("{id}/reject")]
        public async Task<IActionResult> Reject(int id, [FromBody] RejectLeaveRequest request)
        {
            var leave = await _context.LeaveRequests.FindAsync(id);
            if (leave == null)
                return NotFound();

            leave.Reject(request.ApproverId, request.Reason ?? "Rejected");
            await _context.SaveChangesAsync();

            return Ok(leave);
        }

        [HttpGet("pending")]
        public async Task<IActionResult> GetPendingRequests()
        {
            var pendingRequests = await _context.LeaveRequests
                .Include(l => l.Employee)
                .Where(l => l.Status == LeaveStatus.Pending)
                .ToListAsync();

            return Ok(pendingRequests);
        }
    }

    public class ApproveLeaveRequest
    {
        public int ApproverId { get; set; }
    }

    public class RejectLeaveRequest
    {
        public int ApproverId { get; set; }
        public string Reason { get; set; } = string.Empty;
    }
}
