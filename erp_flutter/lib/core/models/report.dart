class Report {
  final int id;
  final String title;
  final String module;
  final String type;
  final String period;
  final String status;
  final String createdBy;
  final DateTime createdDate;
  final DateTime? dueDate;
  final int completionPercentage;

  Report({
    required this.id,
    required this.title,
    required this.module,
    required this.type,
    required this.period,
    required this.status,
    required this.createdBy,
    required this.createdDate,
    this.dueDate,
    required this.completionPercentage,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      module: json['module'] ?? '',
      type: json['type'] ?? '',
      period: json['period'] ?? '',
      status: json['status'] ?? '',
      createdBy: json['createdBy'] ?? '',
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      completionPercentage: json['completionPercentage'] ?? 0,
    );
  }
}
