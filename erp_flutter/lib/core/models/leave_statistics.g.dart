// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LeaveStatistics _$LeaveStatisticsFromJson(Map<String, dynamic> json) =>
    _LeaveStatistics(
      totalRequests: (json['totalRequests'] as num).toInt(),
      pendingRequests: (json['pendingRequests'] as num).toInt(),
      approvedRequests: (json['approvedRequests'] as num).toInt(),
      rejectedRequests: (json['rejectedRequests'] as num).toInt(),
      leaveTypeUsage: Map<String, int>.from(json['leaveTypeUsage'] as Map),
      monthlyTrends: (json['monthlyTrends'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$LeaveStatisticsToJson(_LeaveStatistics instance) =>
    <String, dynamic>{
      'totalRequests': instance.totalRequests,
      'pendingRequests': instance.pendingRequests,
      'approvedRequests': instance.approvedRequests,
      'rejectedRequests': instance.rejectedRequests,
      'leaveTypeUsage': instance.leaveTypeUsage,
      'monthlyTrends': instance.monthlyTrends,
    };
