import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:erp_flutter/features/training/providers/training_provider.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final int _currentEmployeeId = 1;

  final _statusColors = {
    'Upcoming': Colors.blue,
    'Ongoing': Colors.green,
    'Completed': Colors.grey,
    'Cancelled': Colors.red,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TrainingProvider>().fetchPrograms();
    });
  }

  void _showCreateDialog() {
    final titleCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final trainerCtrl = TextEditingController();
    DateTime startDate = DateTime.now().add(const Duration(days: 7));
    DateTime endDate = DateTime.now().add(const Duration(days: 9));

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Create Training Program'),
        content: SizedBox(
          width: 450,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Program Title')),
              const SizedBox(height: 12),
              TextField(controller: descCtrl, decoration: const InputDecoration(labelText: 'Description'), maxLines: 2),
              const SizedBox(height: 12),
              TextField(controller: trainerCtrl, decoration: const InputDecoration(labelText: 'Trainer Name')),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () {
              context.read<TrainingProvider>().createProgram({
                'title': titleCtrl.text,
                'description': descCtrl.text,
                'trainer': trainerCtrl.text,
                'startDate': startDate.toIso8601String(),
                'endDate': endDate.toIso8601String(),
                'maxParticipants': 20,
              });
              Navigator.pop(ctx);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training & Development'),
        actions: [
          ElevatedButton.icon(
            onPressed: _showCreateDialog,
            icon: const Icon(Icons.add),
            label: const Text('New Program'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Consumer<TrainingProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.programs.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text(provider.error!, style: const TextStyle(color: Colors.red)));
          }
          if (provider.programs.isEmpty) {
            return const Center(child: Text('No training programs found. Create one to get started!'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: provider.programs.length,
            itemBuilder: (context, index) {
              final p = provider.programs[index];
              final enrollments = (p['enrollments'] as List<dynamic>?) ?? [];
              final statusColor = _statusColors[p['status']] ?? Colors.grey;

              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: statusColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(p['status'], style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.bold)),
                          ),
                          const Spacer(),
                          Icon(Icons.people_alt_outlined, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Text('${enrollments.length}/${p['maxParticipants']}', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        p['title'],
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        p['description'] ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      const Divider(),
                      Row(
                        children: [
                          const Icon(Icons.person_outline, size: 14),
                          const SizedBox(width: 4),
                          Text(p['trainer'] ?? 'N/A', style: Theme.of(context).textTheme.bodySmall),
                          const Spacer(),
                          TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero, visualDensity: VisualDensity.compact),
                            onPressed: () => provider.enroll(_currentEmployeeId, p['id']),
                            child: const Text('Enroll'),
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
