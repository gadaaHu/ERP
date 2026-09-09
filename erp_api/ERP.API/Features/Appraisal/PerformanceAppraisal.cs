using System;

namespace ERP.API.Features.Appraisal
{
    public class PerformanceAppraisal
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int ReviewerId { get; set; }
        public DateTime ReviewDate { get; set; }
        public int Score { get; set; } // Out of 5
        public string Goals { get; set; } = string.Empty;
        public string Comments { get; set; } = string.Empty;

        // Navigation properties
        public virtual Employee Employee { get; set; }
    }
}
