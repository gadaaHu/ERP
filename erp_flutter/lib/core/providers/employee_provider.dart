import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/employee.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class EmployeeProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Employee> _employees = [];
  bool _isLoading = false;
  String? _error;

  List<Employee> get employees => _employees;
  int get totalEmployees => _employees.length;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchEmployees({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _employees = await _apiService.getEmployees(page: page);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
