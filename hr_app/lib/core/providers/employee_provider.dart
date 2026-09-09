import 'package:flutter/material.dart';
import 'package:hr_app/core/services/api_service.dart';
import 'package:hr_app/core/models/employee.dart';

class EmployeeProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  bool _isLoading = false;
  String? _error;
  List<Employee> _employees = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Employee> get employees => _employees;
  int get totalEmployees => _employees.length;

  Future<void> loadEmployees() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _employees = await _apiService.getEmployees();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
