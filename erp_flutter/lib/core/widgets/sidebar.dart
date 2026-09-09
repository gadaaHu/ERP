import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:erp_flutter/core/config/theme.dart';

class Sidebar extends StatelessWidget {
  final Widget child;

  const Sidebar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 240,
            color: AppTheme.sidebarColor,
            child: Column(
              children: [
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.business, color: AppTheme.primaryColor, size: 24),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'ERP SYSTEM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: [
                      _NavItem(title: 'Dashboard', route: '/', icon: Icons.dashboard_rounded),
                      _SectionLabel('Human Resources'),
                      _NavItem(title: 'HR Overview', route: '/hr', icon: Icons.people_rounded),
                      _NavItem(title: 'Employees', route: '/employees', icon: Icons.badge_rounded),
                      _NavItem(title: 'Leave Requests', route: '/leaves', icon: Icons.event_note_rounded),
                      _NavItem(title: 'Attendance', route: '/attendance', icon: Icons.fingerprint_rounded),
                      _NavItem(title: 'Payroll', route: '/payroll', icon: Icons.attach_money_rounded),
                      _NavItem(title: 'Recruitment', route: '/recruitment', icon: Icons.work_outline_rounded),
                      _NavItem(title: 'Appraisals', route: '/appraisal', icon: Icons.star_border_rounded),
                      _NavItem(title: 'Training', route: '/training', icon: Icons.school_rounded),
                      _NavItem(title: 'Onboarding', route: '/onboarding', icon: Icons.checklist_rounded),
                      _SectionLabel('Operations'),
                      _NavItem(title: 'Finance', route: '/finance', icon: Icons.account_balance_rounded),
                      _NavItem(title: 'Purchase', route: '/purchase', icon: Icons.shopping_cart_rounded),
                      _NavItem(title: 'Fixed Assets', route: '/assets', icon: Icons.precision_manufacturing_rounded),
                      _NavItem(title: 'Services', route: '/services', icon: Icons.build_rounded),
                      _NavItem(title: 'Projects', route: '/projects', icon: Icons.assignment_rounded),
                      _SectionLabel('Tools'),
                      _NavItem(title: 'Documents', route: '/documents', icon: Icons.folder_rounded),
                      _NavItem(title: 'Reports', route: '/reports', icon: Icons.bar_chart_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 4),
      child: Text(
        label.toUpperCase(),
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final String route;
  final IconData icon;

  const _NavItem({
    required this.title,
    required this.route,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final isActive = currentRoute == route || (route != '/' && currentRoute.startsWith(route));

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isActive ? AppTheme.primaryColor.withValues(alpha: 0.25) : Colors.transparent,
      ),
      child: ListTile(
        dense: true,
        leading: Icon(icon, color: isActive ? Colors.white : Colors.white54, size: 20),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white70,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onTap: () => context.go(route),
      ),
    );
  }
}
