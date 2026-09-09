// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveBalance _$LeaveBalanceFromJson(Map<String, dynamic> json) =>
    _LeaveBalance(
      leaveTypeId: json['leaveTypeId'] as String,
      leaveTypeName: json['leaveTypeName'] as String,
      totalDays: (json['totalDays'] as num).toInt(),
      usedDays: (json['usedDays'] as num).toInt(),
      pendingDays: (json['pendingDays'] as num).toInt(),
    );

Map<String, dynamic> _$LeaveBalanceToJson(_LeaveBalance instance) =>
    <String, dynamic>{
      'leaveTypeId': instance.leaveTypeId,
      'leaveTypeName': instance.leaveTypeName,
      'totalDays': instance.totalDays,
      'usedDays': instance.usedDays,
      'pendingDays': instance.pendingDays,
    };
