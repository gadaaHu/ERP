namespace ERP.API.Features.Assets;

public class Asset
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string AssetCode { get; set; } = string.Empty;
    public string Category { get; set; } = string.Empty; // Vehicle, Furniture, IT Equipment, Building, Machinery
    public string Location { get; set; } = string.Empty;
    public DateTime PurchaseDate { get; set; }
    public decimal PurchasePrice { get; set; }
    public decimal CurrentValue { get; set; }
    public string Status { get; set; } = "Active"; // Active, UnderMaintenance, Disposed, Reserved
    public string AssignedTo { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
