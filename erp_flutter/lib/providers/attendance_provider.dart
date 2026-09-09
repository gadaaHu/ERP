import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models/attendance.dart';
import '../core/models/attendance_dto.dart';

// Re-export apiServiceProvider from leave_provider to avoid duplication
import 'leave_provider.dart' show apiServiceProvider;
export 'leave_provider.dart' show apiServiceProvider;

// ─────────────────────────────────────────────
// Attendance list provider (own attendance)
// ─────────────────────────────────────────────
class AttendanceNotifier extends AsyncNotifier<List<AttendanceDto>> {
  DateTime? _fromDate;
  DateTime? _toDate;

  void setDateRange(DateTime? from, DateTime? to) {
    _fromDate = from;
    _toDate = to;
  }

  @override
  Future<List<AttendanceDto>> build() async {
    final api = ref.watch(apiServiceProvider);
    return api.getUserAttendance(fromDate: _fromDate, toDate: _toDate);
  }

  Future<AttendanceDto> clockIn({
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    final api = ref.read(apiServiceProvider);
    final dto = await api.clockIn(
      location: location,
      latitude: latitude,
      longitude: longitude,
    );
    final currentList = state.value ?? [];
    state = AsyncData([dto, ...currentList]);
    return dto;
  }

  Future<AttendanceDto> clockOut(
    String attendanceId, {
    String? location,
  }) async {
    final api = ref.read(apiServiceProvider);
    final dto = await api.clockOut(attendanceId, location: location);
    final currentList = state.value ?? [];
    state = AsyncData([
      for (final a in currentList)
        if (a.id == attendanceId) dto else a,
    ]);
    return dto;
  }

  /// Clock in using face recognition image
  Future<AttendanceDto> clockInWithFace({
    required String imagePath,
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    final api = ref.read(apiServiceProvider);
    final dto = await api.clockInWithFace(
      imagePath: imagePath,
      location: location,
      latitude: latitude,
      longitude: longitude,
    );
    final currentList = state.value ?? [];
    state = AsyncData([dto, ...currentList]);
    return dto;
  }

  Future<void> requestCorrection(
    String attendanceId, {
    DateTime? newClockIn,
    DateTime? newClockOut,
    AttendanceStatus? newStatus,
    required String reason,
  }) async {
    final api = ref.read(apiServiceProvider);
    await api.requestAttendanceCorrection(
      attendanceId,
      newClockIn: newClockIn,
      newClockOut: newClockOut,
      newStatus: newStatus,
      reason: reason,
    );
    // Refresh list
    ref.invalidateSelf();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

final attendanceProvider =
    AsyncNotifierProvider<AttendanceNotifier, List<AttendanceDto>>(
  AttendanceNotifier.new,
);

// ─────────────────────────────────────────────
// Today's attendance summary
// ─────────────────────────────────────────────
final todayAttendanceProvider =
    FutureProvider.autoDispose<AttendanceSummary>((ref) async {
  final api = ref.watch(apiServiceProvider);
  return api.getTodayAttendance();
});

// ─────────────────────────────────────────────
// Attendance statistics
// ─────────────────────────────────────────────
final attendanceStatisticsProvider =
    FutureProvider.autoDispose.family<AttendanceStatistics, ({int year, int? month})>(
  (ref, params) async {
    final api = ref.watch(apiServiceProvider);
    return api.getAttendanceStatistics(params.year, month: params.month);
  },
);

// ─────────────────────────────────────────────
// Holidays
// ─────────────────────────────────────────────
final holidaysProvider =
    FutureProvider.autoDispose.family<List<Holiday>, ({int year, String? region})>(
  (ref, params) async {
    final api = ref.watch(apiServiceProvider);
    return api.getHolidays(params.year, region: params.region);
  },
);

// ─────────────────────────────────────────────
// Team attendance (Manager/HR/Admin)
// ─────────────────────────────────────────────
class TeamAttendanceNotifier extends AsyncNotifier<List<AttendanceDto>> {
  @override
  Future<List<AttendanceDto>> build() async {
    final api = ref.watch(apiServiceProvider);
    return api.getTeamAttendance();
  }

  Future<void> approveRequest(
    String requestId,
    bool approve, {
    String? reason,
  }) async {
    final api = ref.read(apiServiceProvider);
    await api.processAttendanceRequest(requestId, approve, reason: reason);
    ref.invalidateSelf();
  }
}

final teamAttendanceProvider =
    AsyncNotifierProvider<TeamAttendanceNotifier, List<AttendanceDto>>(
  TeamAttendanceNotifier.new,
);
