import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hr_app/core/models/employee.dart';
import 'package:hr_app/core/models/leave.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:5073/api';
  
  final Dio _dio = Dio();
  
  ApiService() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString('auth_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
          // Handle unauthorized - maybe logout
        }
        return handler.next(error);
      },
    ));
  }

  // ==================== AUTH ====================
  Future<String> login(String username, String password) async {
    final response = await _dio.post('/Auth/login', data: {
      'username': username,
      'password': password,
    });
    return response.data['token'];
  }

  // ==================== EMPLOYEES ====================
  Future<List<Employee>> getEmployees({int page = 1, int pageSize = 20}) async {
    final response = await _dio.get('/Employees');
    final data = response.data as List;
    return data.map((e) => Employee.fromJson(e)).toList();
  }

  Future<Employee> getEmployee(String id) async {
    final response = await _dio.get('/Employees/$id');
    return Employee.fromJson(response.data);
  }

  Future<Employee> createEmployee(Map<String, dynamic> data) async {
    final response = await _dio.post('/Employees', data: data);
    return Employee.fromJson(response.data);
  }

  Future<Employee> updateEmployee(String id, Map<String, dynamic> data) async {
    final response = await _dio.put('/Employees/$id', data: data);
    return Employee.fromJson(response.data);
  }

  Future<void> terminateEmployee(String id, DateTime terminationDate, String reason) async {
    await _dio.post('/Employees/$id/terminate', data: {
      'terminationDate': terminationDate.toIso8601String(),
      'reason': reason,
    });
  }

  // ==================== LEAVES ====================
  Future<List<LeaveRequest>> getEmployeeLeaves(String employeeId, {int? year}) async {
    final response = await _dio.get('/Leaves/employee/$employeeId', queryParameters: {
      if (year != null) 'year': year,
    });
    final data = response.data as List;
    return data.map((e) => LeaveRequest.fromJson(e)).toList();
  }

  Future<LeaveRequest> createLeaveRequest(Map<String, dynamic> data) async {
    final response = await _dio.post('/Leaves', data: data);
    return LeaveRequest.fromJson(response.data);
  }

  Future<LeaveRequest> approveLeave(String id, String approverId) async {
    final response = await _dio.put('/Leaves/$id/approve', data: {
      'approverId': approverId,
    });
    return LeaveRequest.fromJson(response.data);
  }

  Future<LeaveRequest> rejectLeave(String id, String approverId, String reason) async {
    final response = await _dio.put('/Leaves/$id/reject', data: {
      'approverId': approverId,
      'reason': reason,
    });
    return LeaveRequest.fromJson(response.data);
  }

  Future<List<LeaveRequest>> getPendingLeaves() async {
    final response = await _dio.get('/Leaves/pending');
    final data = response.data as List;
    return data.map((e) => LeaveRequest.fromJson(e)).toList();
  }

  // ==================== ATTENDANCE ====================
  Future<void> clockIn(String employeeId) async {
    await _dio.post('/Attendance/clock-in', data: {
      'employeeId': employeeId,
    });
  }

  Future<void> clockOut(String employeeId) async {
    await _dio.post('/Attendance/clock-out', data: {
      'employeeId': employeeId,
    });
  }
}
