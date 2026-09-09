namespace ERP.API.Domain.Entities;

public class LeaveType
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public int DefaultDays { get; set; }
    public bool IsPaid { get; set; }
    public bool RequiresApproval { get; set; } = true;
    public string? IconCode { get; set; }
    public string? ColorCode { get; set; }
    public int MaxConsecutiveDays { get; set; }
    public bool IsActive { get; set; } = true;
}
