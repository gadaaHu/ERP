import 'package:flutter/material.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class AppraisalProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String? _error;
  List<dynamic> _appraisals = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get appraisals => _appraisals;

  Future<void> fetchEmployeeAppraisals(int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.get('/appraisal/employee/$employeeId');
      _appraisals = response.data as List<dynamic>;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createAppraisal(Map<String, dynamic> data) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.client.post('/appraisal', data: data);
      
      if (data['employeeId'] != null) {
        await fetchEmployeeAppraisals(data['employeeId'] as int);
      }
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
