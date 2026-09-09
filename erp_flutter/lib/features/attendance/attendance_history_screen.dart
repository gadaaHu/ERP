import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/attendance_provider.dart';
import '../../core/models/attendance.dart';
import '../../core/models/attendance_dto.dart';
import 'widgets/attendance_card.dart';

class AttendanceHistoryScreen extends ConsumerStatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  ConsumerState<AttendanceHistoryScreen> createState() =>
      _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState
    extends ConsumerState<AttendanceHistoryScreen> {
  DateTime? _fromDate;
  DateTime? _toDate;
  String? _statusFilter;

  @override
  Widget build(BuildContext context) {
    final attendanceAsync = ref.watch(attendanceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: Column(
        children: [
          // Summary stats
          attendanceAsync.when(
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
            data: (attendances) => _buildSummaryCards(attendances),
          ),
          Expanded(
            child: attendanceAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 64, color: Colors.grey.shade400),
                    const SizedBox(height: 16),
                    Text('Error: $error'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          ref.invalidate(attendanceProvider),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
              data: (attendances) {
                if (attendances.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.history,
                            size: 64, color: Colors.grey.shade400),
                        const SizedBox(height: 16),
                        Text(
                          'No attendance records found',
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Start clocking in to track your attendance',
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                      ],
                    ),
                  );
                }

                // Filter by status if set, and convert DTOs to domain model for display
                final filtered = _statusFilter == null
                    ? attendances
                    : attendances
                        .where((a) =>
                            a.status.toLowerCase() ==
                            _statusFilter!.toLowerCase())
                        .toList();

                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final dto = filtered[index];
                    // Convert AttendanceDto to Attendance for the card
                    final attendance = Attendance(
                      id: dto.id,
                      userId: dto.userId,
                      employeeName: dto.employeeName,
                      date: dto.date,
                      clockInTime: dto.clockInTime,
                      clockOutTime: dto.clockOutTime,
                      totalHours: dto.totalHours,
                      overtimeHours: dto.overtimeHours,
                      status: dto.attendanceStatus,
                      type: AttendanceType.regular,
                      notes: dto.notes,
                      isApproved: dto.isApproved,
                      approvedBy: dto.approvedBy,
                    );
                    return AttendanceCard(attendance: attendance);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(List<AttendanceDto> attendances) {
    final total = attendances.length;
    final present = attendances
        .where((a) => a.attendanceStatus == AttendanceStatus.present)
        .length;
    final absent = attendances
        .where((a) => a.attendanceStatus == AttendanceStatus.absent)
        .length;
    final lateCount = attendances
        .where((a) => a.attendanceStatus == AttendanceStatus.late)
        .length;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        children: [
          _buildSummaryItem('Total', total.toString(), Colors.blue),
          _buildSummaryItem('Present', present.toString(), Colors.green),
          _buildSummaryItem('Absent', absent.toString(), Colors.red),
          _buildSummaryItem('Late', lateCount.toString(), Colors.orange),
        ],
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Filter Attendance'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(_fromDate != null
                  ? DateFormat('MMM d, y').format(_fromDate!)
                  : 'From Date'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _fromDate ??
                      DateTime.now().subtract(const Duration(days: 30)),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _fromDate = date);
                  ref.read(attendanceProvider.notifier).setDateRange(
                        _fromDate,
                        _toDate,
                      );
                  ref.invalidate(attendanceProvider);
                }
              },
            ),
            ListTile(
              title: Text(_toDate != null
                  ? DateFormat('MMM d, y').format(_toDate!)
                  : 'To Date'),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _toDate ?? DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  setState(() => _toDate = date);
                  ref.read(attendanceProvider.notifier).setDateRange(
                        _fromDate,
                        _toDate,
                      );
                  ref.invalidate(attendanceProvider);
                }
              },
            ),
            DropdownButtonFormField<String>(
              initialValue: _statusFilter,
              decoration: const InputDecoration(labelText: 'Status'),
              items: [
                const DropdownMenuItem(value: null, child: Text('All')),
                ...AttendanceStatus.values.map(
                  (status) => DropdownMenuItem(
                    value: status.name,
                    child: Text(status.displayName),
                  ),
                ),
              ],
              onChanged: (value) =>
                  setState(() => _statusFilter = value),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _fromDate = null;
                _toDate = null;
                _statusFilter = null;
              });
              ref.read(attendanceProvider.notifier).setDateRange(null, null);
              ref.invalidate(attendanceProvider);
              Navigator.pop(context);
            },
            child: const Text('Clear'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
