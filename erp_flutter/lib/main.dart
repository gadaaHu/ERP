import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Consumer;
import 'package:go_router/go_router.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:erp_flutter/core/config/routes.dart';
import 'package:erp_flutter/features/auth/providers/auth_provider.dart';
import 'package:erp_flutter/core/providers/employee_provider.dart';
import 'package:erp_flutter/core/providers/leave_provider.dart';
import 'package:erp_flutter/features/hr/providers/hr_provider.dart';
import 'package:erp_flutter/features/finance/providers/finance_provider.dart';
import 'package:erp_flutter/core/providers/project_provider.dart';
import 'package:erp_flutter/core/providers/asset_provider.dart';
import 'package:erp_flutter/features/purchase/providers/purchase_provider.dart';
import 'package:erp_flutter/core/providers/document_provider.dart';
import 'package:erp_flutter/core/providers/service_provider.dart';
import 'package:erp_flutter/core/providers/report_provider.dart';
import 'package:erp_flutter/features/attendance/providers/attendance_provider.dart';
import 'package:erp_flutter/features/payroll/providers/payroll_provider.dart';
import 'package:erp_flutter/features/recruitment/providers/recruitment_provider.dart';
import 'package:erp_flutter/features/appraisal/providers/appraisal_provider.dart';
import 'package:erp_flutter/features/training/providers/training_provider.dart';
import 'package:erp_flutter/features/onboarding/providers/onboarding_provider.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          padding: const EdgeInsets.all(20),
          child: Text(
            details.exceptionAsString(),
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  };
  runApp(
    ProviderScope(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => EmployeeProvider()),
          ChangeNotifierProvider(create: (_) => LeaveProvider()),
          ChangeNotifierProvider(create: (_) => RecruitmentProvider()),
          ChangeNotifierProvider(create: (_) => AppraisalProvider()),
          ChangeNotifierProvider(create: (_) => TrainingProvider()),
          ChangeNotifierProvider(create: (_) => OnboardingProvider()),
          ChangeNotifierProvider(create: (_) => HrProvider()),
          ChangeNotifierProvider(create: (_) => FinanceProvider()),
          ChangeNotifierProvider(create: (_) => ProjectProvider()),
          ChangeNotifierProvider(create: (_) => AttendanceProvider()),
          ChangeNotifierProvider(create: (_) => PayrollProvider()),
          ChangeNotifierProvider(create: (_) => AssetProvider()),
          ChangeNotifierProvider(create: (_) => PurchaseProvider()),
          ChangeNotifierProvider(create: (_) => DocumentProvider()),
          ChangeNotifierProvider(create: (_) => ServiceProvider()),
          ChangeNotifierProvider(create: (_) => ReportProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    // Safe to read now, because MultiProvider is above MyApp in the widget tree.
    final auth = context.read<AuthProvider>();
    _router = createRouter(auth);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ERP System',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: _router,
    );
  }
}
