import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/core/providers/service_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:intl/intl.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Service Management', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<ServiceProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.requests.isEmpty) {
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
                    _buildStatCard('Total Requests', provider.stats['totalRequests']?.toString() ?? '0', Icons.request_page, Colors.blue),
                    const SizedBox(width: 16),
                    _buildStatCard('Open Tickets', provider.stats['open']?.toString() ?? '0', Icons.support_agent, Colors.orange),
                    const SizedBox(width: 16),
                    _buildStatCard('Resolved', provider.stats['resolved']?.toString() ?? '0', Icons.check_circle, Colors.green),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Service Requests', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('New Request'),
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
                            DataColumn(label: Text('Department', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Priority', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.requests.map((r) => DataRow(
                            cells: [
                              DataCell(Text(r.title, style: const TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(r.department)),
                              DataCell(
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 12,
                                      color: _getPriorityColor(r.priority),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(r.priority),
                                  ],
                                ),
                              ),
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
                              DataCell(Text(DateFormat.yMMMd().format(r.createdDate))),
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

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'Low': return Colors.grey;
      case 'Medium': return Colors.blue;
      case 'High': return Colors.orange;
      case 'Critical': return Colors.red;
      default: return Colors.grey;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Open': return Colors.orange;
      case 'In Progress': return Colors.blue;
      case 'Resolved': return Colors.green;
      case 'Closed': return Colors.grey;
      default: return AppTheme.primaryColor;
    }
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
