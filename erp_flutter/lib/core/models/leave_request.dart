import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import 'employee.dart';

part 'leave_request.freezed.dart';
part 'leave_request.g.dart';

@freezed
abstract class LeaveRequest with _$LeaveRequest {
  const LeaveRequest._();

  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  factory LeaveRequest({
    required String id,
    required String employeeId,
    required String leaveTypeId,
    required String leaveTypeName,
    required DateTime startDate,
    required DateTime endDate,
    required int totalDays,
    required String reason,
    @JsonKey(unknownEnumValue: LeaveStatus.pending) 
    required LeaveStatus status,
    required DateTime requestDate,
    DateTime? approvedDate,
    String? approvedBy,
    String? rejectionReason,
    @Default(false) bool isHalfDay,
    String? attachmentUrl,
    Employee? employee,
    Employee? approver,
  }) = _LeaveRequest;

  factory LeaveRequest.fromJson(Map<String, dynamic> json) =>
      _$LeaveRequestFromJson(json);

  // Computed properties
  String get statusDisplay => status.displayName;
  Color get statusColor => status.color;
  bool get isPending => status == LeaveStatus.pending;
  bool get isActionable => status == LeaveStatus.pending;
  
  String get dateRange {
    if (startDate == endDate) {
      return DateFormat('MMM d, y').format(startDate);
    }
    return '${DateFormat('MMM d').format(startDate)} - ${DateFormat('MMM d, y').format(endDate)}';
  }
}

enum LeaveStatus {
  pending,
  approved,
  rejected,
  cancelled;

  String get displayName {
    switch (this) {
      case LeaveStatus.pending:
        return 'Pending';
      case LeaveStatus.approved:
        return 'Approved';
      case LeaveStatus.rejected:
        return 'Rejected';
      case LeaveStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get color {
    switch (this) {
      case LeaveStatus.pending:
        return Colors.orange;
      case LeaveStatus.approved:
        return Colors.green;
      case LeaveStatus.rejected:
        return Colors.red;
      case LeaveStatus.cancelled:
        return Colors.grey;
    }
  }
}
