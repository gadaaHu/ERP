// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Attendance _$AttendanceFromJson(Map<String, dynamic> json) => _Attendance(
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
  status: $enumDecode(
    _$AttendanceStatusEnumMap,
    json['status'],
    unknownValue: AttendanceStatus.present,
  ),
  type: $enumDecode(
    _$AttendanceTypeEnumMap,
    json['type'],
    unknownValue: AttendanceType.regular,
  ),
  clockInLocation: json['clockInLocation'] as String?,
  clockOutLocation: json['clockOutLocation'] as String?,
  notes: json['notes'] as String?,
  isApproved: json['isApproved'] as bool,
  approvedBy: json['approvedBy'] as String?,
);

Map<String, dynamic> _$AttendanceToJson(_Attendance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'employeeName': instance.employeeName,
      'date': instance.date.toIso8601String(),
      'clockInTime': instance.clockInTime?.toIso8601String(),
      'clockOutTime': instance.clockOutTime?.toIso8601String(),
      'totalHours': instance.totalHours,
      'overtimeHours': instance.overtimeHours,
      'status': _$AttendanceStatusEnumMap[instance.status]!,
      'type': _$AttendanceTypeEnumMap[instance.type]!,
      'clockInLocation': instance.clockInLocation,
      'clockOutLocation': instance.clockOutLocation,
      'notes': instance.notes,
      'isApproved': instance.isApproved,
      'approvedBy': instance.approvedBy,
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

const _$AttendanceTypeEnumMap = {
  AttendanceType.regular: 'regular',
  AttendanceType.overtime: 'overtime',
  AttendanceType.compensatory: 'compensatory',
  AttendanceType.holiday: 'holiday',
  AttendanceType.sick: 'sick',
};

_AttendanceStatistics _$AttendanceStatisticsFromJson(
  Map<String, dynamic> json,
) => _AttendanceStatistics(
  totalDays: (json['totalDays'] as num).toInt(),
  presentDays: (json['presentDays'] as num).toInt(),
  absentDays: (json['absentDays'] as num).toInt(),
  lateDays: (json['lateDays'] as num).toInt(),
  halfDays: (json['halfDays'] as num).toInt(),
  leaveDays: (json['leaveDays'] as num).toInt(),
  holidayDays: (json['holidayDays'] as num).toInt(),
  workFromHomeDays: (json['workFromHomeDays'] as num).toInt(),
  businessTripDays: (json['businessTripDays'] as num).toInt(),
  averageHours: (json['averageHours'] as num).toDouble(),
  totalOvertime: (json['totalOvertime'] as num).toDouble(),
  attendancePercentage: (json['attendancePercentage'] as num).toDouble(),
  monthlyBreakdown: Map<String, int>.from(json['monthlyBreakdown'] as Map),
  weeklyHours: (json['weeklyHours'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$AttendanceStatisticsToJson(
  _AttendanceStatistics instance,
) => <String, dynamic>{
  'totalDays': instance.totalDays,
  'presentDays': instance.presentDays,
  'absentDays': instance.absentDays,
  'lateDays': instance.lateDays,
  'halfDays': instance.halfDays,
  'leaveDays': instance.leaveDays,
  'holidayDays': instance.holidayDays,
  'workFromHomeDays': instance.workFromHomeDays,
  'businessTripDays': instance.businessTripDays,
  'averageHours': instance.averageHours,
  'totalOvertime': instance.totalOvertime,
  'attendancePercentage': instance.attendancePercentage,
  'monthlyBreakdown': instance.monthlyBreakdown,
  'weeklyHours': instance.weeklyHours,
};

_AttendanceSummary _$AttendanceSummaryFromJson(Map<String, dynamic> json) =>
    _AttendanceSummary(
      date: DateTime.parse(json['date'] as String),
      dayOfWeek: json['dayOfWeek'] as String,
      status: json['status'] as String,
      clockIn: json['clockIn'] as String,
      clockOut: json['clockOut'] as String,
      hours: (json['hours'] as num).toDouble(),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$AttendanceSummaryToJson(_AttendanceSummary instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'dayOfWeek': instance.dayOfWeek,
      'status': instance.status,
      'clockIn': instance.clockIn,
      'clockOut': instance.clockOut,
      'hours': instance.hours,
      'notes': instance.notes,
    };

_Holiday _$HolidayFromJson(Map<String, dynamic> json) => _Holiday(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  date: DateTime.parse(json['date'] as String),
  isRecurring: json['isRecurring'] as bool,
  recurringYear: (json['recurringYear'] as num?)?.toInt(),
  type: $enumDecode(_$HolidayTypeEnumMap, json['type']),
  isActive: json['isActive'] as bool,
  region: json['region'] as String?,
);

Map<String, dynamic> _$HolidayToJson(_Holiday instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'date': instance.date.toIso8601String(),
  'isRecurring': instance.isRecurring,
  'recurringYear': instance.recurringYear,
  'type': _$HolidayTypeEnumMap[instance.type]!,
  'isActive': instance.isActive,
  'region': instance.region,
};

const _$HolidayTypeEnumMap = {
  HolidayType.public: 'public',
  HolidayType.company: 'company',
  HolidayType.religious: 'religious',
  HolidayType.optional: 'optional',
};
