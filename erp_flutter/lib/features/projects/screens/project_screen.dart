import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/core/providers/project_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:intl/intl.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(name: 'ETB');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Business & Project Management', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<ProjectProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.projects.isEmpty) {
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
                    _buildStatCard('Active Projects', provider.stats['activeProjects']?.toString() ?? '0', Icons.business_center, Colors.indigo),
                    const SizedBox(width: 16),
                    _buildStatCard('Completed', provider.stats['completedProjects']?.toString() ?? '0', Icons.task_alt, Colors.green),
                    const SizedBox(width: 16),
                    _buildStatCard('Avg Progress', '${provider.stats['avgProgress'] ?? 0}%', Icons.trending_up, Colors.orange),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Project Portfolio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('New Project'),
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
                            DataColumn(label: Text('Project Name', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Manager', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Deadline', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Budget', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Progress', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.projects.map((p) => DataRow(
                            cells: [
                              DataCell(Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(p.manager)),
                              DataCell(Text(DateFormat.yMMMd().format(p.endDate))),
                              DataCell(Text(formatCurrency.format(p.budget))),
                              DataCell(
                                Row(
                                  children: [
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: p.progress / 100,
                                        backgroundColor: Colors.grey[300],
                                        color: _getProgressColor(p.progress),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text('${p.progress}%'),
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
