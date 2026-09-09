import 'package:freezed_annotation/freezed_annotation.dart';
import 'attendance.dart';

part 'attendance_dto.freezed.dart';
part 'attendance_dto.g.dart';

// ---------------------------------------------------------------------------
// AttendanceDto — read model returned by the API
// ---------------------------------------------------------------------------
@freezed
abstract class AttendanceDto with _$AttendanceDto {
  const AttendanceDto._();

  factory AttendanceDto({
    required String id,
    required String userId,
    required String employeeName,
    required DateTime date,
    DateTime? clockInTime,
    DateTime? clockOutTime,
    double? totalHours,
    double? overtimeHours,
    required String status,
    required String type,
    String? clockInLocation,
    String? clockOutLocation,
    String? notes,
    @Default(false) bool isApproved,
    String? approvedBy,
    String? formattedDate,
    String? formattedClockIn,
    String? formattedClockOut,
  }) = _AttendanceDto;

  factory AttendanceDto.fromJson(Map<String, dynamic> json) =>
      _$AttendanceDtoFromJson(json);

  /// Parses status string into the enum (safe fallback to absent).
  AttendanceStatus get attendanceStatus {
    return AttendanceStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == status.toLowerCase(),
      orElse: () => AttendanceStatus.absent,
    );
  }
}

// ---------------------------------------------------------------------------
// ClockInRequest — sent when employee clocks in
// ---------------------------------------------------------------------------
@freezed
abstract class ClockInRequest with _$ClockInRequest {
  factory ClockInRequest({
    required String userId,
    DateTime? clockInTime,
    String? location,
    double? latitude,
    double? longitude,
    String? deviceInfo,
    String? notes,
  }) = _ClockInRequest;

  factory ClockInRequest.fromJson(Map<String, dynamic> json) =>
      _$ClockInRequestFromJson(json);
}

// ---------------------------------------------------------------------------
// ClockOutRequest — sent when employee clocks out
// ---------------------------------------------------------------------------
@freezed
abstract class ClockOutRequest with _$ClockOutRequest {
  factory ClockOutRequest({
    required String userId,
    required String attendanceId,
    DateTime? clockOutTime,
    String? location,
    double? latitude,
    double? longitude,
    String? notes,
  }) = _ClockOutRequest;

  factory ClockOutRequest.fromJson(Map<String, dynamic> json) =>
      _$ClockOutRequestFromJson(json);
}

// ---------------------------------------------------------------------------
// AttendanceCorrectionRequest — submitted for record correction
// ---------------------------------------------------------------------------
@freezed
abstract class AttendanceCorrectionRequest with _$AttendanceCorrectionRequest {
  factory AttendanceCorrectionRequest({
    required String attendanceId,
    DateTime? newClockInTime,
    DateTime? newClockOutTime,
    AttendanceStatus? newStatus,
    required String reason,
  }) = _AttendanceCorrectionRequest;

  factory AttendanceCorrectionRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceCorrectionRequestFromJson(json);
}


