using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

using ERP.API.Shared.Data;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ERP.API.Features.Payroll
{
    [Route("api/[controller]")]
    [ApiController]
    public class PayrollController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PayrollController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var payrolls = await _context.Payrolls
                .Include(p => p.Employee)
                .OrderByDescending(p => p.PeriodYear)
                .ThenByDescending(p => p.PeriodMonth)
                .ToListAsync();

            return Ok(payrolls);
        }

        [HttpGet("employee/{employeeId}")]
        public async Task<IActionResult> GetEmployeePayroll(int employeeId)
        {
            var payrolls = await _context.Payrolls
                .Where(p => p.EmployeeId == employeeId)
                .OrderByDescending(p => p.PeriodYear)
                .ThenByDescending(p => p.PeriodMonth)
                .ToListAsync();

            return Ok(payrolls);
        }

        [HttpPost("generate")]
        public async Task<IActionResult> GeneratePayroll([FromBody] GeneratePayrollRequest request)
        {
            var employees = await _context.Employees
                .Where(e => e.Status == "Active")
                .ToListAsync();

            int generatedCount = 0;

            foreach (var emp in employees)
            {
                // Check if payroll already exists for this period
                bool exists = await _context.Payrolls.AnyAsync(p => 
                    p.EmployeeId == emp.Id && 
                    p.PeriodMonth == request.Month && 
                    p.PeriodYear == request.Year);

                if (!exists)
                {
                    decimal taxRate = 0.15m; // Dummy 15% tax
                    decimal deductions = emp.Salary * taxRate;
                    decimal allowances = 500m; // Flat allowance
                    decimal net = (emp.Salary + allowances) - deductions;

                    var payroll = new Payroll
                    {
                        EmployeeId = emp.Id,
                        PeriodMonth = request.Month,
                        PeriodYear = request.Year,
                        BasicSalary = emp.Salary,
                        Allowances = allowances,
                        Deductions = deductions,
                        NetSalary = net,
                        PaymentDate = DateTime.UtcNow,
                        Status = "Pending"
                    };

                    await _context.Payrolls.AddAsync(payroll);
                    generatedCount++;
                }
            }

            await _context.SaveChangesAsync();
            return Ok(new { Message = $"Generated {generatedCount} payslips", Count = generatedCount });
        }
    }

    public class GeneratePayrollRequest
    {
        public int Month { get; set; }
        public int Year { get; set; }
    }
}
