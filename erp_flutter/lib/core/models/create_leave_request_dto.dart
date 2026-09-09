class CreateLeaveRequestDto {
  final String leaveTypeId;
  final DateTime startDate;
  final DateTime endDate;
  final String reason;
  final bool isHalfDay;
  final String? attachmentUrl;

  CreateLeaveRequestDto({
    required this.leaveTypeId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.isHalfDay = false,
    this.attachmentUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'leaveTypeId': leaveTypeId,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'reason': reason,
      'isHalfDay': isHalfDay,
      if (attachmentUrl != null) 'attachmentUrl': attachmentUrl,
    };
  }
}
