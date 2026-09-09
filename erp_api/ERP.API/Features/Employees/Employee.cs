namespace ERP.API.Features.Employees;

public class Employee
{
    public int Id { get; set; }
    public string FullName { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
    public string Department { get; set; } = string.Empty;
    public string Position { get; set; } = string.Empty;
    public DateTime HireDate { get; set; }
    public string Status { get; set; } = "Active"; // Active, OnLeave, Terminated
    public decimal Salary { get; set; }
    public string Gender { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public string? PhotoUrl { get; set; }
    public Guid? FaceApiPersonId { get; set; }
}

