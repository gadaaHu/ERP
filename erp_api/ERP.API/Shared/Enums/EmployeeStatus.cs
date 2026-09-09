namespace ERP.API.Shared.Enums
{
    public enum EmployeeStatus
    {
        Active = 1,
        OnLeave = 2,
        Suspended = 3,
        Terminated = 4,
        Retired = 5,
        Probation = 6
    }

    public enum LeaveType
    {
        Annual = 1,
        Sick = 2,
        Maternity = 3,
        Paternity = 4,
        Unpaid = 5,
        Compensatory = 6,
        Emergency = 7
    }

    public enum LeaveStatus
    {
        Pending = 1,
        Approved = 2,
        Rejected = 3,
        Cancelled = 4
    }

    public enum AttendanceStatus
    {
        Present = 1,
        Absent = 2,
        Late = 3,
        Leave = 4,
        Holiday = 5
    }

    public enum RecruitmentStatus
    {
        Draft = 1,
        Open = 2,
        Shortlisting = 3,
        Interviewing = 4,
        OfferStage = 5,
        Filled = 6,
        Cancelled = 7
    }

    public enum DisciplinaryType
    {
        Warning = 1,
        Suspension = 2,
        Demotion = 3,
        Termination = 4
    }

    public enum GrievanceStatus
    {
        Submitted = 1,
        Investigating = 2,
        Resolved = 3,
        Dismissed = 4
    }

    public enum TrainingStatus
    {
        Planned = 1,
        InProgress = 2,
        Completed = 3,
        Cancelled = 4
    }

    public enum PerformanceRating
    {
        Unsatisfactory = 1,
        NeedsImprovement = 2,
        MeetsExpectations = 3,
        ExceedsExpectations = 4,
        Outstanding = 5
    }

    public enum TerminationReason
    {
        Resignation = 1,
        Retirement = 2,
        Dismissal = 3,
        Redundancy = 4,
        EndOfContract = 5,
        Death = 6
    }

    public enum PayrollStatus
    {
        Draft = 1,
        Processing = 2,
        Approved = 3,
        Paid = 4,
        Rejected = 5
    }
}
