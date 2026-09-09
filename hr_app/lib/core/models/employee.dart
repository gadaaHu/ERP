class Employee {
  final int id;
  final String fullName;
  final String email;
  final String phone;
  final String department;
  final String position;
  final DateTime hireDate;
  final String status;
  final double salary;
  final String gender;
  final DateTime createdAt;

  Employee({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.department,
    required this.position,
    required this.hireDate,
    required this.status,
    required this.salary,
    required this.gender,
    required this.createdAt,
  });

  // Convenience getters for backward compatibility with UI code
  String get firstName => fullName.split(' ').first;
  String get lastName => fullName.split(' ').length > 1 
      ? fullName.split(' ').sublist(1).join(' ') 
      : '';

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      department: json['department'] ?? '',
      position: json['position'] ?? '',
      hireDate: DateTime.parse(json['hireDate'] ?? DateTime.now().toIso8601String()),
      status: json['status'] ?? 'Active',
      salary: (json['salary'] as num?)?.toDouble() ?? 0.0,
      gender: json['gender'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'phone': phone,
      'department': department,
      'position': position,
      'hireDate': hireDate.toIso8601String(),
      'status': status,
      'salary': salary,
      'gender': gender,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
