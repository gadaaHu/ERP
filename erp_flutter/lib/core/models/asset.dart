class Asset {
  final int id;
  final String name;
  final String assetCode;
  final String category;
  final String location;
  final DateTime purchaseDate;
  final double purchasePrice;
  final double currentValue;
  final String status;
  final String assignedTo;
  final DateTime createdAt;

  Asset({
    required this.id,
    required this.name,
    required this.assetCode,
    required this.category,
    required this.location,
    required this.purchaseDate,
    required this.purchasePrice,
    required this.currentValue,
    required this.status,
    required this.assignedTo,
    required this.createdAt,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      assetCode: json['assetCode'] ?? '',
      category: json['category'] ?? '',
      location: json['location'] ?? '',
      purchaseDate: json['purchaseDate'] != null ? DateTime.parse(json['purchaseDate']) : DateTime.now(),
      purchasePrice: (json['purchasePrice'] ?? 0).toDouble(),
      currentValue: (json['currentValue'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      assignedTo: json['assignedTo'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}
