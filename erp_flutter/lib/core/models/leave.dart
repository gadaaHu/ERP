import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/employee.dart';

class LeaveRequest {
  final String id;
  final String employeeId;
  final LeaveType leaveType;
  final DateTime startDate;
  final DateTime endDate;
  final int totalDays;
  final String reason;
  final LeaveStatus status;
  final DateTime requestDate;
  final DateTime? approvedDate;
  final String? approvedBy;
  final String? rejectionReason;
  final Employee? employee;
  final Employee? approver;

  LeaveRequest({
    required this.id,
    required this.employeeId,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.totalDays,
    required this.reason,
    required this.status,
    required this.requestDate,
    this.approvedDate,
    this.approvedBy,
    this.rejectionReason,
    this.employee,
    this.approver,
  });

  String get leaveTypeName {
    switch (leaveType) {
      case LeaveType.annual:
        return 'Annual Leave';
      case LeaveType.sick:
        return 'Sick Leave';
      case LeaveType.maternity:
        return 'Maternity Leave';
      case LeaveType.paternity:
        return 'Paternity Leave';
      case LeaveType.unpaid:
        return 'Unpaid Leave';
      case LeaveType.compensatory:
        return 'Compensatory Leave';
      case LeaveType.emergency:
        return 'Emergency Leave';
    }
  }

  String get statusName {
    switch (status) {
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

  Color get statusColor {
    switch (status) {
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

  factory LeaveRequest.fromJson(Map<String, dynamic> json) {
    return LeaveRequest(
      id: json['id'],
      employeeId: json['employeeId'],
      leaveType: LeaveType.values[json['leaveType'] - 1],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      totalDays: json['totalDays'],
      reason: json['reason'] ?? '',
      status: LeaveStatus.values[json['status'] - 1],
      requestDate: DateTime.parse(json['requestDate']),
      approvedDate: json['approvedDate'] != null 
          ? DateTime.parse(json['approvedDate']) 
          : null,
      approvedBy: json['approvedBy'],
      rejectionReason: json['rejectionReason'],
      employee: json['employee'] != null 
          ? Employee.fromJson(json['employee']) 
          : null,
      approver: json['approver'] != null 
          ? Employee.fromJson(json['approver']) 
          : null,
    );
  }
}

enum LeaveType {
  annual,
  sick,
  maternity,
  paternity,
  unpaid,
  compensatory,
  emergency,
}

enum LeaveStatus {
  pending,
  approved,
  rejected,
  cancelled,
}
