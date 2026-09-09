import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/core/providers/report_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plans & Reports', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<ReportProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.reports.isEmpty) {
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
                Row(
                  children: [
                    _buildStatCard('Active Plans', provider.stats['activePlans']?.toString() ?? '0', Icons.next_plan, Colors.blue),
                    const SizedBox(width: 16),
                    _buildStatCard('Generated Reports', provider.stats['generatedReports']?.toString() ?? '0', Icons.analytics, Colors.green),
                    const SizedBox(width: 16),
                    _buildStatCard('Overall Progress', '${provider.stats['overallProgress'] ?? 0}%', Icons.pie_chart, Colors.orange),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Strategic Plans & Reports', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Create New'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Card(
                    child: ListView(
                      children: [
                        DataTable(
                          headingRowColor: WidgetStateProperty.all(AppTheme.backgroundColor),
                          columns: const [
                            DataColumn(label: Text('Title', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Module', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Progress', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.reports.map((r) => DataRow(
                            cells: [
                              DataCell(Text(r.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(r.module)),
                              DataCell(Text(r.type)),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(r.status).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    r.status, 
                                    style: TextStyle(
                                      color: _getStatusColor(r.status),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: r.completionPercentage / 100,
                                        backgroundColor: Colors.grey[300],
                                        color: _getProgressColor(r.completionPercentage),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('${r.completionPercentage}%'),
                                  ],
                                ),
                              ),
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

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Draft': return Colors.grey;
      case 'In Progress': return Colors.blue;
      case 'Completed': return Colors.green;
      case 'Approved': return Colors.purple;
      default: return AppTheme.primaryColor;
    }
  }

  Color _getProgressColor(int progress) {
    if (progress < 30) return Colors.red;
    if (progress < 70) return Colors.orange;
    return Colors.green;
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
