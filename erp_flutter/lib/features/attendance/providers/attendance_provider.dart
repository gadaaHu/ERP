import 'package:flutter/material.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class AttendanceProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String? _error;
  List<dynamic> _attendances = [];
  Map<String, dynamic>? _todayAttendance;

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get attendances => _attendances;
  Map<String, dynamic>? get todayAttendance => _todayAttendance;

  Future<void> fetchEmployeeAttendance(int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.get('/attendance/employee/$employeeId');
      _attendances = response.data as List<dynamic>;

      // Check if there's an attendance for today
      final todayStr = DateTime.now().toIso8601String().substring(0, 10);
      try {
        _todayAttendance = _attendances.firstWhere(
            (a) => (a['date'] as String).substring(0, 10) == todayStr);
      } catch (_) {
        _todayAttendance = null;
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> clockIn(int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.post('/attendance/clock-in', data: {
        'employeeId': employeeId,
      });
      _todayAttendance = response.data;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> clockOut(int employeeId) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.post('/attendance/clock-out', data: {
        'employeeId': employeeId,
      });
      _todayAttendance = response.data;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
