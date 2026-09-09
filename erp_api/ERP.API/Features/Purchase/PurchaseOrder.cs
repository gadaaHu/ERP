namespace ERP.API.Features.Purchase;

public class PurchaseOrder
{
    public int Id { get; set; }
    public string OrderNumber { get; set; } = string.Empty;
    public string Vendor { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public decimal TotalAmount { get; set; }
    public string Status { get; set; } = "Draft"; // Draft, Pending, Approved, Received, Cancelled
    public DateTime OrderDate { get; set; }
    public DateTime? DeliveryDate { get; set; }
    public string RequestedBy { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
