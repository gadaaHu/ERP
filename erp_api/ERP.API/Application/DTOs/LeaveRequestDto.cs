namespace ERP.API.Application.DTOs;

public class LeaveRequestDto
{
    public string Id { get; set; } = string.Empty;
    public string EmployeeId { get; set; } = string.Empty;
    public string LeaveTypeId { get; set; } = string.Empty;
    public string LeaveTypeName { get; set; } = string.Empty;
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public int TotalDays { get; set; }
    public string Reason { get; set; } = string.Empty;
    public string Status { get; set; } = string.Empty;
    public DateTime RequestDate { get; set; }
    public DateTime? ApprovedDate { get; set; }
    public string? ApprovedBy { get; set; }
    public string? RejectionReason { get; set; }
    public bool IsHalfDay { get; set; }
    public string? AttachmentUrl { get; set; }
    public EmployeeDto? Employee { get; set; }
    public EmployeeDto? Approver { get; set; }
}

public class CreateLeaveRequestDto
{
    public required string LeaveTypeId { get; set; }
    public required DateTime StartDate { get; set; }
    public required DateTime EndDate { get; set; }
    public required string Reason { get; set; }
    public bool IsHalfDay { get; set; }
    public string? AttachmentUrl { get; set; }
}

public class ApproveLeaveRequestDto
{
    public required bool IsApproved { get; set; }
    public string? RejectionReason { get; set; }
}

public class EmployeeDto
{
    public string Id { get; set; } = string.Empty;
    public string EmployeeId { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public string FullName => $"{FirstName} {LastName}";
    public string? ManagerId { get; set; }
    public string Role { get; set; } = string.Empty;
}

public class LeaveBalanceDto
{
    public string LeaveTypeId { get; set; } = string.Empty;
    public string LeaveTypeName { get; set; } = string.Empty;
    public int TotalDays { get; set; }
    public int UsedDays { get; set; }
    public int PendingDays { get; set; }
    public int RemainingDays { get; set; }
    public int PercentageUsed => TotalDays > 0 ? (UsedDays * 100) / TotalDays : 0;
}

public class LeaveStatisticsDto
{
    public int TotalRequests { get; set; }
    public int PendingRequests { get; set; }
    public int ApprovedRequests { get; set; }
    public int RejectedRequests { get; set; }
    public Dictionary<string, int> LeaveTypeUsage { get; set; } = new();
    public Dictionary<string, decimal> MonthlyTrends { get; set; } = new();
}
