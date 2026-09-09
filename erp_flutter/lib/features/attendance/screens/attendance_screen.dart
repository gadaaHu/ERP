import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:erp_flutter/features/attendance/providers/attendance_provider.dart';
import 'face_clock_in_screen.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Hardcoded for testing: assuming Employee ID 1 exists. In a real app, this comes from auth context.
  final int _employeeId = 1; 

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AttendanceProvider>().fetchEmployeeAttendance(_employeeId);
    });
  }

  Future<void> _toggleClock(AttendanceProvider provider) async {
    final today = provider.todayAttendance;
    if (today == null || today['clockInTime'] == null) {
      await provider.clockIn(_employeeId);
    } else if (today['clockOutTime'] == null) {
      await provider.clockOut(_employeeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMMM d, yyyy');
    final timeFormatter = DateFormat('hh:mm a');

    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final refreshed = await Navigator.push<bool>(
            context,
            MaterialPageRoute(builder: (_) => const FaceClockInScreen()),
          );
          if (refreshed == true && context.mounted) {
            context.read<AttendanceProvider>().fetchEmployeeAttendance(_employeeId);
          }
        },
        backgroundColor: const Color(0xFF6366F1),
        icon: const Icon(Icons.face_retouching_natural, color: Colors.white),
        label: const Text('Face Clock-In', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Consumer<AttendanceProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.todayAttendance == null && provider.attendances.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final today = provider.todayAttendance;
          final bool isClockedIn = today != null && today['clockInTime'] != null && today['clockOutTime'] == null;
          final bool isClockedOut = today != null && today['clockOutTime'] != null;

          DateTime? clockInTime;
          if (today != null && today['clockInTime'] != null) {
            clockInTime = DateTime.parse(today['clockInTime']).toLocal();
          }
          
          DateTime? clockOutTime;
          if (today != null && today['clockOutTime'] != null) {
            clockOutTime = DateTime.parse(today['clockOutTime']).toLocal();
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (provider.error != null)
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red.withValues(alpha: 0.1),
                    child: Text(provider.error!, style: const TextStyle(color: Colors.red)),
                  ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(formatter.format(now), style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(height: 8),
                        Text(
                          timeFormatter.format(now),
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isClockedOut 
                                ? Colors.grey.withValues(alpha: 0.1)
                                : isClockedIn
                                  ? Colors.green.withValues(alpha: 0.1)
                                  : Colors.red.withValues(alpha: 0.1),
                            border: Border.all(
                              color: isClockedOut 
                                  ? Colors.grey 
                                  : isClockedIn ? Colors.green : Colors.red,
                              width: 3,
                            ),
                          ),
                          child: IconButton(
                            iconSize: 48,
                            icon: Icon(
                              isClockedOut ? Icons.check_circle : (isClockedIn ? Icons.stop_circle : Icons.play_circle),
                              color: isClockedOut ? Colors.grey : (isClockedIn ? Colors.green : Colors.red),
                            ),
                            onPressed: isClockedOut || provider.isLoading ? null : () => _toggleClock(provider),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          isClockedOut ? 'Shift Completed' : (isClockedIn ? 'Clocked In' : 'Clocked Out'),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isClockedOut ? Colors.grey : (isClockedIn ? Colors.green : Colors.red),
                          ),
                        ),
                        if (clockInTime != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            'Since ${timeFormatter.format(clockInTime)}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text('Today\'s Summary', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _SummaryCard(
                        label: 'Check In',
                        value: clockInTime != null ? timeFormatter.format(clockInTime) : '--:--',
                        icon: Icons.login,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SummaryCard(
                        label: 'Check Out',
                        value: clockOutTime != null ? timeFormatter.format(clockOutTime) : '--:--',
                        icon: Icons.logout,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SummaryCard(
                        label: 'Hours',
                        value: today != null && today['totalHours'] != null 
                            ? '${(today['totalHours'] as num).toStringAsFixed(1)}h' 
                            : (isClockedIn ? 'Active' : '0h'),
                        icon: Icons.timer,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text('Recent History', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.attendances.length,
                    itemBuilder: (context, index) {
                      final item = provider.attendances[index];
                      final date = DateTime.parse(item['date']).toLocal();
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.date_range),
                          title: Text(formatter.format(date)),
                          subtitle: Text('Status: ${item['status']}'),
                          trailing: Text(item['totalHours'] != null ? '${(item['totalHours'] as num).toStringAsFixed(1)}h' : 'N/A'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(label, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
