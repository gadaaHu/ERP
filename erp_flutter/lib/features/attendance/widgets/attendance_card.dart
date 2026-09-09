import 'package:flutter/material.dart';

import '../../../core/models/attendance.dart';

class AttendanceCard extends StatelessWidget {
  final Attendance attendance;

  const AttendanceCard({super.key, required this.attendance});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: attendance.statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        attendance.statusIcon,
                        size: 16,
                        color: attendance.statusColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        attendance.statusDisplay,
                        style: TextStyle(
                          color: attendance.statusColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  attendance.formattedDate,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clock In',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        attendance.formattedClockIn ?? 'N/A',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Clock Out',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        attendance.formattedClockOut ?? 'N/A',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Hours',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        attendance.hoursDisplay,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (attendance.notes != null) ...[
              const SizedBox(height: 8),
              Text(
                'Note: ${attendance.notes}',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
