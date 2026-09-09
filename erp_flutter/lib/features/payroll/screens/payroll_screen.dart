import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:erp_flutter/features/payroll/providers/payroll_provider.dart';

class PayrollScreen extends StatefulWidget {
  const PayrollScreen({super.key});

  @override
  State<PayrollScreen> createState() => _PayrollScreenState();
}

class _PayrollScreenState extends State<PayrollScreen> {
  final _currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PayrollProvider>().fetchPayrolls();
    });
  }

  void _generatePayroll() {
    final now = DateTime.now();
    context.read<PayrollProvider>().generatePayroll(now.month, now.year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payroll Management'),
        actions: [
          ElevatedButton.icon(
            onPressed: _generatePayroll,
            icon: const Icon(Icons.calculate),
            label: const Text('Run Payroll'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Consumer<PayrollProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.payrolls.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text(provider.error!),
                  TextButton(
                    onPressed: provider.fetchPayrolls,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.payrolls.isEmpty) {
            return const Center(
              child: Text('No payroll records found.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.payrolls.length,
            itemBuilder: (context, index) {
              final item = provider.payrolls[index];
              final monthName = DateFormat('MMMM').format(DateTime(2023, item['periodMonth']));
              final empName = item['employee'] != null ? item['employee']['fullName'] : 'Unknown Employee';

              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$empName - $monthName ${item['periodYear']}',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: item['status'] == 'Paid' ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              item['status'],
                              style: TextStyle(
                                color: item['status'] == 'Paid' ? Colors.green : Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _SalaryComponent(
                              label: 'Basic Salary',
                              value: _currencyFormat.format(item['basicSalary']),
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                            child: _SalaryComponent(
                              label: '+ Allowances',
                              value: _currencyFormat.format(item['allowances']),
                              color: Colors.green,
                            ),
                          ),
                          Expanded(
                            child: _SalaryComponent(
                              label: '- Deductions',
                              value: _currencyFormat.format(item['deductions']),
                              color: Colors.red,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('Net Pay', style: Theme.of(context).textTheme.bodySmall),
                                  Text(
                                    _currencyFormat.format(item['netSalary']),
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _SalaryComponent extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SalaryComponent({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
