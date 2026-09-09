// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceRequest _$AttendanceRequestFromJson(Map<String, dynamic> json) =>
    _AttendanceRequest(
      id: json['id'] as String,
      userId: json['userId'] as String,
      attendanceId: json['attendanceId'] as String,
      requestType: $enumDecode(
        _$AttendanceRequestTypeEnumMap,
        json['requestType'],
        unknownValue: AttendanceRequestType.correction,
      ),
      status: $enumDecode(
        _$AttendanceRequestStatusEnumMap,
        json['status'],
        unknownValue: AttendanceRequestStatus.pending,
      ),
      reason: json['reason'] as String?,
      newClockInTime: json['newClockInTime'] == null
          ? null
          : DateTime.parse(json['newClockInTime'] as String),
      newClockOutTime: json['newClockOutTime'] == null
          ? null
          : DateTime.parse(json['newClockOutTime'] as String),
      approvedById: json['approvedById'] as String?,
      approvedDate: json['approvedDate'] == null
          ? null
          : DateTime.parse(json['approvedDate'] as String),
      rejectionReason: json['rejectionReason'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AttendanceRequestToJson(_AttendanceRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'attendanceId': instance.attendanceId,
      'requestType': _$AttendanceRequestTypeEnumMap[instance.requestType]!,
      'status': _$AttendanceRequestStatusEnumMap[instance.status]!,
      'reason': instance.reason,
      'newClockInTime': instance.newClockInTime?.toIso8601String(),
      'newClockOutTime': instance.newClockOutTime?.toIso8601String(),
      'approvedById': instance.approvedById,
      'approvedDate': instance.approvedDate?.toIso8601String(),
      'rejectionReason': instance.rejectionReason,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$AttendanceRequestTypeEnumMap = {
  AttendanceRequestType.correction: 1,
  AttendanceRequestType.clockIn: 2,
  AttendanceRequestType.clockOut: 3,
  AttendanceRequestType.wfh: 4,
  AttendanceRequestType.businessTrip: 5,
};

const _$AttendanceRequestStatusEnumMap = {
  AttendanceRequestStatus.pending: 1,
  AttendanceRequestStatus.approved: 2,
  AttendanceRequestStatus.rejected: 3,
  AttendanceRequestStatus.cancelled: 4,
};
