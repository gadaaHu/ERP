namespace ERP.API.Features.Services;

public class ServiceRequest
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string Priority { get; set; } = "Medium"; // Low, Medium, High, Critical
    public string Status { get; set; } = "Open"; // Open, InProgress, Resolved, Closed
    public string RequestedBy { get; set; } = string.Empty;
    public string AssignedTo { get; set; } = string.Empty;
    public string Department { get; set; } = string.Empty;
    public DateTime CreatedDate { get; set; } = DateTime.UtcNow;
    public DateTime? ResolvedDate { get; set; }
}
