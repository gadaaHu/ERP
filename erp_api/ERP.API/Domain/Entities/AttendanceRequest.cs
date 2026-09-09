namespace ERP.API.Domain.Entities;

public class AttendanceRequest
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string UserId { get; set; } = string.Empty;
    public User User { get; set; } = null!;
    public string AttendanceId { get; set; } = string.Empty;
    public Attendance Attendance { get; set; } = null!;
    public AttendanceRequestType RequestType { get; set; }
    public string? Reason { get; set; }
    public DateTime? NewClockInTime { get; set; }
    public DateTime? NewClockOutTime { get; set; }
    public AttendanceStatus NewStatus { get; set; }
    public AttendanceRequestStatus Status { get; set; } = AttendanceRequestStatus.Pending;
    public string? ApprovedById { get; set; }
    public User? ApprovedBy { get; set; }
    public DateTime? ApprovedDate { get; set; }
    public string? RejectionReason { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
}

public enum AttendanceRequestType
{
    Correction = 1,
    ClockIn = 2,
    ClockOut = 3,
    WFH = 4,
    BusinessTrip = 5
}

public enum AttendanceRequestStatus
{
    Pending = 1,
    Approved = 2,
    Rejected = 3,
    Cancelled = 4
}
