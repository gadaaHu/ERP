namespace ERP.API.Features.Reports;

public class Report
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Module { get; set; } = string.Empty; // HR, Finance, Purchase, Assets, Services, Projects, Documents
    public string Type { get; set; } = "Report"; // Plan, Report
    public string Period { get; set; } = string.Empty; // Q1 2024, Annual 2024, etc.
    public string Status { get; set; } = "Draft"; // Draft, InProgress, Completed, Approved
    public string CreatedBy { get; set; } = string.Empty;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
    public DateTime? DueDate { get; set; }
    public int CompletionPercentage { get; set; }
}
