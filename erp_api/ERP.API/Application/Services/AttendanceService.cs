using AutoMapper;
using ERP.API.Application.DTOs;
using ERP.API.Domain.Entities;
using ERP.API.Shared.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace ERP.API.Application.Services;

public class AttendanceService : IAttendanceService
{
    private readonly AppDbContext _context;
    private readonly IMapper _mapper;
    private readonly ILogger<AttendanceService> _logger;
    private readonly INotificationService _notificationService;

    public AttendanceService(
        AppDbContext context,
        IMapper mapper,
        ILogger<AttendanceService> logger,
        INotificationService notificationService)
    {
        _context = context;
        _mapper = mapper;
        _logger = logger;
        _notificationService = notificationService;
    }

    // -----------------------------------------------------------------------
    // Clock In
    // -----------------------------------------------------------------------
    public async Task<AttendanceDto> ClockInAsync(ClockInDto clockInDto)
    {
        try
        {
            var user = await _context.Users.FindAsync(clockInDto.UserId)
                ?? throw new NotFoundException("User not found");

            var today = DateTime.UtcNow.Date;
            var existingAttendance = await _context.Attendances
                .FirstOrDefaultAsync(a => a.UserId == clockInDto.UserId && a.Date == today);

            if (existingAttendance?.ClockInTime != null)
                throw new InvalidOperationException("Already clocked in today");

            var clockInTime = clockInDto.ClockInTime ?? DateTime.UtcNow;
            var attendance = new Attendance
            {
                UserId = clockInDto.UserId,
                Date = clockInTime.Date,
                ClockInTime = clockInTime,
                ClockInLocation = clockInDto.Location,
                ClockInLatitude = clockInDto.Latitude,
                ClockInLongitude = clockInDto.Longitude,
                DeviceInfo = clockInDto.DeviceInfo,
                Notes = clockInDto.Notes,
                IpAddress = GetIpAddress(),
                Status = DetermineAttendanceStatus(clockInTime, user),
                Type = AttendanceType.Regular,
                CreatedAt = DateTime.UtcNow
            };

            _context.Attendances.Add(attendance);
            await _context.SaveChangesAsync();

            await _notificationService.SendAttendanceNotificationAsync(user, "Clock In", clockInTime);

            return _mapper.Map<AttendanceDto>(attendance);
        }
        catch (Exception ex) when (ex is not NotFoundException && ex is not InvalidOperationException)
        {
            _logger.LogError(ex, "Error clocking in for user {UserId}", clockInDto.UserId);
            throw;
        }
    }

    // -----------------------------------------------------------------------
    // Clock Out
    // -----------------------------------------------------------------------
    public async Task<AttendanceDto> ClockOutAsync(ClockOutDto clockOutDto)
    {
        try
        {
            var attendance = await _context.Attendances
                .Include(a => a.User)
                .FirstOrDefaultAsync(a => a.Id == clockOutDto.AttendanceId)
                ?? throw new NotFoundException("Attendance record not found");

            if (attendance.ClockOutTime != null)
                throw new InvalidOperationException("Already clocked out");

            var clockOutTime = clockOutDto.ClockOutTime ?? DateTime.UtcNow;
            attendance.ClockOutTime = clockOutTime;
            attendance.ClockOutLocation = clockOutDto.Location;
            attendance.ClockOutLatitude = clockOutDto.Latitude;
            attendance.ClockOutLongitude = clockOutDto.Longitude;
            attendance.Notes = clockOutDto.Notes ?? attendance.Notes;
            attendance.UpdatedAt = DateTime.UtcNow;

            if (attendance.ClockInTime.HasValue)
            {
                attendance.TotalHours = (clockOutTime - attendance.ClockInTime.Value).TotalHours;
                if (attendance.TotalHours > 8)
                    attendance.OvertimeHours = attendance.TotalHours - 8;
            }

            attendance.Status = DetermineEndOfDayStatus(attendance);
            await _context.SaveChangesAsync();

            await _notificationService.SendAttendanceNotificationAsync(
                attendance.User, "Clock Out", clockOutTime, attendance.TotalHours ?? 0);

            return _mapper.Map<AttendanceDto>(attendance);
        }
        catch (Exception ex) when (ex is not NotFoundException && ex is not InvalidOperationException)
        {
            _logger.LogError(ex, "Error clocking out for attendance {AttendanceId}", clockOutDto.AttendanceId);
            throw;
        }
    }

