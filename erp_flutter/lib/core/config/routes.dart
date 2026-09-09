import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:erp_flutter/features/auth/screens/login_screen.dart';
import 'package:erp_flutter/features/dashboard/screens/dashboard_screen.dart';
import 'package:erp_flutter/features/hr/screens/hr_screen.dart';
import 'package:erp_flutter/features/employees/screens/employee_list_screen.dart';
import 'package:erp_flutter/features/leaves/screens/leave_list_screen.dart';
import 'package:erp_flutter/features/leaves/screens/leave_application_screen.dart';
import 'package:erp_flutter/features/attendance/clock_in_screen.dart';
import 'package:erp_flutter/features/payroll/screens/payroll_screen.dart';
import 'package:erp_flutter/features/recruitment/screens/recruitment_screen.dart';
import 'package:erp_flutter/features/appraisal/screens/appraisal_screen.dart';
import 'package:erp_flutter/features/training/screens/training_screen.dart';
import 'package:erp_flutter/features/onboarding/screens/onboarding_screen.dart';
import 'package:erp_flutter/features/finance/screens/finance_screen.dart';
import 'package:erp_flutter/features/purchase/screens/purchase_screen.dart';
import 'package:erp_flutter/features/assets/screens/asset_screen.dart';
import 'package:erp_flutter/features/services/screens/service_screen.dart';
import 'package:erp_flutter/features/projects/screens/project_screen.dart';
import 'package:erp_flutter/features/documents/screens/document_screen.dart';
import 'package:erp_flutter/features/reports/screens/report_screen.dart';
import 'package:erp_flutter/core/widgets/sidebar.dart';
import 'package:erp_flutter/features/auth/providers/auth_provider.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthProvider authProvider) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isLoggingIn = state.uri.path == '/login';
      if (!authProvider.isAuthenticated && !isLoggingIn) {
        return '/login';
      }
      if (authProvider.isAuthenticated && isLoggingIn) {
        return '/';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => Sidebar(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/hr',
            builder: (context, state) => const HrScreen(),
          ),
          GoRoute(
            path: '/employees',
            builder: (context, state) => const EmployeeListScreen(),
          ),
          GoRoute(
            path: '/leaves',
            builder: (context, state) => const LeaveListScreen(),
          ),
          GoRoute(
            path: '/leave/apply',
            builder: (context, state) => const LeaveApplicationScreen(),
          ),
          GoRoute(
            path: '/payroll',
            builder: (context, state) => const PayrollScreen(),
          ),
          GoRoute(
            path: '/attendance',
            builder: (context, state) => const ClockInScreen(),
          ),
          GoRoute(
            path: '/recruitment',
            builder: (context, state) => const RecruitmentScreen(),
          ),
          GoRoute(
            path: '/appraisal',
            builder: (context, state) => const AppraisalScreen(),
          ),
          GoRoute(
            path: '/training',
            builder: (context, state) => const TrainingScreen(),
          ),
          GoRoute(
            path: '/onboarding',
            builder: (context, state) => const OnboardingScreen(),
          ),
          GoRoute(
            path: '/finance',
            builder: (context, state) => const FinanceScreen(),
          ),
          GoRoute(
            path: '/purchase',
            builder: (context, state) => const PurchaseScreen(),
          ),
          GoRoute(
            path: '/assets',
            builder: (context, state) => const AssetScreen(),
          ),
          GoRoute(
            path: '/services',
            builder: (context, state) => const ServiceScreen(),
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => const ProjectScreen(),
          ),
          GoRoute(
            path: '/documents',
            builder: (context, state) => const DocumentScreen(),
          ),
          GoRoute(
            path: '/reports',
            builder: (context, state) => const ReportScreen(),
          ),
        ],
      ),
    ],
  );
}
