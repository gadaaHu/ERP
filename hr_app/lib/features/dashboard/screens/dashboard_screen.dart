import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hr_app/features/auth/providers/auth_provider.dart';
import 'package:hr_app/core/providers/employee_provider.dart';
import 'package:hr_app/core/providers/leave_provider.dart';
import 'package:hr_app/core/widgets/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person_outline),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawer(context),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                        child: Text(
                          'JD',
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
                              'Good Morning!',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'You have $totalEmployees employees',
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
              const SizedBox(height: 24),
              // Stats Cards
              Consumer<LeaveProvider>(
                builder: (context, leaveProvider, _) {
                  final pending = leaveProvider.pendingLeaves.length;
                  return Row(
                    children: [
                      Expanded(
                        child: DashboardCard(
                          title: 'Total Employees',
                          value: '245',
                          icon: Icons.people,
                          color: const Color(0xFF1A237E),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DashboardCard(
                          title: 'Pending Leaves',
                          value: pending.toString(),
                          icon: Icons.pending_actions,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: DashboardCard(
                      title: 'On Leave',
                      value: '12',
                      icon: Icons.event_busy,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: DashboardCard(
                      title: 'Open Positions',
                      value: '8',
                      icon: Icons.work,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _quickAction(
                    context,
                    icon: Icons.person_add,
                    label: 'New Employee',
                    onTap: () {},
                  ),
                  _quickAction(
                    context,
                    icon: Icons.event,
                    label: 'Apply Leave',
                    onTap: () {},
                  ),
                  _quickAction(
                    context,
                    icon: Icons.work,
                    label: 'Post Job',
                    onTap: () {},
                  ),
                  _quickAction(
                    context,
                    icon: Icons.description,
                    label: 'Reports',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Recent Activity
              const Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _recentActivityItem(
                title: 'John Doe requested leave',
                time: '2 hours ago',
                icon: Icons.event,
              ),
              _recentActivityItem(
                title: 'New employee Jane Smith onboarded',
                time: '4 hours ago',
                icon: Icons.person_add,
              ),
              _recentActivityItem(
                title: 'Performance reviews pending',
                time: '1 day ago',
                icon: Icons.assessment,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAction(BuildContext context,
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: (MediaQuery.of(context).size.width - 56) / 4,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _recentActivityItem(
      {required String title, required String time, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 36,
                    color: Color(0xFF1A237E),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Admin User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'admin@company.com',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _drawerItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.people,
                  label: 'Employees',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.event,
                  label: 'Leaves',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.work,
                  label: 'Recruitment',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.assessment,
                  label: 'Performance',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.school,
                  label: 'Training',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.attach_money,
                  label: 'Payroll',
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(),
                _drawerItem(
                  icon: Icons.settings,
                  label: 'Settings',
                  onTap: () => Navigator.pop(context),
                ),
                _drawerItem(
                  icon: Icons.logout,
                  label: 'Logout',
                  onTap: () {
                    Provider.of<AuthProvider>(context, listen: false).logout();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey.shade700),
      title: Text(label),
      onTap: onTap,
    );
  }

  Future<void> _refreshData() async {
    // Refresh dashboard data
  }
}
