namespace ERP.API.Features.Projects;

public class Project
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public DateTime StartDate { get; set; }
    public DateTime EndDate { get; set; }
    public decimal Budget { get; set; }
    public decimal SpentAmount { get; set; }
    public int Progress { get; set; } // 0-100 percentage
    public string Status { get; set; } = "Planning"; // Planning, InProgress, Completed, OnHold, Cancelled
    public string Manager { get; set; } = string.Empty;
    public int TeamSize { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
