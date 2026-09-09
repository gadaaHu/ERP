import 'package:flutter/material.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class OnboardingProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String? _error;
  List<dynamic> _tasks = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get tasks => _tasks;

  int get completedCount => _tasks.where((t) => t['isCompleted'] == true).length;
  int get totalCount => _tasks.length;
  double get progress => totalCount == 0 ? 0 : completedCount / totalCount;

  Future<void> fetchTasks(int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      final response = await _apiService.client.get('/onboarding/employee/$employeeId');
      _tasks = response.data as List<dynamic>;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> seedDefaultTasks(int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      await _apiService.client.post('/onboarding/seed/$employeeId');
      await fetchTasks(employeeId);
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> completeTask(int taskId, int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();
      await _apiService.client.put('/onboarding/$taskId/complete');
      await fetchTasks(employeeId);
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
}
