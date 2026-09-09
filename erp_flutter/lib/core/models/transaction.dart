class Transaction {
  final int id;
  final String type;
  final double amount;
  final String category;
  final String description;
  final String referenceNumber;
  final DateTime date;
  final String status;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.category,
    required this.description,
    required this.referenceNumber,
    required this.date,
    required this.status,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] ?? 0,
      type: json['type'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      category: json['category'] ?? '',
      description: json['description'] ?? '',
      referenceNumber: json['referenceNumber'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : DateTime.now(),
      status: json['status'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}
