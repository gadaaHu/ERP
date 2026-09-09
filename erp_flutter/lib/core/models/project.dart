class Project {
  final int id;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final double budget;
  final double spentAmount;
  final int progress;
  final String status;
  final String manager;
  final int teamSize;
  final DateTime createdAt;

  Project({
    required this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.budget,
    required this.spentAmount,
    required this.progress,
    required this.status,
    required this.manager,
    required this.teamSize,
    required this.createdAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      startDate: json['startDate'] != null ? DateTime.parse(json['startDate']) : DateTime.now(),
      endDate: json['endDate'] != null ? DateTime.parse(json['endDate']) : DateTime.now(),
      budget: (json['budget'] ?? 0).toDouble(),
      spentAmount: (json['spentAmount'] ?? 0).toDouble(),
      progress: json['progress'] ?? 0,
      status: json['status'] ?? '',
      manager: json['manager'] ?? '',
      teamSize: json['teamSize'] ?? 0,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}
