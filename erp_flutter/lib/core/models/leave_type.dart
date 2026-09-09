import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_type.freezed.dart';
part 'leave_type.g.dart';

@freezed
abstract class LeaveType with _$LeaveType {
  const LeaveType._();

  factory LeaveType({
    required String id,
    required String name,
    String? description,
    required int defaultDays,
    required bool isPaid,
    required bool requiresApproval,
    String? iconCode,
    String? colorCode,
    required int maxConsecutiveDays,
    required bool isActive,
  }) = _LeaveType;

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);
}
