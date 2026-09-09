// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => _LeaveType(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String?,
  defaultDays: (json['defaultDays'] as num).toInt(),
  isPaid: json['isPaid'] as bool,
  requiresApproval: json['requiresApproval'] as bool,
  iconCode: json['iconCode'] as String?,
  colorCode: json['colorCode'] as String?,
  maxConsecutiveDays: (json['maxConsecutiveDays'] as num).toInt(),
  isActive: json['isActive'] as bool,
);

Map<String, dynamic> _$LeaveTypeToJson(_LeaveType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'defaultDays': instance.defaultDays,
      'isPaid': instance.isPaid,
      'requiresApproval': instance.requiresApproval,
      'iconCode': instance.iconCode,
      'colorCode': instance.colorCode,
      'maxConsecutiveDays': instance.maxConsecutiveDays,
      'isActive': instance.isActive,
    };
