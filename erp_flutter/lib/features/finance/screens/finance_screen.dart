import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/features/finance/providers/finance_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:intl/intl.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(name: 'ETB');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Management', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<FinanceProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.transactions.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (provider.error.isNotEmpty) {
            return Center(child: Text('Error: ${provider.error}', style: const TextStyle(color: Colors.red)));
          }

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Stats Row
                Row(
                  children: [
                    _buildStatCard('Net Income', formatCurrency.format(provider.stats['netIncome'] ?? 0), Icons.account_balance_wallet, Colors.blue),
                    const SizedBox(width: 16),
                    _buildStatCard('Total Revenue', formatCurrency.format(provider.stats['totalRevenue'] ?? 0), Icons.arrow_upward, Colors.green),
                    const SizedBox(width: 16),
                    _buildStatCard('Total Expenses', formatCurrency.format(provider.stats['totalExpenses'] ?? 0), Icons.arrow_downward, Colors.red),
                  ],
                ),
                const SizedBox(height: 32),
                
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Recent Transactions', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('New Transaction'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Data Table
                Expanded(
                  child: Card(
                    child: ListView(
                      children: [
                        DataTable(
                          headingRowColor: WidgetStateProperty.all(AppTheme.backgroundColor),
                          columns: const [
                            DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Category', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Description', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.transactions.map((t) => DataRow(
                            cells: [
                              DataCell(Text(DateFormat.yMMMd().format(t.date))),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: t.type == 'Income' ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    t.type, 
                                    style: TextStyle(
                                      color: t.type == 'Income' ? Colors.green[800] : Colors.red[800],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ),
                              ),
                              DataCell(Text(t.category)),
                              DataCell(Text(t.description)),
                              DataCell(Text(formatCurrency.format(t.amount), style: const TextStyle(fontWeight: FontWeight.bold))),
                            ],
                          )).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
}
