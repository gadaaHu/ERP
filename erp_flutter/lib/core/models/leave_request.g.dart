// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveRequest _$LeaveRequestFromJson(Map<String, dynamic> json) =>
    _LeaveRequest(
      id: json['id'] as String,
      employeeId: json['employeeId'] as String,
      leaveTypeId: json['leaveTypeId'] as String,
      leaveTypeName: json['leaveTypeName'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      totalDays: (json['totalDays'] as num).toInt(),
      reason: json['reason'] as String,
      status: $enumDecode(
        _$LeaveStatusEnumMap,
        json['status'],
        unknownValue: LeaveStatus.pending,
      ),
      requestDate: DateTime.parse(json['requestDate'] as String),
      approvedDate: json['approvedDate'] == null
          ? null
          : DateTime.parse(json['approvedDate'] as String),
      approvedBy: json['approvedBy'] as String?,
      rejectionReason: json['rejectionReason'] as String?,
      isHalfDay: json['isHalfDay'] as bool? ?? false,
      attachmentUrl: json['attachmentUrl'] as String?,
      employee: json['employee'] == null
          ? null
          : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      approver: json['approver'] == null
          ? null
          : Employee.fromJson(json['approver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaveRequestToJson(_LeaveRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'employeeId': instance.employeeId,
      'leaveTypeId': instance.leaveTypeId,
      'leaveTypeName': instance.leaveTypeName,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalDays': instance.totalDays,
      'reason': instance.reason,
      'status': _$LeaveStatusEnumMap[instance.status]!,
      'requestDate': instance.requestDate.toIso8601String(),
      'approvedDate': instance.approvedDate?.toIso8601String(),
      'approvedBy': instance.approvedBy,
      'rejectionReason': instance.rejectionReason,
      'isHalfDay': instance.isHalfDay,
      'attachmentUrl': instance.attachmentUrl,
      'employee': instance.employee?.toJson(),
      'approver': instance.approver?.toJson(),
    };

const _$LeaveStatusEnumMap = {
  LeaveStatus.pending: 'pending',
  LeaveStatus.approved: 'approved',
  LeaveStatus.rejected: 'rejected',
  LeaveStatus.cancelled: 'cancelled',
};
