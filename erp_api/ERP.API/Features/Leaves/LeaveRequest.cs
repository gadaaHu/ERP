using System;


namespace ERP.API.Features.Leaves
{
    public enum LeaveType { Sick, Vacation, Personal, Maternity, Unpaid }
    public enum LeaveStatus { Pending, Approved, Rejected, Cancelled }

    public class LeaveRequest
    {
        public int Id { get; private set; }
        public int EmployeeId { get; private set; }
        public LeaveType LeaveType { get; private set; }
        public DateTime StartDate { get; private set; }
        public DateTime EndDate { get; private set; }
        public int TotalDays { get; private set; }
        public string Reason { get; private set; }
        public LeaveStatus Status { get; private set; }
        public DateTime RequestDate { get; private set; }
        public DateTime? ApprovedDate { get; private set; }
        public int? ApprovedBy { get; private set; }
        public string RejectionReason { get; private set; }
        public string AttachmentUrl { get; private set; }
        
        // Navigation Property
        public virtual Employee Employee { get; private set; }
        public virtual Employee Approver { get; private set; }

        private LeaveRequest() { }

        public LeaveRequest(int employeeId, LeaveType leaveType, DateTime startDate, 
                           DateTime endDate, string reason)
        {
            EmployeeId = employeeId;
            LeaveType = leaveType;
            StartDate = startDate;
            EndDate = endDate;
            TotalDays = CalculateBusinessDays(startDate, endDate);
            Reason = reason;
            Status = LeaveStatus.Pending;
            RequestDate = DateTime.UtcNow;
        }

        public void Approve(int approverId)
        {
            if (Status != LeaveStatus.Pending)
                throw new InvalidOperationException("Leave request is not pending");
            
            Status = LeaveStatus.Approved;
            ApprovedBy = approverId;
            ApprovedDate = DateTime.UtcNow;
        }

        public void Reject(int approverId, string reason)
        {
            if (Status != LeaveStatus.Pending)
                throw new InvalidOperationException("Leave request is not pending");
            
            Status = LeaveStatus.Rejected;
            RejectionReason = reason;
            ApprovedBy = approverId;
            ApprovedDate = DateTime.UtcNow;
        }

        public void Cancel()
        {
            if (Status == LeaveStatus.Approved || Status == LeaveStatus.Pending)
                Status = LeaveStatus.Cancelled;
        }

        private int CalculateBusinessDays(DateTime start, DateTime end)
        {
            int days = 0;
            for (DateTime date = start; date <= end; date = date.AddDays(1))
            {
                if (date.DayOfWeek != DayOfWeek.Saturday && date.DayOfWeek != DayOfWeek.Sunday)
                    days++;
            }
            return days;
        }
    }
}