    // -----------------------------------------------------------------------
    // Get attendance by ID
    // -----------------------------------------------------------------------
    public async Task<AttendanceDto> GetAttendanceByIdAsync(string id)
    {
        var attendance = await _context.Attendances
            .Include(a => a.User)
            .FirstOrDefaultAsync(a => a.Id == id)
            ?? throw new NotFoundException("Attendance record not found");

        return _mapper.Map<AttendanceDto>(attendance);
    }

    // -----------------------------------------------------------------------
    // Get user attendance history
    // -----------------------------------------------------------------------
    public async Task<IEnumerable<AttendanceDto>> GetUserAttendanceAsync(
        string userId, DateTime? fromDate, DateTime? toDate)
    {
        var query = _context.Attendances
            .Include(a => a.User)
            .Where(a => a.UserId == userId);

        if (fromDate.HasValue)
            query = query.Where(a => a.Date >= fromDate.Value.Date);
        if (toDate.HasValue)
            query = query.Where(a => a.Date <= toDate.Value.Date);

        var attendances = await query
            .OrderByDescending(a => a.Date)
            .ThenByDescending(a => a.CreatedAt)
            .ToListAsync();

        return _mapper.Map<IEnumerable<AttendanceDto>>(attendances);
    }

    // -----------------------------------------------------------------------
    // Get attendance statistics
    // -----------------------------------------------------------------------
    public async Task<AttendanceStatisticsDto> GetAttendanceStatisticsAsync(
        string userId, int year, int? month)
    {
        try
        {
            var query = _context.Attendances
                .Where(a => a.UserId == userId && a.Date.Year == year);

            if (month.HasValue)
                query = query.Where(a => a.Date.Month == month.Value);

            var attendances = await query.ToListAsync();

            var stats = new AttendanceStatisticsDto
            {
                TotalDays           = attendances.Count,
                PresentDays         = attendances.Count(a => a.Status == AttendanceStatus.Present),
                AbsentDays          = attendances.Count(a => a.Status == AttendanceStatus.Absent),
                LateDays            = attendances.Count(a => a.Status == AttendanceStatus.Late),
                HalfDays            = attendances.Count(a => a.Status == AttendanceStatus.HalfDay),
                LeaveDays           = attendances.Count(a => a.Status == AttendanceStatus.Leave),
                HolidayDays         = attendances.Count(a => a.Status == AttendanceStatus.Holiday),
                WorkFromHomeDays    = attendances.Count(a => a.Status == AttendanceStatus.WorkFromHome),
                BusinessTripDays    = attendances.Count(a => a.Status == AttendanceStatus.OnBusinessTrip),
                TotalOvertime       = attendances.Sum(a => a.OvertimeHours ?? 0),
            };

            var hoursData = attendances.Where(a => a.TotalHours.HasValue).ToList();
            stats.AverageHours = hoursData.Count > 0
                ? hoursData.Average(a => a.TotalHours!.Value)
                : 0;

            var totalWorkingDays = GetWorkingDays(year, month);
            stats.AttendancePercentage = totalWorkingDays > 0
                ? (stats.PresentDays + stats.WorkFromHomeDays + stats.BusinessTripDays) * 100.0 / totalWorkingDays
                : 0;

            // Monthly breakdown (only when no specific month is filtered)
            if (!month.HasValue)
            {
                for (int m = 1; m <= 12; m++)
                    stats.MonthlyBreakdown[$"{m:00}"] = attendances.Count(a => a.Date.Month == m);
            }

            // Last 4 weeks of hours
            var weeks = attendances
                .Where(a => a.TotalHours.HasValue)
                .GroupBy(a => GetWeekNumber(a.Date))
                .Select(g => new { Week = g.Key, Hours = g.Sum(a => a.TotalHours ?? 0) })
                .OrderBy(g => g.Week)
                .Take(4);

            foreach (var week in weeks)
                stats.WeeklyHours[$"Week {week.Week}"] = Math.Round(week.Hours, 2);

            return stats;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error getting attendance statistics for user {UserId}", userId);
            throw;
        }
    }

