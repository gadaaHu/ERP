class PurchaseOrder {
  final int id;
  final String orderNumber;
  final String vendor;
  final String description;
  final double totalAmount;
  final String status;
  final DateTime orderDate;
  final DateTime? deliveryDate;
  final String requestedBy;
  final DateTime createdAt;

  PurchaseOrder({
    required this.id,
    required this.orderNumber,
    required this.vendor,
    required this.description,
    required this.totalAmount,
    required this.status,
    required this.orderDate,
    this.deliveryDate,
    required this.requestedBy,
    required this.createdAt,
  });

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) {
    return PurchaseOrder(
      id: json['id'] ?? 0,
      orderNumber: json['orderNumber'] ?? '',
      vendor: json['vendor'] ?? '',
      description: json['description'] ?? '',
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      orderDate: json['orderDate'] != null ? DateTime.parse(json['orderDate']) : DateTime.now(),
      deliveryDate: json['deliveryDate'] != null ? DateTime.parse(json['deliveryDate']) : null,
      requestedBy: json['requestedBy'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
    );
  }
}
