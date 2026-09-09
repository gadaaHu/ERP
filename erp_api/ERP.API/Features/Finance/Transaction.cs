namespace ERP.API.Features.Finance;

public class Transaction
{
    public int Id { get; set; }
    public string Type { get; set; } = string.Empty; // Income, Expense
    public decimal Amount { get; set; }
    public string Category { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public string ReferenceNumber { get; set; } = string.Empty;
    public DateTime Date { get; set; }
    public string Status { get; set; } = "Completed"; // Pending, Completed, Cancelled
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
