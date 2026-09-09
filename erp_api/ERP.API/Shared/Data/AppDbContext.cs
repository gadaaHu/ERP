using Microsoft.EntityFrameworkCore;
using ERP.API.Domain.Entities;
using FeaturesLeaves = ERP.API.Features.Leaves;

namespace ERP.API.Shared.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Employee> Employees => Set<Employee>();
    public DbSet<Transaction> Transactions => Set<Transaction>();
    public DbSet<PurchaseOrder> PurchaseOrders => Set<PurchaseOrder>();
    public DbSet<Asset> Assets => Set<Asset>();
    public DbSet<ServiceRequest> ServiceRequests => Set<ServiceRequest>();
    public DbSet<Project> Projects => Set<Project>();
    public DbSet<Document> Documents => Set<Document>();
    public DbSet<Report> Reports => Set<Report>();
    public DbSet<FeaturesLeaves.LeaveRequest> LeaveRequests => Set<FeaturesLeaves.LeaveRequest>();
    public DbSet<JobOpening> JobOpenings => Set<JobOpening>();
    public DbSet<JobApplication> JobApplications => Set<JobApplication>();
    public DbSet<Attendance> Attendances => Set<Attendance>();
    public DbSet<Payroll> Payrolls => Set<Payroll>();
    public DbSet<PerformanceAppraisal> PerformanceAppraisals => Set<PerformanceAppraisal>();
    public DbSet<TrainingProgram> TrainingPrograms => Set<TrainingProgram>();
    public DbSet<TrainingEnrollment> TrainingEnrollments => Set<TrainingEnrollment>();
    public DbSet<OnboardingTask> OnboardingTasks => Set<OnboardingTask>();
    public DbSet<User> Users => Set<User>();
    public DbSet<AttendancePolicy> AttendancePolicies => Set<AttendancePolicy>();
    public DbSet<AttendanceRequest> AttendanceRequests => Set<AttendanceRequest>();
    public DbSet<Holiday> Holidays => Set<Holiday>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Employee>(e =>
        {
            e.Property(x => x.Salary).HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<Transaction>(e =>
        {
            e.Property(x => x.Amount).HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<PurchaseOrder>(e =>
        {
            e.Property(x => x.TotalAmount).HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<Asset>(e =>
        {
            e.Property(x => x.PurchasePrice).HasColumnType("decimal(18,2)");
            e.Property(x => x.CurrentValue).HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<Project>(e =>
        {
            e.Property(x => x.Budget).HasColumnType("decimal(18,2)");
            e.Property(x => x.SpentAmount).HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<Payroll>(e =>
        {
            e.Property(x => x.BasicSalary).HasColumnType("decimal(18,2)");
            e.Property(x => x.Allowances).HasColumnType("decimal(18,2)");
            e.Property(x => x.Deductions).HasColumnType("decimal(18,2)");
            e.Property(x => x.NetSalary).HasColumnType("decimal(18,2)");
        });

        modelBuilder.Entity<FeaturesLeaves.LeaveRequest>(e =>
        {
            e.HasOne(x => x.Employee)
                .WithMany()
                .HasForeignKey(x => x.EmployeeId)
                .OnDelete(DeleteBehavior.Restrict);

            e.HasOne(x => x.Approver)
                .WithMany()
                .HasForeignKey(x => x.ApprovedBy)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<Attendance>(e =>
        {
            e.HasOne(x => x.User)
                .WithMany()
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            e.HasOne(x => x.ApprovedBy)
                .WithMany()
                .HasForeignKey(x => x.ApprovedById)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<AttendanceRequest>(e =>
        {
            e.HasOne(x => x.User)
                .WithMany(u => u.AttendanceRequests)
                .HasForeignKey(x => x.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            e.HasOne(x => x.ApprovedBy)
                .WithMany()
                .HasForeignKey(x => x.ApprovedById)
                .OnDelete(DeleteBehavior.Restrict);
        });

        modelBuilder.Entity<ERP.API.Domain.Entities.LeaveRequest>(e =>
        {
            e.HasOne(x => x.Employee)
                .WithMany(u => u.LeaveRequests)
                .HasForeignKey(x => x.EmployeeId)
                .OnDelete(DeleteBehavior.Restrict);

            e.HasOne(x => x.ApprovedBy)
                .WithMany(u => u.ApprovedRequests)
                .HasForeignKey(x => x.ApprovedById)
                .OnDelete(DeleteBehavior.Restrict);
        });
    }
}
