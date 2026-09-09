using ERP.API.Domain.Entities;
using Microsoft.Extensions.Logging;

namespace ERP.API.Application.Services;

public class NotificationService : INotificationService
{
    private readonly ILogger<NotificationService> _logger;

    public NotificationService(ILogger<NotificationService> logger)
    {
        _logger = logger;
    }

    public Task SendNotificationAsync(string userId, string title, string message)
    {
        _logger.LogInformation("Notification to {UserId}: [{Title}] {Message}", userId, title, message);
        return Task.CompletedTask;
    }

    public Task SendAttendanceNotificationAsync(User user, string action, DateTime time, double? hours = null)
    {
        var msg = hours.HasValue
            ? $"{action} at {time:HH:mm}. Total: {hours:F1}h"
            : $"{action} at {time:HH:mm}";
        _logger.LogInformation("Attendance notification to {UserId}: {Message}", user.Id, msg);
        return Task.CompletedTask;
    }

    public Task SendAttendanceCorrectionRequestAsync(User user, AttendanceRequest request)
    {
        _logger.LogInformation("Correction request notification to {UserId} for request {RequestId}", user.Id, request.Id);
        return Task.CompletedTask;
    }

    public Task SendAttendanceCorrectionResponseAsync(User user, AttendanceRequest request, bool approved)
    {
        var result = approved ? "approved" : "rejected";
        _logger.LogInformation("Correction {Result} notification to {UserId} for request {RequestId}", result, user.Id, request.Id);
        return Task.CompletedTask;
    }
}
