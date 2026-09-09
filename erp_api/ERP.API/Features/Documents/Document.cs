namespace ERP.API.Features.Documents;

public class Document
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty; // Policy, Contract, Report, Memo, Letter, Manual
    public string FileType { get; set; } = string.Empty; // PDF, DOCX, XLSX, PPTX
    public long FileSize { get; set; } // in bytes
    public string UploadedBy { get; set; } = string.Empty;
    public DateTime UploadDate { get; set; }
    public int Version { get; set; } = 1;
    public string Status { get; set; } = "Active"; // Active, Archived, PendingReview, Draft
    public string Department { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
