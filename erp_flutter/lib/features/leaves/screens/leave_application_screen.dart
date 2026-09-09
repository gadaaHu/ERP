import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../providers/leave_provider.dart';
import '../../../core/models/create_leave_request_dto.dart';
import '../../../core/widgets/loading_widget.dart';

class LeaveApplicationScreen extends ConsumerStatefulWidget {
  const LeaveApplicationScreen({super.key});

  @override
  ConsumerState<LeaveApplicationScreen> createState() => _LeaveApplicationScreenState();
}

class _LeaveApplicationScreenState extends ConsumerState<LeaveApplicationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _reasonController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedLeaveTypeId;
  bool _isHalfDay = false;

  @override
  Widget build(BuildContext context) {
    // Assuming leaveTypesProvider is defined elsewhere or will be added. 
    // Wait, the user's snippet references `leaveTypesProvider` which isn't in leave_provider.dart.
    // I'll leave it as in the snippet for now.
    final leaveTypesAsync = ref.watch(leaveTypesProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apply for Leave'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: leaveTypesAsync.when(
        loading: () => const LoadingWidget(),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (leaveTypes) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                // Leave Type Dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Leave Type',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.event_note),
                  ),
                  value: _selectedLeaveTypeId,
                  items: leaveTypes.map((type) {
                    return DropdownMenuItem(
                      value: type.id,
                      child: Row(
                        children: [
                          Icon(Icons.circle, color: Color(int.parse(type.colorCode ?? '0xFF000000'))),
                          const SizedBox(width: 8),
                          Text(type.name),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedLeaveTypeId = value),
                  validator: (value) => value == null ? 'Please select a leave type' : null,
                ),
                const SizedBox(height: 16),

                // Date Selection
                Row(
                  children: [
                    Expanded(
                      child: _buildDatePicker(
                        label: 'Start Date',
                        date: _startDate,
                        onChanged: (date) => setState(() => _startDate = date),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildDatePicker(
                        label: 'End Date',
                        date: _endDate,
                        onChanged: (date) => setState(() => _endDate = date),
                        firstDate: _startDate,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Half Day Toggle
                SwitchListTile(
                  title: const Text('Half Day'),
                  subtitle: const Text('Apply for half day leave'),
                  value: _isHalfDay,
                  onChanged: (value) => setState(() => _isHalfDay = value),
                  secondary: Icon(
                    _isHalfDay ? Icons.sunny : Icons.brightness_5,
                    color: _isHalfDay ? Colors.orange : Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),

                // Reason TextField
                TextFormField(
                  controller: _reasonController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelText: 'Reason for Leave',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.note),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) => 
                      value?.isEmpty ?? true ? 'Please provide a reason' : null,
                ),
                const SizedBox(height: 24),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _submitLeaveRequest,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Submit Request',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDatePicker({
    required String label,
    required DateTime? date,
    required Function(DateTime) onChanged,
    DateTime? firstDate,
  }) {
    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(2020),
          lastDate: DateTime(2030),
          locale: const Locale('en', 'US'),
        );
        if (picked != null) onChanged(picked);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: Colors.grey.shade600),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                date != null 
                    ? DateFormat('MMM d, y').format(date) 
                    : label,
                style: TextStyle(
                  color: date != null ? Colors.black : Colors.grey.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitLeaveRequest() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both start and end dates')),
      );
      return;
    }

    final request = CreateLeaveRequestDto(
      leaveTypeId: _selectedLeaveTypeId!,
      startDate: _startDate!,
      endDate: _endDate!,
      reason: _reasonController.text,
      isHalfDay: _isHalfDay,
    );

    try {
      await ref.read(leaveRequestNotifierProvider.notifier)
          .createLeaveRequest(request);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Leave request submitted successfully!')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }
}
