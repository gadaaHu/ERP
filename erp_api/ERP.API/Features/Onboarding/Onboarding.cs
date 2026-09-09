using System;

namespace ERP.API.Features.Onboarding
{
    public class OnboardingTask
    {
        public int Id { get; set; }
        public int EmployeeId { get; set; }
        public string TaskName { get; set; } = string.Empty;
        public string Description { get; set; } = string.Empty;
        public string Category { get; set; } = "General"; // IT Setup, HR Paperwork, Training, Orientation
        public string AssignedTo { get; set; } = string.Empty;
        public DateTime DueDate { get; set; }
        public bool IsCompleted { get; set; } = false;
        public DateTime? CompletedAt { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

        public virtual Employee Employee { get; set; }
    }
}