    // -----------------------------------------------------------------------
    // Correct attendance
    // -----------------------------------------------------------------------
    public async Task<AttendanceDto> CorrectAttendanceAsync(string userId, AttendanceCorrectionDto correctionDto)
    {
        try
        {
            var attendance = await _context.Attendances
                .Include(a => a.User)
                .FirstOrDefaultAsync(a => a.Id == correctionDto.AttendanceId)
                ?? throw new NotFoundException("Attendance record not found");

            if (attendance.UserId != userId)
                throw new UnauthorizedAccessException("Cannot correct another user's attendance");

            var request = new AttendanceRequest
            {
                UserId        = userId,
                AttendanceId  = attendance.Id,
                RequestType   = AttendanceRequestType.Correction,
                Reason        = correctionDto.Reason,
                NewClockInTime  = correctionDto.NewClockInTime  ?? attendance.ClockInTime,
                NewClockOutTime = correctionDto.NewClockOutTime ?? attendance.ClockOutTime,
                NewStatus       = correctionDto.NewStatus       ?? attendance.Status,
                Status        = AttendanceRequestStatus.Pending,
                CreatedAt     = DateTime.UtcNow
            };

            _context.AttendanceRequests.Add(request);
            await _context.SaveChangesAsync();

            await _notificationService.SendAttendanceCorrectionRequestAsync(attendance.User, request);

            return _mapper.Map<AttendanceDto>(attendance);
        }
        catch (Exception ex) when (ex is not NotFoundException && ex is not UnauthorizedAccessException)
        {
            _logger.LogError(ex, "Error correcting attendance for user {UserId}", userId);
            throw;
        }
    }

    // -----------------------------------------------------------------------
    // Approve / reject an attendance correction request
    // -----------------------------------------------------------------------
    public async Task<AttendanceRequest> ApproveAttendanceRequestAsync(
        string requestId, string managerId, bool approve, string? reason)
    {
        try
        {
            var request = await _context.AttendanceRequests
                .Include(r => r.User)
                .Include(r => r.Attendance)
                .FirstOrDefaultAsync(r => r.Id == requestId)
                ?? throw new NotFoundException("Attendance request not found");

            if (request.Status != AttendanceRequestStatus.Pending)
                throw new InvalidOperationException("Request already processed");

            request.Status          = approve ? AttendanceRequestStatus.Approved : AttendanceRequestStatus.Rejected;
            request.ApprovedById    = managerId;
            request.ApprovedDate    = DateTime.UtcNow;
            request.RejectionReason = approve ? null : reason;
            request.UpdatedAt       = DateTime.UtcNow;

            if (approve)
            {
                var attendance = request.Attendance;

                if (request.NewClockInTime.HasValue)
                    attendance.ClockInTime = request.NewClockInTime;

                if (request.NewClockOutTime.HasValue)
                {
                    attendance.ClockOutTime = request.NewClockOutTime;
                    if (attendance.ClockInTime.HasValue)
                    {
                        attendance.TotalHours   = (attendance.ClockOutTime.Value - attendance.ClockInTime.Value).TotalHours;
                        attendance.OvertimeHours = attendance.TotalHours > 8 ? attendance.TotalHours - 8 : 0;
                    }
                }

                if (request.NewStatus != AttendanceStatus.Present)
                    attendance.Status = request.NewStatus;

                attendance.IsApproved    = true;
                attendance.ApprovedById  = managerId;
                attendance.ApprovedDate  = DateTime.UtcNow;
                attendance.UpdatedAt     = DateTime.UtcNow;
            }

            await _context.SaveChangesAsync();

            await _notificationService.SendAttendanceCorrectionResponseAsync(request.User, request, approve);

            return request;
        }
        catch (Exception ex) when (ex is not NotFoundException && ex is not InvalidOperationException)
        {
            _logger.LogError(ex, "Error approving attendance request {RequestId}", requestId);
            throw;
        }
    }

    // -----------------------------------------------------------------------
    // Get pending requests for a manager
    // -----------------------------------------------------------------------
    public async Task<IEnumerable<AttendanceRequest>> GetPendingAttendanceRequestsAsync(string managerId)
    {
        var employeeIds = await _context.Users
            .Where(u => u.ManagerId == managerId)
            .Select(u => u.Id)
            .ToListAsync();

        return await _context.AttendanceRequests
            .Include(r => r.User)
            .Include(r => r.Attendance)
            .Where(r => employeeIds.Contains(r.UserId) && r.Status == AttendanceRequestStatus.Pending)
            .OrderBy(r => r.CreatedAt)
            .ToListAsync();
    }

    // -----------------------------------------------------------------------
    // Get holidays
    // -----------------------------------------------------------------------
    public async Task<IEnumerable<Holiday>> GetHolidaysAsync(int year, string? region = null)
    {
        var query = _context.Holidays.Where(h => h.Date.Year == year && h.IsActive);

        if (!string.IsNullOrEmpty(region))
            query = query.Where(h => h.Region == region || h.Region == null);

        return await query.OrderBy(h => h.Date).ToListAsync();
    }

