using ERP.API.Domain.Entities;

namespace ERP.API.Application.DTOs;

public class AttendanceDto
{
    public string Id { get; set; } = string.Empty;
    public string UserId { get; set; } = string.Empty;
    public string EmployeeName { get; set; } = string.Empty;
    public DateTime Date { get; set; }
    public DateTime? ClockInTime { get; set; }
    public DateTime? ClockOutTime { get; set; }
    public double? TotalHours { get; set; }
    public double? OvertimeHours { get; set; }
    public string Status { get; set; } = string.Empty;
    public string Type { get; set; } = string.Empty;
    public string? ClockInLocation { get; set; }
    public string? ClockOutLocation { get; set; }
    public string? Notes { get; set; }
    public bool IsApproved { get; set; }
    public string? ApprovedBy { get; set; }
    public string? FormattedDate => Date.ToString("dd/MM/yyyy");
    public string? FormattedClockIn => ClockInTime?.ToString("hh:mm tt");
    public string? FormattedClockOut => ClockOutTime?.ToString("hh:mm tt");
}

public class ClockInDto
{
    public string UserId { get; set; } = string.Empty;
    public DateTime? ClockInTime { get; set; }
    public string? Location { get; set; }
    public double? Latitude { get; set; }
    public double? Longitude { get; set; }
    public string? DeviceInfo { get; set; }
    public string? Notes { get; set; }
}

public class ClockOutDto
{
    public string UserId { get; set; } = string.Empty;
    public required string AttendanceId { get; set; }
    public DateTime? ClockOutTime { get; set; }
    public string? Location { get; set; }
    public double? Latitude { get; set; }
    public double? Longitude { get; set; }
    public string? Notes { get; set; }
}

public class AttendanceCorrectionDto
{
    public required string AttendanceId { get; set; }
    public DateTime? NewClockInTime { get; set; }
    public DateTime? NewClockOutTime { get; set; }
    public AttendanceStatus? NewStatus { get; set; }
    public required string Reason { get; set; }
}

public class AttendanceStatisticsDto
{
    public int TotalDays { get; set; }
    public int PresentDays { get; set; }
    public int AbsentDays { get; set; }
    public int LateDays { get; set; }
    public int HalfDays { get; set; }
    public int LeaveDays { get; set; }
    public int HolidayDays { get; set; }
    public int WorkFromHomeDays { get; set; }
    public int BusinessTripDays { get; set; }
    public double AverageHours { get; set; }
    public double TotalOvertime { get; set; }
    public double AttendancePercentage { get; set; }
    public Dictionary<string, int> MonthlyBreakdown { get; set; } = new();
    public Dictionary<string, double> WeeklyHours { get; set; } = new();
}

public class AttendanceSummaryDto
{
    public DateTime Date { get; set; }
    public string DayOfWeek { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public string ClockIn { get; set; } = string.Empty;
    public string ClockOut { get; set; } = string.Empty;
    public double Hours { get; set; }
    public string? Notes { get; set; }
}
