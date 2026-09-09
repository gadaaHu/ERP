using System;
using System.Collections.Generic;

namespace ERP.API.Features.Training
{
    public class TrainingProgram
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Trainer { get; set; } = string.Empty;
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int MaxParticipants { get; set; }
        public string Status { get; set; } = "Upcoming"; // Upcoming, Ongoing, Completed, Cancelled
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public virtual ICollection<TrainingEnrollment> Enrollments { get; set; } = new List<TrainingEnrollment>();
    }

    public class TrainingEnrollment
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public int TrainingProgramId { get; set; }
        public string Status { get; set; } = "Enrolled"; // Enrolled, Completed, Dropped
        public DateTime EnrolledAt { get; set; } = DateTime.UtcNow;
        public DateTime? CompletionDate { get; set; }
        public string? CertificateUrl { get; set; }

        public virtual Employee Employee { get; set; }
        public virtual TrainingProgram TrainingProgram { get; set; }
    }
}
