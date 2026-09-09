import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';

part 'attendance.freezed.dart';
part 'attendance.g.dart';

@freezed
abstract class Attendance with _$Attendance {
  const Attendance._();

  factory Attendance({
    required String id,
    required String userId,
    required String employeeName,
    required DateTime date,
    DateTime? clockInTime,
    DateTime? clockOutTime,
    double? totalHours,
    double? overtimeHours,
    @JsonKey(unknownEnumValue: AttendanceStatus.present)
    required AttendanceStatus status,
    @JsonKey(unknownEnumValue: AttendanceType.regular)
    required AttendanceType type,
    String? clockInLocation,
    String? clockOutLocation,
    String? notes,
    required bool isApproved,
    String? approvedBy,
  }) = _Attendance;

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  // Computed properties
  String get formattedDate => DateFormat('dd/MM/yyyy').format(date);
  
  // Note: the original snippet had `clockInTime?.format(context)`. TimeOfDay has format(context),
  // but DateTime doesn't. We'll format it with DateFormat instead to keep it simple.
  String? get formattedClockIn => clockInTime != null ? DateFormat('hh:mm a').format(clockInTime!) : null;
  String? get formattedClockOut => clockOutTime != null ? DateFormat('hh:mm a').format(clockOutTime!) : null;
  
  String get statusDisplay => status.displayName;
  Color get statusColor => status.color;
  IconData get statusIcon => status.icon;
  
  bool get isClockedIn => clockInTime != null;
  bool get isClockedOut => clockOutTime != null;
  bool get isPresent => status == AttendanceStatus.present;
  bool get isAbsent => status == AttendanceStatus.absent;
  bool get isLate => status == AttendanceStatus.late;
  
  String get hoursDisplay => totalHours != null 
      ? '${totalHours!.toStringAsFixed(1)}h' 
      : 'N/A';
}

enum AttendanceStatus {
  present,
  absent,
  late,
  earlyLeave,
  halfDay,
  holiday,
  leave,
  workFromHome,
  onBusinessTrip;

  String get displayName {
    switch (this) {
      case AttendanceStatus.present:
        return 'Present';
      case AttendanceStatus.absent:
        return 'Absent';
      case AttendanceStatus.late:
        return 'Late';
      case AttendanceStatus.earlyLeave:
        return 'Early Leave';
      case AttendanceStatus.halfDay:
        return 'Half Day';
      case AttendanceStatus.holiday:
        return 'Holiday';
      case AttendanceStatus.leave:
        return 'On Leave';
      case AttendanceStatus.workFromHome:
        return 'Work From Home';
      case AttendanceStatus.onBusinessTrip:
        return 'Business Trip';
    }
  }

  Color get color {
    switch (this) {
      case AttendanceStatus.present:
        return Colors.green;
      case AttendanceStatus.absent:
        return Colors.red;
      case AttendanceStatus.late:
        return Colors.orange;
      case AttendanceStatus.earlyLeave:
        return Colors.amber;
      case AttendanceStatus.halfDay:
        return Colors.purple;
      case AttendanceStatus.holiday:
        return Colors.blue;
      case AttendanceStatus.leave:
        return Colors.teal;
      case AttendanceStatus.workFromHome:
        return Colors.indigo;
      case AttendanceStatus.onBusinessTrip:
        return Colors.cyan;
    }
  }

  IconData get icon {
    switch (this) {
      case AttendanceStatus.present:
        return Icons.check_circle;
      case AttendanceStatus.absent:
        return Icons.cancel;
      case AttendanceStatus.late:
        return Icons.access_time;
      case AttendanceStatus.earlyLeave:
        return Icons.exit_to_app;
      case AttendanceStatus.halfDay:
        return Icons.brightness_5;
      case AttendanceStatus.holiday:
        return Icons.beach_access;
      case AttendanceStatus.leave:
        return Icons.event_busy;
      case AttendanceStatus.workFromHome:
        return Icons.home_work;
      case AttendanceStatus.onBusinessTrip:
        return Icons.flight_takeoff;
    }
  }
}

enum AttendanceType {
  regular,
  overtime,
  compensatory,
  holiday,
  sick;

  String get displayName {
    switch (this) {
      case AttendanceType.regular:
        return 'Regular';
      case AttendanceType.overtime:
        return 'Overtime';
      case AttendanceType.compensatory:
        return 'Compensatory';
      case AttendanceType.holiday:
        return 'Holiday';
      case AttendanceType.sick:
        return 'Sick';
    }
  }
}

@freezed
abstract class AttendanceStatistics with _$AttendanceStatistics {
  const AttendanceStatistics._();

  factory AttendanceStatistics({
    required int totalDays,
    required int presentDays,
    required int absentDays,
    required int lateDays,
    required int halfDays,
    required int leaveDays,
    required int holidayDays,
    required int workFromHomeDays,
    required int businessTripDays,
    required double averageHours,
    required double totalOvertime,
    required double attendancePercentage,
    required Map<String, int> monthlyBreakdown,
    required Map<String, double> weeklyHours,
  }) = _AttendanceStatistics;

  factory AttendanceStatistics.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStatisticsFromJson(json);

  double get presentPercentage => totalDays > 0 
      ? (presentDays / totalDays) * 100 
      : 0;
  
  double get absentPercentage => totalDays > 0 
      ? (absentDays / totalDays) * 100 
      : 0;
}

@freezed
abstract class AttendanceSummary with _$AttendanceSummary {
  factory AttendanceSummary({
    required DateTime date,
    required String dayOfWeek,
    required String status,
    required String clockIn,
    required String clockOut,
    required double hours,
    String? notes,
  }) = _AttendanceSummary;

  factory AttendanceSummary.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSummaryFromJson(json);
}

@freezed
abstract class Holiday with _$Holiday {
  factory Holiday({
    required String id,
    required String name,
    String? description,
    required DateTime date,
    required bool isRecurring,
    int? recurringYear,
    required HolidayType type,
    required bool isActive,
    String? region,
  }) = _Holiday;

  factory Holiday.fromJson(Map<String, dynamic> json) =>
      _$HolidayFromJson(json);
}

enum HolidayType {
  public,
  company,
  religious,
  optional;

  String get displayName {
    switch (this) {
      case HolidayType.public:
        return 'Public Holiday';
      case HolidayType.company:
        return 'Company Holiday';
      case HolidayType.religious:
        return 'Religious Holiday';
      case HolidayType.optional:
        return 'Optional Holiday';
    }
  }
}
