import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/employee.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class HrProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Employee> _employees = [];
  bool _isLoading = false;
  String _error = '';
  final Map<String, dynamic> _stats = {};

  HrProvider() {
    fetchEmployees();
  }

  List<Employee> get employees => _employees;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchEmployees() async {
    _isLoading = true;
    _error = '';
    notifyListeners();
    try {
      _employees = await _apiService.getEmployees();
    } catch (e, s) {
      _error = '$e\n$s';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Employee?> addEmployee(Employee employee) async {
    _isLoading = true;
    notifyListeners();
    try {
      final created = await _apiService.createEmployee(employee.toJson());
      await fetchEmployees();
      return created;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      rethrow;
    }
  }
}
