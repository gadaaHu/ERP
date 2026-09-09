import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erp_flutter/core/providers/employee_provider.dart';
import 'package:erp_flutter/core/models/employee.dart';
import 'package:erp_flutter/features/employees/widgets/employee_id_card.dart';
import 'employee_detail_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmployeeProvider>().fetchEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // TODO: navigate to add employee screen
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchCtrl,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search employees…',
              ),
              onChanged: (v) => setState(() => _query = v.toLowerCase()),
            ),
          ),
          Expanded(
            child: Consumer<EmployeeProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (provider.error != null) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.error_outline, size: 48, color: Colors.red),
                        const SizedBox(height: 8),
                        Text('Failed to load employees: ${provider.error}'),
                        TextButton(
                          onPressed: () => provider.fetchEmployees(),
                          child: const Text('Retry'),
                        )
                      ],
                    ),
                  );
                }

                final filtered = _query.isEmpty
                    ? provider.employees
                    : provider.employees.where((e) {
                        return e.fullName.toLowerCase().contains(_query) ||
                            e.email.toLowerCase().contains(_query) ||
                            e.department.toLowerCase().contains(_query);
                      }).toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No employees found.'));
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filtered.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return _EmployeeCard(employee: filtered[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _EmployeeCard extends StatelessWidget {
  final Employee employee;
  const _EmployeeCard({required this.employee});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: ExpansionTile(
        leading: _EmployeeAvatar(employee: employee, radius: 22),
        title: Text(employee.fullName, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${employee.position} • ${employee.department}'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: employee.status == 'Active'
                ? Colors.green.withValues(alpha: 0.15)
                : Colors.orange.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            employee.status,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: employee.status == 'Active' ? Colors.green : Colors.orange,
            ),
          ),
        ),
        children: [
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow(Icons.email, 'Email', employee.email),
                          const SizedBox(height: 8),
                          _buildDetailRow(Icons.phone, 'Phone', employee.phone),
                          const SizedBox(height: 8),
                          _buildDetailRow(Icons.person, 'Gender', employee.gender),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailRow(Icons.work, 'Hire Date', employee.hireDate.toLocal().toString().split(' ')[0]),
                          const SizedBox(height: 8),
                          _buildDetailRow(Icons.attach_money, 'Salary', '\$${employee.salary.toStringAsFixed(2)}'),
                          const SizedBox(height: 8),
                          _buildDetailRow(Icons.calendar_today, 'Added', employee.createdAt.toLocal().toString().split(' ')[0]),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => EmployeeIdCard(employee: employee),
                          );
                        },
                        icon: const Icon(Icons.badge),
                        label: const Text('ID Card'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => EmployeeDetailScreen(employee: employee),
                            ),
                          );
                        },
                        icon: const Icon(Icons.face_retouching_natural),
                        label: const Text('Profile'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black87, fontSize: 13),
              children: [
                TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Reusable avatar widget: shows photo if available, else shows initials.
class _EmployeeAvatar extends StatelessWidget {
  final Employee employee;
  final double radius;

  const _EmployeeAvatar({required this.employee, this.radius = 22});

  String get _initials {
    final first = employee.firstName.isNotEmpty ? employee.firstName[0] : '';
    final last = employee.lastName.isNotEmpty ? employee.lastName[0] : '';
    return (first + last).toUpperCase().isEmpty ? '?' : (first + last).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    if (employee.photoUrl != null && employee.photoUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage('http://localhost:5073${employee.photoUrl}'),
        onBackgroundImageError: (_, __) {},
        child: null,
      );
    }
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      child: Text(
        _initials,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: radius * 0.7,
        ),
      ),
    );
  }
}
