import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/core/providers/asset_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:intl/intl.dart';

class AssetScreen extends StatelessWidget {
  const AssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(name: 'ETB');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixed Assets & Property', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<AssetProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.assets.isEmpty) {
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
                    _buildStatCard('Total Assets', provider.stats['totalAssets']?.toString() ?? '0', Icons.inventory, Colors.indigo),
                    const SizedBox(width: 16),
                    _buildStatCard('Total Value', formatCurrency.format(provider.stats['totalValue'] ?? 0), Icons.monetization_on, Colors.green),
                    const SizedBox(width: 16),
                    _buildStatCard('In Maintenance', provider.stats['inMaintenance']?.toString() ?? '0', Icons.build, Colors.orange),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Asset Directory', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Register Asset'),
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
                            DataColumn(label: Text('Code', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Name', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Category', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Current Value', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.assets.map((a) => DataRow(
                            cells: [
                              DataCell(Text(a.assetCode, style: const TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(a.name)),
                              DataCell(Text(a.category)),
                              DataCell(Text(formatCurrency.format(a.currentValue))),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(a.status).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    a.status, 
                                    style: TextStyle(
                                      color: _getStatusColor(a.status),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ),
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
      case 'Active': return Colors.green;
      case 'In Maintenance': return Colors.orange;
      case 'Retired': return Colors.grey;
      case 'Lost': return Colors.red;
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
