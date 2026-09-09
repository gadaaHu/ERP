namespace ERP.API.Domain.Entities;

public class AttendancePolicy
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public TimeSpan StandardStartTime { get; set; }
    public TimeSpan StandardEndTime { get; set; }
    public int GracePeriodMinutes { get; set; } = 15;
    public int LateThresholdMinutes { get; set; } = 30;
    public double RequiredHoursPerDay { get; set; } = 8.0;
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
    
    // Navigation Properties
    public ICollection<User> Users { get; set; } = new List<User>();
}
