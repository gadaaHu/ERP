import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/features/purchase/providers/purchase_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:intl/intl.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(name: 'ETB');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Management', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<PurchaseProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.orders.isEmpty) {
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
                    _buildStatCard('Total Orders', provider.stats['totalOrders']?.toString() ?? '0', Icons.shopping_cart, Colors.blue),
                    const SizedBox(width: 16),
                    _buildStatCard('Pending Approvals', provider.stats['pending']?.toString() ?? '0', Icons.hourglass_empty, Colors.orange),
                    const SizedBox(width: 16),
                    _buildStatCard('Active Vendors', provider.stats['vendors']?.toString() ?? '0', Icons.store, Colors.purple),
                  ],
                ),
                const SizedBox(height: 32),
                
                // Header row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Purchase Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text('Create PO'),
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
                            DataColumn(label: Text('PO Number', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Vendor', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Amount', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.orders.map((o) => DataRow(
                            cells: [
                              DataCell(Text(o.orderNumber, style: const TextStyle(fontWeight: FontWeight.bold))),
                              DataCell(Text(o.vendor)),
                              DataCell(Text(DateFormat.yMMMd().format(o.orderDate))),
                              DataCell(Text(formatCurrency.format(o.totalAmount))),
                              DataCell(
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: _getStatusColor(o.status).withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    o.status, 
                                    style: TextStyle(
                                      color: _getStatusColor(o.status),
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
      case 'Draft': return Colors.grey;
      case 'Pending Approval': return Colors.orange;
      case 'Approved': return Colors.blue;
      case 'Completed': return Colors.green;
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
