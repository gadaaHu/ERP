import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:typed_data';
import 'package:erp_flutter/core/config/constants.dart';
import 'package:erp_flutter/core/models/employee.dart';
import 'package:erp_flutter/features/hr/providers/hr_provider.dart';

class AddEmployeeDialog extends StatefulWidget {
  const AddEmployeeDialog({super.key});

  @override
  State<AddEmployeeDialog> createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends State<AddEmployeeDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _departmentController = TextEditingController();
  final _positionController = TextEditingController();
  final _phoneController = TextEditingController();
  final _salaryController = TextEditingController(text: '50000');

  bool _isSubmitting = false;
  XFile? _pickedPhoto;
  Uint8List? _photoBytes; // Use bytes for reliable preview on all platforms

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _departmentController.dispose();
    _positionController.dispose();
    _phoneController.dispose();
    _salaryController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Photo Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ],
        ),
      ),
    );

    if (source != null) {
      final picker = ImagePicker();
      final image = await picker.pickImage(source: source, maxWidth: 800, imageQuality: 85);
      if (image != null) {
        final bytes = await image.readAsBytes();
        setState(() {
          _pickedPhoto = image;
          _photoBytes = bytes;
        });
      }
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    try {
      // 1. Create the employee first
      final newEmployee = await context.read<HrProvider>().addEmployee(Employee(
        id: 0,
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        department: _departmentController.text.trim(),
        position: _positionController.text.trim(),
        hireDate: DateTime.now(),
        status: 'Active',
        salary: double.tryParse(_salaryController.text) ?? 50000,
        gender: '',
        createdAt: DateTime.now(),
      ));

      // 2. If a photo was picked, upload it
      if (_pickedPhoto != null && newEmployee != null) {
        final bytes = await _pickedPhoto!.readAsBytes();
        final formData = FormData.fromMap({
          'photo': MultipartFile.fromBytes(
            bytes,
            filename: _pickedPhoto!.name,
          ),
        });
        final dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
        await dio.post('/Employees/${newEmployee.id}/photo', data: formData);
      }

      if (mounted) Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Employee'),
      content: SizedBox(
        width: 440,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Photo Picker
                GestureDetector(
                  onTap: _pickPhoto,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _photoBytes != null
                            ? MemoryImage(_photoBytes!)
                            : null,
                        child: _photoBytes == null
                            ? const Icon(Icons.person, size: 50, color: Colors.grey)
                            : null,
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap to upload photo',
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline)),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone', prefixIcon: Icon(Icons.phone_outlined)),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _departmentController,
                  decoration: const InputDecoration(labelText: 'Department', prefixIcon: Icon(Icons.business_outlined)),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _positionController,
                  decoration: const InputDecoration(labelText: 'Position', prefixIcon: Icon(Icons.work_outline)),
                  validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _salaryController,
                  decoration: const InputDecoration(labelText: 'Salary (USD)', prefixIcon: Icon(Icons.attach_money)),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
              : const Text('Save'),
        ),
      ],
    );
  }
}
