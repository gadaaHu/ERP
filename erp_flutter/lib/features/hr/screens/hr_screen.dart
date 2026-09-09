import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:erp_flutter/core/providers/employee_provider.dart';
import 'package:erp_flutter/core/providers/leave_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';

class HrScreen extends StatelessWidget {
  const HrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HR Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Refresh logic
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Consumer<EmployeeProvider>(
                builder: (context, employeeProvider, _) {
                  final totalEmployees = employeeProvider.totalEmployees;
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: const Text(
                          'HR',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Human Resources',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Managing $totalEmployees employees',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
              // Stats Cards
              Consumer<LeaveProvider>(
                builder: (context, leaveProvider, _) {
                  final pending = leaveProvider.pendingLeaves.length;
                  return Row(
                    children: [
                      _buildStatCard('Total Employees', '245', Icons.people, const Color(0xFF1A237E)),
                      const SizedBox(width: 16),
                      _buildStatCard('Pending Leaves', pending.toString(), Icons.pending_actions, Colors.orange),
                      const SizedBox(width: 16),
                      _buildStatCard('On Leave', '12', Icons.event_busy, Colors.blue),
                      const SizedBox(width: 16),
                      _buildStatCard('Open Positions', '8', Icons.work, Colors.green),
                    ],
                  );
                },
              ),
              const SizedBox(height: 32),
              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _quickAction(
                    context,
                    icon: Icons.people,
                    label: 'Employees',
                    onTap: () => context.go('/employees'),
                  ),
                  _quickAction(
                    context,
                    icon: Icons.event,
                    label: 'Leave Requests',
                    onTap: () => context.go('/leaves'),
                  ),
                  _quickAction(
                    context,
                    icon: Icons.work,
                    label: 'Recruitment',
                    onTap: () => context.go('/recruitment'),
                  ),
                  _quickAction(
                    context,
                    icon: Icons.description,
                    label: 'Reports',
                    onTap: () => context.go('/reports'),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Recent Activity
              const Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    _recentActivityItem(
                      title: 'John Doe requested leave',
                      time: '2 hours ago',
                      icon: Icons.event,
                    ),
                    const Divider(height: 1),
                    _recentActivityItem(
                      title: 'New employee Jane Smith onboarded',
                      time: '4 hours ago',
                      icon: Icons.person_add,
                    ),
                    const Divider(height: 1),
                    _recentActivityItem(
                      title: 'Performance reviews pending',
                      time: '1 day ago',
                      icon: Icons.assessment,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: AppTheme.textSecondaryColor, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAction(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 160,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentActivityItem({required String title, required String time, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: Colors.grey.shade700),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
