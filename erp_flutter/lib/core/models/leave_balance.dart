import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_balance.freezed.dart';
part 'leave_balance.g.dart';

@freezed
abstract class LeaveBalance with _$LeaveBalance {
  const LeaveBalance._();

  factory LeaveBalance({
    required String leaveTypeId,
    required String leaveTypeName,
    required int totalDays,
    required int usedDays,
    required int pendingDays,
  }) = _LeaveBalance;

  factory LeaveBalance.fromJson(Map<String, dynamic> json) =>
      _$LeaveBalanceFromJson(json);

  int get remainingDays => totalDays - usedDays - pendingDays;
  double get usagePercentage => 
      totalDays > 0 ? (usedDays / totalDays) * 100 : 0;
}
