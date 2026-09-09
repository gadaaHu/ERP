import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../providers/attendance_provider.dart';

class AttendanceStatisticsScreen extends ConsumerStatefulWidget {
  const AttendanceStatisticsScreen({super.key});

  @override
  ConsumerState<AttendanceStatisticsScreen> createState() =>
      _AttendanceStatisticsScreenState();
}

class _AttendanceStatisticsScreenState
    extends ConsumerState<AttendanceStatisticsScreen> {
  int _selectedYear = DateTime.now().year;
  int? _selectedMonth;

  @override
  Widget build(BuildContext context) {
    final statsAsync = ref.watch(
      attendanceStatisticsProvider(
        (year: _selectedYear, month: _selectedMonth),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Statistics'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: _showYearMonthPicker,
          ),
        ],
      ),
      body: statsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              ElevatedButton(
                onPressed: () => ref.invalidate(
                  attendanceStatisticsProvider(
                    (year: _selectedYear, month: _selectedMonth),
                  ),
                ),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (stats) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Year/Month selector
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedMonth != null
                          ? DateFormat('MMMM y').format(
                              DateTime(_selectedYear, _selectedMonth!))
                          : '$_selectedYear Overview',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            setState(() {
                              if (_selectedMonth != null) {
                                if (_selectedMonth == 1) {
                                  _selectedYear--;
                                  _selectedMonth = 12;
                                } else {
                                  _selectedMonth = _selectedMonth! - 1;
                                }
                              } else {
                                _selectedYear--;
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            setState(() {
                              if (_selectedMonth != null) {
                                if (_selectedMonth == 12) {
                                  _selectedYear++;
                                  _selectedMonth = 1;
                                } else {
                                  _selectedMonth = _selectedMonth! + 1;
                                }
                              } else {
                                _selectedYear++;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Overview cards
              Row(
                children: [
                  _buildStatCard(
                    'Attendance Rate',
                    '${stats.attendancePercentage.toStringAsFixed(1)}%',
                    Colors.green,
                    Icons.percent,
                  ),
                  _buildStatCard(
                    'Total Overtime',
                    '${stats.totalOvertime.toStringAsFixed(1)}h',
                    Colors.orange,
                    Icons.access_time,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildStatCard(
                    'Avg Hours/Day',
                    '${stats.averageHours.toStringAsFixed(1)}h',
                    Colors.blue,
                    Icons.hourglass_top,
                  ),
                  _buildStatCard(
                    'Leave Days',
                    stats.leaveDays.toString(),
                    Colors.purple,
                    Icons.event_busy,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Status breakdown
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Attendance Breakdown',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildStatusRow(
                          'Present', stats.presentDays, Colors.green,
                          stats.totalDays),
                      _buildStatusRow(
                          'Work From Home', stats.workFromHomeDays,
                          Colors.indigo, stats.totalDays),
                      _buildStatusRow(
                          'Business Trip', stats.businessTripDays,
                          Colors.cyan, stats.totalDays),
                      _buildStatusRow(
                          'Late', stats.lateDays, Colors.orange,
                          stats.totalDays),
                      _buildStatusRow(
                          'Half Day', stats.halfDays, Colors.purple,
                          stats.totalDays),
                      _buildStatusRow(
                          'Absent', stats.absentDays, Colors.red,
                          stats.totalDays),
                      _buildStatusRow(
                          'Holiday', stats.holidayDays, Colors.blue,
                          stats.totalDays),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Weekly hours chart
              if (stats.weeklyHours.isNotEmpty)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Weekly Hours',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: stats.weeklyHours.length,
                            itemBuilder: (context, index) {
                              final entry = stats.weeklyHours.entries
                                  .elementAt(index);
                              final maxHours = stats.weeklyHours.values
                                  .reduce((a, b) => a > b ? a : b);
                              final height =
                                  maxHours > 0
                                      ? (entry.value / maxHours) * 120
                                      : 0.0;

                              return Container(
                                width: 60,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 4),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${entry.value.toStringAsFixed(1)}h',
                                      style: const TextStyle(
                                          fontSize: 12),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      height: height,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(4),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      entry.key
                                          .replaceAll('Week ', 'W'),
                                      style: const TextStyle(
                                          fontSize: 10),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
      String label, String value, Color color, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 4),
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
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusRow(
      String label, int count, Color color, int total) {
    final percentage = total > 0 ? (count / total) * 100 : 0.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text('$count (${percentage.toStringAsFixed(1)}%)'),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }

  void _showYearMonthPicker() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Select Period'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<int>(
              initialValue: _selectedYear,
              items: List.generate(
                      10, (i) => DateTime.now().year - 5 + i)
                  .map((year) => DropdownMenuItem(
                        value: year,
                        child: Text(year.toString()),
                      ))
                  .toList(),
              onChanged: (value) => setState(
                  () => _selectedYear = value ?? DateTime.now().year),
              decoration: const InputDecoration(labelText: 'Year'),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<int?>(
              initialValue: _selectedMonth,
              items: [
                const DropdownMenuItem(
                    value: null, child: Text('Full Year')),
                ...List.generate(
                  12,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Text(DateFormat('MMMM')
                        .format(DateTime(2000, i + 1))),
                  ),
                ),
              ],
              onChanged: (value) =>
                  setState(() => _selectedMonth = value),
              decoration: const InputDecoration(labelText: 'Month'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // setState already triggers rebuild with new params
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
