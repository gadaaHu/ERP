import 'package:flutter/material.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class TrainingProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String? _error;
  List<dynamic> _programs = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get programs => _programs;

  Future<void> fetchPrograms() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.get('/training/programs');
      _programs = response.data as List<dynamic>;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> createProgram(Map<String, dynamic> data) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      await _apiService.client.post('/training/programs', data: data);
      await fetchPrograms();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> enroll(int employeeId, int programId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      await _apiService.client.post('/training/enroll', data: {
        'employeeId': employeeId,
        'trainingProgramId': programId,
      });
      await fetchPrograms();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> markComplete(int enrollmentId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      await _apiService.client.put('/training/enrollments/$enrollmentId/complete');
      await fetchPrograms();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
