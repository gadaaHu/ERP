import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/core/providers/document_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';
import 'package:intl/intl.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document Management', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Consumer<DocumentProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.documents.isEmpty) {
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
                    _buildStatCard('Total Documents', provider.stats['totalDocuments']?.toString() ?? '0', Icons.file_copy, Colors.blue),
                    const SizedBox(width: 16),
                    _buildStatCard('Storage Used', '${provider.stats['storageMB'] ?? 0} MB', Icons.storage, Colors.purple),
                    const SizedBox(width: 16),
                    _buildStatCard('Active Users', '12', Icons.people, Colors.green),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Document Repository', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Upload File'),
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
                            DataColumn(label: Text('File Name', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Category', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Size', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Uploaded By', style: TextStyle(fontWeight: FontWeight.bold))),
                            DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
                          ],
                          rows: provider.documents.map((d) => DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    Icon(_getFileIcon(d.fileType), color: Colors.grey[600]),
                                    const SizedBox(width: 8),
                                    Text(d.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              DataCell(Text(d.category)),
                              DataCell(Text('${d.fileSize} KB')),
                              DataCell(Text(d.uploadedBy)),
                              DataCell(Text(DateFormat.yMMMd().format(d.uploadDate))),
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

  IconData _getFileIcon(String type) {
    switch (type.toLowerCase()) {
      case 'pdf': return Icons.picture_as_pdf;
      case 'docx': return Icons.description;
      case 'xlsx': return Icons.table_chart;
      default: return Icons.insert_drive_file;
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
