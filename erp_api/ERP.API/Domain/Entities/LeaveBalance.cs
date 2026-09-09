namespace ERP.API.Domain.Entities;

public class LeaveBalance
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string UserId { get; set; } = string.Empty;
    public User User { get; set; } = null!;
    public string LeaveTypeId { get; set; } = string.Empty;
    public LeaveType LeaveType { get; set; } = null!;
    public int TotalDays { get; set; }
    public int UsedDays { get; set; }
    public int PendingDays { get; set; }
    public int RemainingDays => TotalDays - (UsedDays + PendingDays);
    public DateTime Year { get; set; }
    public DateTime? LastUpdated { get; set; }
}
