namespace ERP.API.Domain.Entities;

public class Holiday
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public DateTime Date { get; set; }
    public bool IsRecurring { get; set; }
    public int? RecurringYear { get; set; }
    public HolidayType Type { get; set; }
    public bool IsActive { get; set; } = true;
    public string? Region { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}

public enum HolidayType
{
    Public = 1,
    Company = 2,
    Religious = 3,
    Optional = 4
}
