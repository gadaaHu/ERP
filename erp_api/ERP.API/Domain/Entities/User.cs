namespace ERP.API.Domain.Entities;

public class User
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public string EmployeeId { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string FirstName { get; set; } = string.Empty;
    public string LastName { get; set; } = string.Empty;
    public string? ManagerId { get; set; }
    public User? Manager { get; set; }
    public UserRole Role { get; set; }
    public bool IsActive { get; set; } = true;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    public DateTime? UpdatedAt { get; set; }
    
    // Navigation Properties
    public ICollection<LeaveRequest> LeaveRequests { get; set; } = new List<LeaveRequest>();
    public ICollection<LeaveBalance> LeaveBalances { get; set; } = new List<LeaveBalance>();
    public ICollection<LeaveRequest> ApprovedRequests { get; set; } = new List<LeaveRequest>();
    public ICollection<Attendance> Attendances { get; set; } = new List<Attendance>();
    public ICollection<AttendanceRequest> AttendanceRequests { get; set; } = new List<AttendanceRequest>();
    public string? AttendancePolicyId { get; set; }
    public Guid? FaceApiPersonId { get; set; }
}

public enum UserRole
{
    Employee,
    Manager,
    HR,
    Admin
}
