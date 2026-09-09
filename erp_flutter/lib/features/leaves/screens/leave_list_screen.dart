import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../providers/leave_provider.dart';
import '../widgets/leave_card.dart';

class LeaveListScreen extends ConsumerWidget {
  const LeaveListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaveRequestsAsync = ref.watch(leaveRequestNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Leave Requests')),
      body: leaveRequestsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (leaves) {
          if (leaves.isEmpty) {
            return const Center(child: Text('No pending leave requests.'));
          }
          return ListView.builder(
            padding: const EdgeInsets.only(top: 8, bottom: 80), // Padding for FAB
            itemCount: leaves.length,
            itemBuilder: (context, index) {
              final leave = leaves[index];
              return LeaveCard(
                request: leave,
                onTap: () {
                  // Navigate to details if implemented
                  // context.push('/leave/details', extra: leave);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/leave/apply'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
