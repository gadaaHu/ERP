using ERP.API.Domain.Entities;

namespace ERP.API.Application.Services;

public interface INotificationService
{
    Task SendNotificationAsync(string userId, string title, string message);
    Task SendAttendanceNotificationAsync(User user, string action, DateTime time, double? hours = null);
    Task SendAttendanceCorrectionRequestAsync(User user, AttendanceRequest request);
    Task SendAttendanceCorrectionResponseAsync(User user, AttendanceRequest request, bool approved);
}
