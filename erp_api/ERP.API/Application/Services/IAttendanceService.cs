using ERP.API.Application.DTOs;
using ERP.API.Domain.Entities;

namespace ERP.API.Application.Services;

public interface IAttendanceService
{
    Task<AttendanceDto> ClockInAsync(ClockInDto clockInDto);
    Task<AttendanceDto> ClockOutAsync(ClockOutDto clockOutDto);
    Task<AttendanceDto> GetAttendanceByIdAsync(string id);
    Task<IEnumerable<AttendanceDto>> GetUserAttendanceAsync(string userId, DateTime? fromDate, DateTime? toDate);
    Task<AttendanceStatisticsDto> GetAttendanceStatisticsAsync(string userId, int year, int? month);
    Task<AttendanceDto> CorrectAttendanceAsync(string userId, AttendanceCorrectionDto correctionDto);
    Task<IEnumerable<AttendanceRequest>> GetPendingAttendanceRequestsAsync(string managerId);
    Task<AttendanceRequest> ApproveAttendanceRequestAsync(string requestId, string managerId, bool approve, string? reason);
    Task<IEnumerable<Holiday>> GetHolidaysAsync(int year, string? region = null);
    Task<bool> CheckAttendanceStatusAsync(string userId, DateTime date);
    Task<AttendanceSummaryDto> GetTodaySummaryAsync(string userId);
    Task<double> CalculateOvertimeAsync(string userId, DateTime fromDate, DateTime toDate);
}
