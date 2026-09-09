using System;

namespace ERP.API.Features.Payroll
{
    public class Payroll
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int PeriodMonth { get; set; }
        public int PeriodYear { get; set; }
        public decimal BasicSalary { get; set; }
        public decimal Allowances { get; set; }
        public decimal Deductions { get; set; }
        public decimal NetSalary { get; set; }
        public DateTime PaymentDate { get; set; }
        public string Status { get; set; } = "Pending"; // Pending, Paid

        // Navigation property
        public virtual Employee Employee { get; set; }
    }
}
