import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:erp_flutter/features/appraisal/providers/appraisal_provider.dart';

class AppraisalScreen extends StatefulWidget {
  const AppraisalScreen({super.key});

  @override
  State<AppraisalScreen> createState() => _AppraisalScreenState();
}

class _AppraisalScreenState extends State<AppraisalScreen> {
  final _dateFormat = DateFormat('MMM dd, yyyy');
  final int _employeeId = 1; // Hardcoded for prototype

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppraisalProvider>().fetchEmployeeAppraisals(_employeeId);
    });
  }

  void _showCreateAppraisalDialog() {
    showDialog(
      context: context,
      builder: (context) => _CreateAppraisalDialog(employeeId: _employeeId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Appraisals'),
        actions: [
          ElevatedButton.icon(
            onPressed: _showCreateAppraisalDialog,
            icon: const Icon(Icons.star),
            label: const Text('New Review'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Consumer<AppraisalProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.appraisals.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!, style: const TextStyle(color: Colors.red)));
          }

          if (provider.appraisals.isEmpty) {
            return const Center(child: Text('No performance reviews found.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.appraisals.length,
            itemBuilder: (context, index) {
              final review = provider.appraisals[index];
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
                          Row(
                            children: List.generate(5, (starIndex) {
                              return Icon(
                                starIndex < (review['score'] ?? 0) ? Icons.star : Icons.star_border,
                                color: Colors.amber,
                                size: 24,
                              );
                            }),
                          ),
                          Text(
                            _dateFormat.format(DateTime.parse(review['reviewDate']).toLocal()),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text('Goals Achieved', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(review['goals'] ?? 'None'),
                      const SizedBox(height: 12),
                      Text('Reviewer Comments', style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(review['comments'] ?? 'None'),
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

class _CreateAppraisalDialog extends StatefulWidget {
  final int employeeId;
  const _CreateAppraisalDialog({required this.employeeId});

  @override
  State<_CreateAppraisalDialog> createState() => _CreateAppraisalDialogState();
}

class _CreateAppraisalDialogState extends State<_CreateAppraisalDialog> {
  int _score = 3;
  final _goalsController = TextEditingController();
  final _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Submit Performance Review'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(index < _score ? Icons.star : Icons.star_border),
                  color: Colors.amber,
                  iconSize: 32,
                  onPressed: () => setState(() => _score = index + 1),
                );
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _goalsController,
              decoration: const InputDecoration(labelText: 'Goals Achieved'),
              maxLines: 2,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _commentsController,
              decoration: const InputDecoration(labelText: 'Comments'),
              maxLines: 3,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AppraisalProvider>().createAppraisal({
              'employeeId': widget.employeeId,
              'reviewerId': 2, // Hardcoded HR Manager ID
              'score': _score,
              'goals': _goalsController.text,
              'comments': _commentsController.text,
            });
            Navigator.pop(context);
          },
          child: const Text('Submit Review'),
        ),
      ],
    );
  }
}
