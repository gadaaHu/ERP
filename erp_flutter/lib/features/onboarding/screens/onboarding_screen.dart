import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:erp_flutter/features/onboarding/providers/onboarding_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _employeeId = 1;
  final _dateFormat = DateFormat('MMM dd, yyyy');

  final _categoryColors = {
    'HR Paperwork': Colors.purple,
    'IT Setup': Colors.blue,
    'Orientation': Colors.orange,
    'Training': Colors.green,
    'General': Colors.grey,
  };

  final _categoryIcons = {
    'HR Paperwork': Icons.description_outlined,
    'IT Setup': Icons.computer_outlined,
    'Orientation': Icons.groups_outlined,
    'Training': Icons.school_outlined,
    'General': Icons.task_alt_outlined,
  };

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OnboardingProvider>().fetchTasks(_employeeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Onboarding')),
      body: Consumer<OnboardingProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.tasks.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.tasks.isEmpty && !provider.isLoading) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.checklist_rtl, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text('No onboarding tasks yet.', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.auto_fix_high),
                    label: const Text('Generate Default Checklist'),
                    onPressed: () => provider.seedDefaultTasks(_employeeId),
                  ),
                ],
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress header
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Onboarding Progress',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                            Text(
                              '${provider.completedCount} / ${provider.totalCount} tasks done',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: provider.progress,
                            minHeight: 12,
                            backgroundColor: Colors.grey.withValues(alpha: 0.2),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              provider.progress == 1.0 ? Colors.green : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        if (provider.progress == 1.0) ...[
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.check_circle, color: Colors.green, size: 16),
                              SizedBox(width: 4),
                              Text('Onboarding complete! 🎉', style: TextStyle(color: Colors.green)),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Task list
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.tasks.length,
                    itemBuilder: (context, index) {
                      final task = provider.tasks[index];
                      final isCompleted = task['isCompleted'] == true;
                      final category = task['category'] as String? ?? 'General';
                      final catColor = _categoryColors[category] ?? Colors.grey;
                      final catIcon = _categoryIcons[category] ?? Icons.task_alt_outlined;
                      final dueDate = DateTime.parse(task['dueDate']).toLocal();

                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: catColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(catIcon, color: catColor, size: 20),
                          ),
                          title: Text(
                            task['taskName'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: isCompleted ? TextDecoration.lineThrough : null,
                              color: isCompleted ? Colors.grey : null,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 4),
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: catColor.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(category,
                                    style: TextStyle(color: catColor, fontSize: 11, fontWeight: FontWeight.w600)),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.calendar_today_outlined, size: 11, color: Colors.grey[500]),
                              const SizedBox(width: 4),
                              Text('Due: ${_dateFormat.format(dueDate)}',
                                  style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                            ],
                          ),
                          trailing: isCompleted
                              ? const Icon(Icons.check_circle, color: Colors.green)
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    visualDensity: VisualDensity.compact,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () => provider.completeTask(task['id'], _employeeId),
                                  child: const Text('Mark Done'),
                                ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
