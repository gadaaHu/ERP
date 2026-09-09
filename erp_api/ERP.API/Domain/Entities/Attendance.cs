namespace ERP.API.Domain.Entities;

public class Attendance
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string UserId { get; set; } = string.Empty;
    public User User { get; set; } = null!;
    public DateTime Date { get; set; }
    public DateTime? ClockInTime { get; set; }
    public DateTime? ClockOutTime { get; set; }
    public double? TotalHours { get; set; }
    public double? OvertimeHours { get; set; }
    public AttendanceStatus Status { get; set; }
    public AttendanceType Type { get; set; }
    public string? ClockInLocation { get; set; }
    public string? ClockOutLocation { get; set; }
    public double? ClockInLatitude { get; set; }
    public double? ClockInLongitude { get; set; }
    public double? ClockOutLatitude { get; set; }
    public double? ClockOutLongitude { get; set; }
    public string? Notes { get; set; }
    public string? IpAddress { get; set; }
    public string? DeviceInfo { get; set; }
    public bool IsApproved { get; set; }
    public string? ApprovedById { get; set; }
    public User? ApprovedBy { get; set; }
    public DateTime? ApprovedDate { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
    
    // Navigation Properties
    public ICollection<AttendanceRequest> Requests { get; set; } = new List<AttendanceRequest>();
}

public enum AttendanceStatus
{
    Present = 1,
    Absent = 2,
    Late = 3,
    EarlyLeave = 4,
    HalfDay = 5,
    Holiday = 6,
    Leave = 7,
    WorkFromHome = 8,
    OnBusinessTrip = 9
}

public enum AttendanceType
{
    Regular = 1,
    Overtime = 2,
    Compensatory = 3,
    Holiday = 4,
    Sick = 5
}
