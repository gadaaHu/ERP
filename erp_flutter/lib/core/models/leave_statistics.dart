import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_statistics.freezed.dart';
part 'leave_statistics.g.dart';

@freezed
abstract class LeaveStatistics with _$LeaveStatistics {
  factory LeaveStatistics({
    required int totalRequests,
    required int pendingRequests,
    required int approvedRequests,
    required int rejectedRequests,
    required Map<String, int> leaveTypeUsage,
    required Map<String, double> monthlyTrends,
  }) = _LeaveStatistics;

  factory LeaveStatistics.fromJson(Map<String, dynamic> json) =>
      _$LeaveStatisticsFromJson(json);
}
