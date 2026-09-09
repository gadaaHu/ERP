class Document {
  final int id;
  final String title;
  final String category;
  final String fileType;
  final int fileSize;
  final String uploadedBy;
  final DateTime uploadDate;
  final int version;
  final String status;
  final String department;
  final DateTime createdAt;

  Document({
    required this.id,
    required this.title,
    required this.category,
    required this.fileType,
    required this.fileSize,
    required this.uploadedBy,
    required this.uploadDate,
    required this.version,
    required this.status,
    required this.department,
    required this.createdAt,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      category: json['category'] ?? '',
      fileType: json['fileType'] ?? '',
      fileSize: json['fileSize'] ?? 0,
      uploadedBy: json['uploadedBy'] ?? '',
      uploadDate: json['uploadDate'] != null ? DateTime.parse(json['uploadDate']) : DateTime.now(),
      version: json['version'] ?? 1,
      status: json['status'] ?? '',
      department: json['department'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}
