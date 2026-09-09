import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/models/employee.dart';
import '../../../core/services/api_service.dart';
import '../../../providers/leave_provider.dart';

class EmployeeDetailScreen extends ConsumerStatefulWidget {
  final Employee employee;

  const EmployeeDetailScreen({super.key, required this.employee});

  @override
  ConsumerState<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends ConsumerState<EmployeeDetailScreen> {
  bool _isUploadingPhoto = false;
  String? _uploadedPhotoUrl;

  @override
  Widget build(BuildContext context) {
    final emp = widget.employee;
    final baseUrl = ApiService.baseUrl.replaceAll('/api', '');

    final photoUrl = _uploadedPhotoUrl ?? emp.photoUrl;
    final hasPhoto = photoUrl != null && photoUrl.isNotEmpty;
    final fullPhotoUrl = hasPhoto ? '$baseUrl$photoUrl' : null;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: CustomScrollView(
        slivers: [
          // ── Hero App Bar ────────────────────────────────
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFF1E293B),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF312E81), Color(0xFF1E293B)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  // Avatar + enroll button
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 56),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: const Color(0xFF6366F1),
                            backgroundImage:
                                fullPhotoUrl != null ? NetworkImage(fullPhotoUrl) : null,
                            child: fullPhotoUrl == null
                                ? Text(
                                    emp.fullName.isNotEmpty
                                        ? emp.fullName[0].toUpperCase()
                                        : '?',
                                    style: const TextStyle(
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          ),
                          // Upload button overlay
                          GestureDetector(
                            onTap: _isUploadingPhoto ? null : () => _pickAndUploadPhoto(emp.id),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF6366F1),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: _isUploadingPhoto
                                  ? const SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        emp.fullName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        emp.position,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ── Details ──────────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // ── Status badge ────────────────────────
                _StatusBadge(status: emp.status),
                const SizedBox(height: 24),

                // ── Info card ───────────────────────────
                _InfoCard(
                  title: 'Employee Information',
                  icon: Icons.person_outline,
                  children: [
                    _InfoRow(label: 'Department', value: emp.department),
                    _InfoRow(label: 'Position', value: emp.position),
                    _InfoRow(label: 'Email', value: emp.email),
                    _InfoRow(label: 'Phone', value: emp.phone),
                    _InfoRow(
                      label: 'Hire Date',
                      value: '${emp.hireDate.day}/${emp.hireDate.month}/${emp.hireDate.year}',
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ── Face Recognition card ───────────────
                _InfoCard(
                  title: 'Face Recognition',
                  icon: Icons.face_retouching_natural,
                  accentColor: const Color(0xFF6366F1),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        hasPhoto
                            ? 'A profile photo is set. Upload a new photo to re-enroll the face profile.'
                            : 'No profile photo yet. Upload a photo to enroll this employee for face attendance.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.6),
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed:
                            _isUploadingPhoto ? null : () => _pickAndUploadPhoto(emp.id),
                        icon: _isUploadingPhoto
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                              )
                            : const Icon(Icons.upload_rounded),
                        label: Text(
                          _isUploadingPhoto ? 'Enrolling…' : 'Upload & Enroll Face',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ── Salary card ─────────────────────────
                _InfoCard(
                  title: 'Compensation',
                  icon: Icons.payments_outlined,
                  accentColor: const Color(0xFF22C55E),
                  children: [
                    _InfoRow(
                      label: 'Monthly Salary',
                      value: '\$${emp.salary.toStringAsFixed(2)}',
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickAndUploadPhoto(int employeeId) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
      maxWidth: 1024,
    );
    if (picked == null) return;

    setState(() => _isUploadingPhoto = true);
    try {
      final api = ref.read(apiServiceProvider);
      final newPhotoUrl = await api.uploadEmployeePhoto(employeeId, picked.path);
      setState(() {
        _uploadedPhotoUrl = newPhotoUrl;
        _isUploadingPhoto = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Photo uploaded & face enrolled successfully!'),
            backgroundColor: Color(0xFF22C55E),
          ),
        );
      }
    } catch (e) {
      setState(() => _isUploadingPhoto = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Upload failed: $e'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}

// ── Supporting Widgets ─────────────────────────────────

class _InfoCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;
  final Color accentColor;

  const _InfoCard({
    required this.title,
    required this.icon,
    required this.children,
    this.accentColor = const Color(0xFF818CF8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: accentColor, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Colors.white12, height: 1),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 13,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    final isActive = status.toLowerCase() == 'active';
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: isActive
              ? const Color(0xFF22C55E).withValues(alpha: 0.15)
              : Colors.red.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive
                ? const Color(0xFF22C55E).withValues(alpha: 0.4)
                : Colors.red.withValues(alpha: 0.4),
          ),
        ),
        child: Text(
          status,
          style: TextStyle(
            color: isActive ? const Color(0xFF22C55E) : Colors.redAccent,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
