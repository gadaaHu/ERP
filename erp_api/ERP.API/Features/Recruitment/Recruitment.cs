using System;
using System.Collections.Generic;

namespace ERP.API.Features.Recruitment
{
    public enum RecruitmentStatus { Open, Shortlisting, Interviewing, OfferStage, Filled, Cancelled }


    public class JobOpening
    {
        public int Id { get; private set; }
        public string JobTitle { get; private set; }
        public string JobDescription { get; private set; }
        public string JobRequirements { get; private set; }
        public int NumberOfPositions { get; private set; }
        public DateTime PostedDate { get; private set; }
        public DateTime DeadlineDate { get; private set; }
        public RecruitmentStatus Status { get; private set; }
        public int DepartmentId { get; private set; }
        public int PositionId { get; private set; }
        public int RequestedBy { get; private set; }
        public decimal? MinSalary { get; private set; }
        public decimal? MaxSalary { get; private set; }
        
        public virtual ICollection<JobApplication> Applications { get; private set; }

        private JobOpening() { }

        public JobOpening(string jobTitle, string jobDescription, string jobRequirements,
                         int numberOfPositions, DateTime deadlineDate, int departmentId,
                         int positionId, int requestedBy)
        {
            JobTitle = jobTitle;
            JobDescription = jobDescription;
            JobRequirements = jobRequirements;
            NumberOfPositions = numberOfPositions;
            PostedDate = DateTime.UtcNow;
            DeadlineDate = deadlineDate;
            Status = RecruitmentStatus.Open;
            DepartmentId = departmentId;
            PositionId = positionId;
            RequestedBy = requestedBy;
            Applications = new List<JobApplication>();
        }

        public void Close()
        {
            Status = RecruitmentStatus.Filled;
        }

        public void Cancel()
        {
            Status = RecruitmentStatus.Cancelled;
        }
    }

    public class JobApplication
    {
        public int Id { get; private set; }
        public int JobOpeningId { get; private set; }
        public string ApplicantName { get; private set; }
        public string Email { get; private set; }
        public string Phone { get; private set; }
        public string ResumeUrl { get; private set; }
        public string CoverLetter { get; private set; }
        public RecruitmentStatus Status { get; private set; }
        public DateTime AppliedDate { get; private set; }
        public DateTime? InterviewDate { get; private set; }
        public string InterviewNotes { get; private set; }
        public int? Score { get; private set; }
        public string OfferDetails { get; private set; }
        public DateTime? OfferDate { get; private set; }
        public bool? OfferAccepted { get; private set; }
        
        public virtual JobOpening JobOpening { get; private set; }

        private JobApplication() { }

        public JobApplication(int jobOpeningId, string applicantName, string email, 
                            string phone, string resumeUrl, string coverLetter)
        {
            JobOpeningId = jobOpeningId;
            ApplicantName = applicantName;
            Email = email;
            Phone = phone;
            ResumeUrl = resumeUrl;
            CoverLetter = coverLetter;
            Status = RecruitmentStatus.Shortlisting;
            AppliedDate = DateTime.UtcNow;
        }

        public void Shortlist()
        {
            Status = RecruitmentStatus.Shortlisting;
        }

        public void ScheduleInterview(DateTime interviewDate)
        {
            Status = RecruitmentStatus.Interviewing;
            InterviewDate = interviewDate;
        }

        public void SendOffer(string offerDetails)
        {
            Status = RecruitmentStatus.OfferStage;
            OfferDetails = offerDetails;
            OfferDate = DateTime.UtcNow;
        }

        public void AcceptOffer()
        {
            OfferAccepted = true;
            Status = RecruitmentStatus.Filled;
        }
    }
}
