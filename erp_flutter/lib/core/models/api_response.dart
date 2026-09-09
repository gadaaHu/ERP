class ApiResponse<T> {
  final bool success;
  final T? data;
  final String message;
  final List<String> errors;
  final DateTime timestamp;

  ApiResponse({
    required this.success,
    this.data,
    required this.message,
    this.errors = const [],
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return ApiResponse(
      success: json['success'] ?? false,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      message: json['message'] ?? '',
      errors: (json['errors'] as List?)?.map((e) => e.toString()).toList() ?? [],
      timestamp: json['timestamp'] != null 
          ? DateTime.parse(json['timestamp']) 
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data,
      'message': message,
      'errors': errors,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
