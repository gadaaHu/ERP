import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_request.freezed.dart';
part 'attendance_request.g.dart';

enum AttendanceRequestType {
  @JsonValue(1) correction,
  @JsonValue(2) clockIn,
  @JsonValue(3) clockOut,
  @JsonValue(4) wfh,
  @JsonValue(5) businessTrip,
}

enum AttendanceRequestStatus {
  @JsonValue(1) pending,
  @JsonValue(2) approved,
  @JsonValue(3) rejected,
  @JsonValue(4) cancelled,
}

@freezed
abstract class AttendanceRequest with _$AttendanceRequest {
  const AttendanceRequest._();

  factory AttendanceRequest({
    required String id,
    required String userId,
    required String attendanceId,
    @JsonKey(unknownEnumValue: AttendanceRequestType.correction)
    required AttendanceRequestType requestType,
    @JsonKey(unknownEnumValue: AttendanceRequestStatus.pending)
    required AttendanceRequestStatus status,
    String? reason,
    DateTime? newClockInTime,
    DateTime? newClockOutTime,
    String? approvedById,
    DateTime? approvedDate,
    String? rejectionReason,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _AttendanceRequest;

  factory AttendanceRequest.fromJson(Map<String, dynamic> json) =>
      _$AttendanceRequestFromJson(json);

  String get statusLabel => switch (status) {
    AttendanceRequestStatus.pending   => 'Pending',
    AttendanceRequestStatus.approved  => 'Approved',
    AttendanceRequestStatus.rejected  => 'Rejected',
    AttendanceRequestStatus.cancelled => 'Cancelled',
  };
}
