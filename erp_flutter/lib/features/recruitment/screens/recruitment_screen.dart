import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:erp_flutter/features/recruitment/providers/recruitment_provider.dart';
import 'package:erp_flutter/core/config/theme.dart';

class RecruitmentScreen extends StatefulWidget {
  const RecruitmentScreen({super.key});

  @override
  State<RecruitmentScreen> createState() => _RecruitmentScreenState();
}

class _RecruitmentScreenState extends State<RecruitmentScreen> {
  final _dateFormat = DateFormat('MMM dd, yyyy');
  int? _selectedJobId;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecruitmentProvider>().fetchJobOpenings();
    });
  }

  void _showCreateJobDialog() {
    showDialog(
      context: context,
      builder: (context) => const _CreateJobDialog(),
    );
  }

  void _showApplyDialog(int jobId, String jobTitle) {
    showDialog(
      context: context,
      builder: (context) => _ApplyDialog(jobId: jobId, jobTitle: jobTitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recruitment'),
        actions: [
          ElevatedButton.icon(
            onPressed: _showCreateJobDialog,
            icon: const Icon(Icons.add),
            label: const Text('Post New Job'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Consumer<RecruitmentProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.jobOpenings.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (provider.error != null) {
            return Center(child: Text(provider.error!, style: const TextStyle(color: Colors.red)));
          }
          if (provider.jobOpenings.isEmpty) {
            return const Center(child: Text('No active job openings.'));
          }

          return Row(
            children: [
              // Left: Job Openings List
              SizedBox(
                width: 360,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      child: Text('Job Openings (${provider.jobOpenings.length})',
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: provider.jobOpenings.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemBuilder: (context, index) {
                          final job = provider.jobOpenings[index];
                          final jobId = job['id'] as int;
                          final isSelected = _selectedJobId == jobId;

                          return Card(
                            elevation: isSelected ? 4 : 1,
                            color: isSelected ? AppTheme.primaryColor.withValues(alpha: 0.08) : null,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: isSelected ? AppTheme.primaryColor : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                setState(() => _selectedJobId = jobId);
                                provider.fetchApplications(jobId);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            job['jobTitle'] ?? 'Unknown Position',
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        _StatusBadge(status: job['status']),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      job['jobDescription'] ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Icon(Icons.people, size: 14, color: Colors.blue[700]),
                                        const SizedBox(width: 4),
                                        Text('${job['applicationCount'] ?? 0} applicants',
                                            style: TextStyle(fontSize: 12, color: Colors.blue[700], fontWeight: FontWeight.w600)),
                                        const Spacer(),
                                        Icon(Icons.calendar_today, size: 12, color: Colors.grey[500]),
                                        const SizedBox(width: 4),
                                        Text(
                                          _dateFormat.format(DateTime.parse(job['deadlineDate']).toLocal()),
                                          style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      width: double.infinity,
                                      child: OutlinedButton.icon(
                                        onPressed: () => _showApplyDialog(jobId, job['jobTitle'] ?? ''),
                                        icon: const Icon(Icons.person_add, size: 14),
                                        label: const Text('Add Applicant', style: TextStyle(fontSize: 12)),
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 6),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Divider
              const VerticalDivider(width: 1),

              // Right: Applicants Panel
              Expanded(
                child: _selectedJobId == null
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.touch_app, size: 64, color: Colors.grey[300]),
                            const SizedBox(height: 16),
                            Text('Select a job to view applicants',
                                style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                          ],
                        ),
                      )
                    : _ApplicantsPanel(
                        jobId: _selectedJobId!,
                        jobTitle: (provider.jobOpenings
                                .firstWhere((j) => j['id'] == _selectedJobId, orElse: () => {})['jobTitle'] as String?) ??
                            '',
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─────────────────────────── Applicants Panel ────────────────────────────

class _ApplicantsPanel extends StatelessWidget {
  final int jobId;
  final String jobTitle;
  const _ApplicantsPanel({required this.jobId, required this.jobTitle});

  @override
  Widget build(BuildContext context) {
    return Consumer<RecruitmentProvider>(
      builder: (context, provider, _) {
        final applicants = provider.applicantsMap[jobId] ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text(
                'Applicants for "$jobTitle"  (${applicants.length})',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
            if (applicants.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.inbox, size: 56, color: Colors.grey[300]),
                      const SizedBox(height: 12),
                      Text('No applicants yet.', style: TextStyle(color: Colors.grey[500])),
                    ],
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: applicants.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final app = applicants[index];
                    return _ApplicantCard(applicant: app, jobId: jobId);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────── Applicant Card ────────────────────────────

class _ApplicantCard extends StatelessWidget {
  final Map<String, dynamic> applicant;
  final int jobId;
  const _ApplicantCard({required this.applicant, required this.jobId});

  bool get isPassed => applicant['offerAccepted'] == true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: isPassed ? Colors.green.withValues(alpha: 0.15) : Colors.blue.withValues(alpha: 0.12),
              child: Text(
                (applicant['applicantName'] as String? ?? '?')[0].toUpperCase(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isPassed ? Colors.green[700] : Colors.blue[700],
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        applicant['applicantName'] ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      if (isPassed) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('✓ Hired', style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(applicant['email'] ?? '', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  if ((applicant['phone'] as String?)?.isNotEmpty == true)
                    Text(applicant['phone']!, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
                ],
              ),
            ),
            if (!isPassed)
              FilledButton.icon(
                onPressed: () async {
                  final appId = applicant['id'] as int;
                  final name = applicant['applicantName'] ?? 'Applicant';

                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Confirm Pass'),
                      content: Text('Mark "$name" as PASSED and add them to the Employee list?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
                        FilledButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Pass & Hire')),
                      ],
                    ),
                  );

                  if (confirmed == true && context.mounted) {
                    final msg = await context.read<RecruitmentProvider>().passApplicant(appId, jobId);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(msg ?? 'Done!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.check_circle, size: 16),
                label: const Text('Pass'),
                style: FilledButton.styleFrom(backgroundColor: Colors.green),
              )
            else
              const Icon(Icons.check_circle, color: Colors.green, size: 28),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────── Status Badge ────────────────────────────

class _StatusBadge extends StatelessWidget {
  final dynamic status;
  const _StatusBadge({this.status});

  @override
  Widget build(BuildContext context) {
    final color = status == 0 ? Colors.green : Colors.grey;
    final label = status == 0 ? 'Open' : 'Closed';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(12)),
      child: Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }
}

// ─────────────────────────── Create Job Dialog ────────────────────────────

class _CreateJobDialog extends StatefulWidget {
  const _CreateJobDialog();
  @override
  State<_CreateJobDialog> createState() => _CreateJobDialogState();
}

class _CreateJobDialogState extends State<_CreateJobDialog> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _reqsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Post New Job Opening'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _titleController, decoration: const InputDecoration(labelText: 'Job Title', prefixIcon: Icon(Icons.work_outline))),
            const SizedBox(height: 14),
            TextField(controller: _descController, decoration: const InputDecoration(labelText: 'Job Description', prefixIcon: Icon(Icons.description_outlined)), maxLines: 2),
            const SizedBox(height: 14),
            TextField(controller: _reqsController, decoration: const InputDecoration(labelText: 'Requirements', prefixIcon: Icon(Icons.checklist)), maxLines: 2),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            context.read<RecruitmentProvider>().createJobOpening({
              'jobTitle': _titleController.text,
              'jobDescription': _descController.text,
              'jobRequirements': _reqsController.text,
              'numberOfPositions': 1,
              'deadlineDate': DateTime.now().add(const Duration(days: 30)).toIso8601String(),
              'departmentId': 1,
              'positionId': 1,
              'requestedBy': 1,
            });
            Navigator.pop(context);
          },
          child: const Text('Post Job'),
        ),
      ],
    );
  }
}

// ─────────────────────────── Apply Dialog ────────────────────────────

class _ApplyDialog extends StatefulWidget {
  final int jobId;
  final String jobTitle;
  const _ApplyDialog({required this.jobId, required this.jobTitle});
  @override
  State<_ApplyDialog> createState() => _ApplyDialogState();
}

class _ApplyDialogState extends State<_ApplyDialog> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Applicant — ${widget.jobTitle}'),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person_outline))),
            const SizedBox(height: 14),
            TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email_outlined))),
            const SizedBox(height: 14),
            TextField(controller: _phoneController, decoration: const InputDecoration(labelText: 'Phone', prefixIcon: Icon(Icons.phone_outlined))),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
        ElevatedButton(
          onPressed: () {
            context.read<RecruitmentProvider>().applyForJob(widget.jobId, {
              'applicantName': _nameController.text,
              'email': _emailController.text,
              'phone': _phoneController.text,
              'resumeUrl': '',
              'coverLetter': '',
            });
            Navigator.pop(context);
          },
          child: const Text('Add Applicant'),
        ),
      ],
    );
  }
}
