import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/employee.dart';
import 'package:erp_flutter/core/config/theme.dart';

class EmployeeIdCard extends StatelessWidget {
  final Employee employee;

  const EmployeeIdCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            // ID Card Header
            Container(
              height: 120,
              decoration: const BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    top: 20,
                    child: Text(
                      'ERP SYSTEM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: (employee.photoUrl != null && employee.photoUrl!.isNotEmpty)
                            ? NetworkImage('http://localhost:5073${employee.photoUrl}') as ImageProvider
                            : null,
                        child: (employee.photoUrl == null || employee.photoUrl!.isEmpty)
                            ? Text(
                                employee.firstName.isNotEmpty ? employee.firstName.substring(0, 1) + (employee.lastName.isNotEmpty ? employee.lastName.substring(0, 1) : '') : '?',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.primaryColor,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            
            // Employee Info
            Text(
              employee.fullName.toUpperCase(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              employee.position,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              employee.department,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Divider(),
            ),
            
            // ID Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  _buildIdRow('ID No:', 'EMP-${employee.id.toString().padLeft(4, '0')}'),
                  const SizedBox(height: 8),
                  _buildIdRow('Blood Group:', 'O+'), // Placeholder
                  const SizedBox(height: 8),
                  _buildIdRow('Issued:', DateTime.now().toLocal().toString().split(' ')[0]),
                ],
              ),
            ),
            
            const Spacer(),
            
            // Barcode placeholder
            Container(
              height: 40,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  20,
                  (index) => Container(
                    width: index % 2 == 0 ? 3 : 1,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildIdRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
