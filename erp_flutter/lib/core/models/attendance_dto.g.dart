// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceDto _$AttendanceDtoFromJson(Map<String, dynamic> json) =>
    _AttendanceDto(
      id: json['id'] as String,
      userId: json['userId'] as String,
      employeeName: json['employeeName'] as String,
      date: DateTime.parse(json['date'] as String),
      clockInTime: json['clockInTime'] == null
          ? null
          : DateTime.parse(json['clockInTime'] as String),
      clockOutTime: json['clockOutTime'] == null
          ? null
          : DateTime.parse(json['clockOutTime'] as String),
      totalHours: (json['totalHours'] as num?)?.toDouble(),
      overtimeHours: (json['overtimeHours'] as num?)?.toDouble(),
      status: json['status'] as String,
      type: json['type'] as String,
      clockInLocation: json['clockInLocation'] as String?,
      clockOutLocation: json['clockOutLocation'] as String?,
      notes: json['notes'] as String?,
      isApproved: json['isApproved'] as bool? ?? false,
      approvedBy: json['approvedBy'] as String?,
      formattedDate: json['formattedDate'] as String?,
      formattedClockIn: json['formattedClockIn'] as String?,
      formattedClockOut: json['formattedClockOut'] as String?,
    );

Map<String, dynamic> _$AttendanceDtoToJson(_AttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'employeeName': instance.employeeName,
      'date': instance.date.toIso8601String(),
      'clockInTime': instance.clockInTime?.toIso8601String(),
      'clockOutTime': instance.clockOutTime?.toIso8601String(),
      'totalHours': instance.totalHours,
      'overtimeHours': instance.overtimeHours,
      'status': instance.status,
      'type': instance.type,
      'clockInLocation': instance.clockInLocation,
      'clockOutLocation': instance.clockOutLocation,
      'notes': instance.notes,
      'isApproved': instance.isApproved,
      'approvedBy': instance.approvedBy,
      'formattedDate': instance.formattedDate,
      'formattedClockIn': instance.formattedClockIn,
      'formattedClockOut': instance.formattedClockOut,
    };

_ClockInRequest _$ClockInRequestFromJson(Map<String, dynamic> json) =>
    _ClockInRequest(
      userId: json['userId'] as String,
      clockInTime: json['clockInTime'] == null
          ? null
          : DateTime.parse(json['clockInTime'] as String),
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      deviceInfo: json['deviceInfo'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ClockInRequestToJson(_ClockInRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'clockInTime': instance.clockInTime?.toIso8601String(),
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'deviceInfo': instance.deviceInfo,
      'notes': instance.notes,
    };

_ClockOutRequest _$ClockOutRequestFromJson(Map<String, dynamic> json) =>
    _ClockOutRequest(
      userId: json['userId'] as String,
      attendanceId: json['attendanceId'] as String,
      clockOutTime: json['clockOutTime'] == null
          ? null
          : DateTime.parse(json['clockOutTime'] as String),
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ClockOutRequestToJson(_ClockOutRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'attendanceId': instance.attendanceId,
      'clockOutTime': instance.clockOutTime?.toIso8601String(),
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'notes': instance.notes,
    };

_AttendanceCorrectionRequest _$AttendanceCorrectionRequestFromJson(
  Map<String, dynamic> json,
) => _AttendanceCorrectionRequest(
  attendanceId: json['attendanceId'] as String,
  newClockInTime: json['newClockInTime'] == null
      ? null
      : DateTime.parse(json['newClockInTime'] as String),
  newClockOutTime: json['newClockOutTime'] == null
      ? null
      : DateTime.parse(json['newClockOutTime'] as String),
  newStatus: $enumDecodeNullable(_$AttendanceStatusEnumMap, json['newStatus']),
  reason: json['reason'] as String,
);

Map<String, dynamic> _$AttendanceCorrectionRequestToJson(
  _AttendanceCorrectionRequest instance,
) => <String, dynamic>{
  'attendanceId': instance.attendanceId,
  'newClockInTime': instance.newClockInTime?.toIso8601String(),
  'newClockOutTime': instance.newClockOutTime?.toIso8601String(),
  'newStatus': _$AttendanceStatusEnumMap[instance.newStatus],
  'reason': instance.reason,
};

const _$AttendanceStatusEnumMap = {
  AttendanceStatus.present: 'present',
  AttendanceStatus.absent: 'absent',
  AttendanceStatus.late: 'late',
  AttendanceStatus.earlyLeave: 'earlyLeave',
  AttendanceStatus.halfDay: 'halfDay',
  AttendanceStatus.holiday: 'holiday',
  AttendanceStatus.leave: 'leave',
  AttendanceStatus.workFromHome: 'workFromHome',
  AttendanceStatus.onBusinessTrip: 'onBusinessTrip',
};
