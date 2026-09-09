class ServiceRequest {
  final int id;
  final String title;
  final String description;
  final String priority;
  final String status;
  final String requestedBy;
  final String assignedTo;
  final String department;
  final DateTime createdDate;
  final DateTime? resolvedDate;

  ServiceRequest({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.requestedBy,
    required this.assignedTo,
    required this.department,
    required this.createdDate,
    this.resolvedDate,
  });

  factory ServiceRequest.fromJson(Map<String, dynamic> json) {
    return ServiceRequest(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      priority: json['priority'] ?? '',
      status: json['status'] ?? '',
      requestedBy: json['requestedBy'] ?? '',
      assignedTo: json['assignedTo'] ?? '',
      department: json['department'] ?? '',
      createdDate: json['createdDate'] != null ? DateTime.parse(json['createdDate']) : DateTime.now(),
      resolvedDate: json['resolvedDate'] != null ? DateTime.parse(json['resolvedDate']) : null,
    );
  }
}
