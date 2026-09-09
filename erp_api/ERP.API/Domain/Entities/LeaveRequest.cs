namespace ERP.API.Domain.Entities;

public class LeaveRequest
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string EmployeeId { get; set; } = string.Empty;
    public User Employee { get; set; } = null!;
    public string LeaveTypeId { get; set; } = string.Empty;
    public LeaveType LeaveType { get; set; } = null!;
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public int TotalDays { get; set; }
    public string Reason { get; set; } = string.Empty;
    public LeaveStatus Status { get; set; } = LeaveStatus.Pending;
    public DateTime RequestDate { get; set; } = DateTime.UtcNow;
    public DateTime? ApprovedDate { get; set; }
    public string? ApprovedById { get; set; }
    public User? ApprovedBy { get; set; }
    public string? RejectionReason { get; set; }
    public bool IsHalfDay { get; set; }
    public string? AttachmentUrl { get; set; }
    public DateTime? UpdatedAt { get; set; }
}

public enum LeaveStatus
{
    Pending = 1,
    Approved = 2,
    Rejected = 3,
    Cancelled = 4
}
