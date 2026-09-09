using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using ERP.API.Application.DTOs;
using ERP.API.Application.Services;
using ERP.API.Domain.Entities;
using ERP.API.Responses;
using Microsoft.EntityFrameworkCore;

namespace ERP.API.Controllers;

[ApiController]
[Route("api/[controller]")]
[Authorize]
public class AttendanceController : ControllerBase
{
    private readonly IAttendanceService _attendanceService;
    private readonly ILogger<AttendanceController> _logger;
    private readonly AppDbContext _context;

    public AttendanceController(IAttendanceService attendanceService, ILogger<AttendanceController> logger, AppDbContext context)
    {
        _attendanceService = attendanceService;
        _logger = logger;
        _context = context;
    }

    [HttpPost("clock-in")]
    public async Task<ActionResult<ApiResponse<AttendanceDto>>> ClockIn([FromBody] ClockInDto clockInDto)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            clockInDto.UserId = userId ?? clockInDto.UserId;
            
            var result = await _attendanceService.ClockInAsync(clockInDto);
            return Ok(ApiResponse<AttendanceDto>.SuccessResponse(result, "Clocked in successfully"));
        }
        catch (InvalidOperationException ex)
        {
            return BadRequest(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during clock in");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to clock in"));
        }
    }

    [HttpPost("clock-in/face")]
    public async Task<ActionResult<ApiResponse<AttendanceDto>>> ClockInWithFace([FromForm] ClockInDto clockInDto, IFormFile image)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userId == null) return Unauthorized(ApiResponse<object>.ErrorResponse("Unauthorized"));
            clockInDto.UserId = userId;

            // Get user's face ID
            var user = await _context.Users.FindAsync(userId);
            if (user == null || !user.FaceApiPersonId.HasValue)
            {
                return BadRequest(ApiResponse<object>.ErrorResponse("Face recognition not enrolled for this user"));
            }

            // Verify face
            var faceRecognitionService = HttpContext.RequestServices.GetRequiredService<IFaceRecognitionService>();
            using var stream = image.OpenReadStream();
            var isVerified = await faceRecognitionService.VerifyFaceAsync(user.FaceApiPersonId.Value, stream);

            if (!isVerified)
            {
                return BadRequest(ApiResponse<object>.ErrorResponse("Face verification failed. Make sure you are clearly visible."));
            }
            
            var result = await _attendanceService.ClockInAsync(clockInDto);
            return Ok(ApiResponse<AttendanceDto>.SuccessResponse(result, "Clocked in successfully with face recognition"));
        }
        catch (InvalidOperationException ex)
        {
            return BadRequest(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during clock in with face");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to clock in with face"));
        }
    }

    [HttpPost("clock-out")]
    public async Task<ActionResult<ApiResponse<AttendanceDto>>> ClockOut([FromBody] ClockOutDto clockOutDto)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            
            if (clockOutDto.AttendanceId == "today")
            {
                var today = DateTime.UtcNow.Date;
                var todayAttendance = await _context.Attendances
                    .FirstOrDefaultAsync(a => a.UserId == userId && a.Date == today);
                
                if (todayAttendance == null)
                    return NotFound(ApiResponse<object>.ErrorResponse("No attendance record found for today"));
                
                clockOutDto.AttendanceId = todayAttendance.Id;
            }

            // Verify attendance belongs to user
            var attendance = await _attendanceService.GetAttendanceByIdAsync(clockOutDto.AttendanceId);
            if (attendance.UserId != userId)
                return Unauthorized(ApiResponse<object>.ErrorResponse("Unauthorized"));

            var result = await _attendanceService.ClockOutAsync(clockOutDto);
            return Ok(ApiResponse<AttendanceDto>.SuccessResponse(result, "Clocked out successfully"));
        }
        catch (NotFoundException ex)
        {
            return NotFound(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (InvalidOperationException ex)
        {
            return BadRequest(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error during clock out");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to clock out"));
        }
    }

    [HttpGet("my-attendance")]
    public async Task<ActionResult<ApiResponse<IEnumerable<AttendanceDto>>>> GetMyAttendance(
        [FromQuery] DateTime? fromDate,
        [FromQuery] DateTime? toDate)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.GetUserAttendanceAsync(userId!, fromDate, toDate);
            return Ok(ApiResponse<IEnumerable<AttendanceDto>>.SuccessResponse(result, "Attendance retrieved"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving attendance");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to retrieve attendance"));
        }
    }

    [HttpGet("today")]
    public async Task<ActionResult<ApiResponse<AttendanceSummaryDto>>> GetTodaySummary()
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.GetTodaySummaryAsync(userId!);
            return Ok(ApiResponse<AttendanceSummaryDto>.SuccessResponse(result, "Today's summary retrieved"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving today's summary");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to retrieve summary"));
        }
    }

    [HttpGet("statistics")]
    public async Task<ActionResult<ApiResponse<AttendanceStatisticsDto>>> GetStatistics(
        [FromQuery] int year,
        [FromQuery] int? month)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.GetAttendanceStatisticsAsync(userId!, year, month);
            return Ok(ApiResponse<AttendanceStatisticsDto>.SuccessResponse(result, "Statistics retrieved"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving statistics");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to retrieve statistics"));
        }
    }

    [HttpPost("correction")]
    public async Task<ActionResult<ApiResponse<AttendanceDto>>> RequestCorrection([FromBody] AttendanceCorrectionDto correctionDto)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.CorrectAttendanceAsync(userId!, correctionDto);
            return Ok(ApiResponse<AttendanceDto>.SuccessResponse(result, "Correction request submitted"));
        }
        catch (NotFoundException ex)
        {
            return NotFound(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (UnauthorizedAccessException ex)
        {
            return Unauthorized(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error requesting attendance correction");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to request correction"));
        }
    }

    [HttpGet("holidays")]
    public async Task<ActionResult<ApiResponse<IEnumerable<Holiday>>>> GetHolidays(
        [FromQuery] int year,
        [FromQuery] string? region)
    {
        try
        {
            var result = await _attendanceService.GetHolidaysAsync(year, region);
            return Ok(ApiResponse<IEnumerable<Holiday>>.SuccessResponse(result, "Holidays retrieved"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving holidays");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to retrieve holidays"));
        }
    }

    [HttpGet("overtime")]
    public async Task<ActionResult<ApiResponse<double>>> GetOvertime(
        [FromQuery] DateTime fromDate,
        [FromQuery] DateTime toDate)
    {
        try
        {
            var userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.CalculateOvertimeAsync(userId!, fromDate, toDate);
            return Ok(ApiResponse<double>.SuccessResponse(result, "Overtime calculated"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error calculating overtime");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to calculate overtime"));
        }
    }

    // Manager endpoints
    [HttpGet("team-attendance")]
    [Authorize(Roles = "Manager,HR,Admin")]
    public async Task<ActionResult<ApiResponse<IEnumerable<AttendanceDto>>>> GetTeamAttendance(
        [FromQuery] DateTime? fromDate,
        [FromQuery] DateTime? toDate,
        [FromQuery] string? employeeId)
    {
        try
        {
            var managerId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            
            // Get team members
            var teamMembers = await _context.Users
                .Where(u => u.ManagerId == managerId)
                .Select(u => u.Id)
                .ToListAsync();

            if (!string.IsNullOrEmpty(employeeId) && teamMembers.Contains(employeeId))
                teamMembers = new List<string> { employeeId };

            var result = new List<AttendanceDto>();
            foreach (var memberId in teamMembers)
            {
                var memberAttendance = await _attendanceService.GetUserAttendanceAsync(memberId, fromDate, toDate);
                result.AddRange(memberAttendance);
            }

            return Ok(ApiResponse<IEnumerable<AttendanceDto>>.SuccessResponse(result, "Team attendance retrieved"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving team attendance");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to retrieve team attendance"));
        }
    }

    [HttpGet("pending-requests")]
    [Authorize(Roles = "Manager,HR,Admin")]
    public async Task<ActionResult<ApiResponse<IEnumerable<AttendanceRequest>>>> GetPendingRequests()
    {
        try
        {
            var managerId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.GetPendingAttendanceRequestsAsync(managerId!);
            return Ok(ApiResponse<IEnumerable<AttendanceRequest>>.SuccessResponse(result, "Pending requests retrieved"));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error retrieving pending requests");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to retrieve pending requests"));
        }
    }

    [HttpPut("requests/{requestId}")]
    [Authorize(Roles = "Manager,HR,Admin")]
    public async Task<ActionResult<ApiResponse<AttendanceRequest>>> ProcessRequest(
        string requestId,
        [FromBody] ProcessRequestDto processDto)
    {
        try
        {
            var managerId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            var result = await _attendanceService.ApproveAttendanceRequestAsync(
                requestId,
                managerId!,
                processDto.Approve,
                processDto.Reason
            );
            
            var message = processDto.Approve ? "Request approved" : "Request rejected";
            return Ok(ApiResponse<AttendanceRequest>.SuccessResponse(result, message));
        }
        catch (NotFoundException ex)
        {
            return NotFound(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (InvalidOperationException ex)
        {
            return BadRequest(ApiResponse<object>.ErrorResponse(ex.Message));
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error processing attendance request");
            return StatusCode(500, ApiResponse<object>.ErrorResponse("Failed to process request"));
        }
    }
}

public class ProcessRequestDto
{
    public required bool Approve { get; set; }
    public string? Reason { get; set; }
}
