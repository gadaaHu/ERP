import 'package:flutter/material.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class PayrollProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String? _error;
  List<dynamic> _payrolls = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get payrolls => _payrolls;

  Future<void> fetchPayrolls() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.get('/payroll');
      _payrolls = response.data as List<dynamic>;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> generatePayroll(int month, int year) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.client.post('/payroll/generate', data: {
        'month': month,
        'year': year,
      });
      
      // Refresh list
      await fetchPayrolls();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