    // -----------------------------------------------------------------------
    // Check whether user has attendance on a given date
    // -----------------------------------------------------------------------
    public async Task<bool> CheckAttendanceStatusAsync(string userId, DateTime date)
    {
        var attendance = await _context.Attendances
            .FirstOrDefaultAsync(a => a.UserId == userId && a.Date == date.Date);

        return attendance != null && attendance.Status != AttendanceStatus.Absent;
    }

    // -----------------------------------------------------------------------
    // Today's summary
    // -----------------------------------------------------------------------
    public async Task<AttendanceSummaryDto> GetTodaySummaryAsync(string userId)
    {
        var today = DateTime.UtcNow.Date;
        var attendance = await _context.Attendances
            .FirstOrDefaultAsync(a => a.UserId == userId && a.Date == today);

        if (attendance == null)
        {
            return new AttendanceSummaryDto
            {
                Date      = today,
                DayOfWeek = today.ToString("dddd"),
                Status    = "Not clocked in",
                ClockIn   = "N/A",
                ClockOut  = "N/A",
                Hours     = 0
            };
        }

        return new AttendanceSummaryDto
        {
            Date      = attendance.Date,
            DayOfWeek = attendance.Date.ToString("dddd"),
            Status    = attendance.Status.ToString(),
            ClockIn   = attendance.ClockInTime?.ToString("hh:mm tt") ?? "N/A",
            ClockOut  = attendance.ClockOutTime?.ToString("hh:mm tt") ?? "Not clocked out",
            Hours     = Math.Round(attendance.TotalHours ?? 0, 2),
            Notes     = attendance.Notes
        };
    }

    // -----------------------------------------------------------------------
    // Calculate overtime for a date range
    // -----------------------------------------------------------------------
    public async Task<double> CalculateOvertimeAsync(string userId, DateTime fromDate, DateTime toDate)
    {
        var attendances = await _context.Attendances
            .Where(a => a.UserId == userId &&
                        a.Date >= fromDate.Date &&
                        a.Date <= toDate.Date &&
                        a.OvertimeHours.HasValue)
            .ToListAsync();

        return attendances.Sum(a => a.OvertimeHours ?? 0);
    }

    // -----------------------------------------------------------------------
    // Private helpers
    // -----------------------------------------------------------------------
    private AttendanceStatus DetermineAttendanceStatus(DateTime clockInTime, User user)
    {
        var policy = GetAttendancePolicy(user);
        var standardStart = policy?.StandardStartTime ?? new TimeSpan(9, 0, 0);
        var gracePeriod   = policy?.GracePeriodMinutes ?? 15;

        var timeOfDay     = clockInTime.TimeOfDay;
        var graceEndTime  = standardStart.Add(TimeSpan.FromMinutes(gracePeriod));
        var lateThreshold = standardStart.Add(TimeSpan.FromMinutes(30));

        if (timeOfDay <= graceEndTime)    return AttendanceStatus.Present;
        if (timeOfDay <= lateThreshold)   return AttendanceStatus.Late;
        return AttendanceStatus.Present;  // Still present but may be reviewed
    }

    private static AttendanceStatus DetermineEndOfDayStatus(Attendance attendance)
    {
        if (attendance.Status == AttendanceStatus.Late)
            return AttendanceStatus.Late;

        if (attendance.TotalHours < 4)
            return AttendanceStatus.HalfDay;

        return attendance.Status;
    }

    private AttendancePolicy? GetAttendancePolicy(User user)
    {
        return _context.AttendancePolicies.FirstOrDefault(p => p.IsActive)
               ?? new AttendancePolicy { StandardStartTime = new TimeSpan(9, 0, 0) };
    }

    private static int GetWorkingDays(int year, int? month)
    {
        // Simplified — a production implementation should subtract weekends/holidays.
        return month.HasValue ? DateTime.DaysInMonth(year, month.Value) : 365;
    }

    private static int GetWeekNumber(DateTime date)
    {
        return System.Globalization.CultureInfo.CurrentCulture.Calendar
            .GetWeekOfYear(
                date,
                System.Globalization.CalendarWeekRule.FirstFourDayWeek,
                DayOfWeek.Monday);
    }

    private static string GetIpAddress() => "127.0.0.1"; // Replace with IHttpContextAccessor
}
