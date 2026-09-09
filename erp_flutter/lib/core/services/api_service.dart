
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:erp_flutter/core/services/storage_service.dart';
import '../models/api_response.dart';
import '../models/leave_request.dart';
import '../models/leave_balance.dart';
import '../models/leave_statistics.dart';
import '../models/create_leave_request_dto.dart';
import '../models/employee.dart';
import '../models/attendance.dart';
import '../models/attendance_dto.dart';

class ApiService {
  late Dio _dio;
  final StorageService _storage = StorageService();
  
  Dio get client => _dio;
  
  static const String baseUrl = 'http://localhost:5073/api';
  
  ApiService() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));
    
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _storage.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            // Handle token refresh
            await _refreshToken();
            final token = await _storage.getToken();
            if (token != null) {
              e.requestOptions.headers['Authorization'] = 'Bearer $token';
              final response = await _dio.fetch(e.requestOptions);
              return handler.resolve(response);
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'username': email,
          'password': password,
        },
      );
      
      final data = response.data as Map<String, dynamic>;
      final token = data['token'] as String;
      await _storage.saveToken(token);
      return token;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> logout() async {
    await _storage.deleteToken();
  }

  Future<List<LeaveRequest>> getLeaveRequests({
    int? page,
    int? limit,
    String? status,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      final queryParams = <String, dynamic>{}
        ..['page'] = page
        ..['limit'] = limit
        ..['status'] = status
        ..['startDate'] = startDate?.toIso8601String()
        ..['endDate'] = endDate?.toIso8601String();
      
      final response = await _dio.get(
        '/leave/requests',
        queryParameters: queryParams,
      );
      
      final apiResponse = ApiResponse<List<LeaveRequest>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => (json as List).map((e) => LeaveRequest.fromJson(e as Map<String, dynamic>)).toList(),
      );
      
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      
      return apiResponse.data ?? <LeaveRequest>[];
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<LeaveRequest> createLeaveRequest(CreateLeaveRequestDto request) async {
    try {
      final response = await _dio.post(
        '/leave/requests',
        data: request.toJson(),
      );
      
      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json as Map<String, dynamic>,
      );
      
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      
      return LeaveRequest.fromJson(apiResponse.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<LeaveRequest> approveLeaveRequest(
    String id, 
    bool isApproved, 
    String? reason,
  ) async {
    try {
      final response = await _dio.put(
        '/leave/requests/$id/approve',
        data: {
          'isApproved': isApproved,
          'rejectionReason': reason,
        },
      );
      
      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json as Map<String, dynamic>,
      );
      
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      
      return LeaveRequest.fromJson(apiResponse.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> cancelLeaveRequest(String id) async {
    try {
      final response = await _dio.delete('/leave/requests/$id');
      
      final apiResponse = ApiResponse<dynamic>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json,
      );
      
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<LeaveBalance>> getLeaveBalances() async {
    try {
      final response = await _dio.get('/leave/balances');
      
      final apiResponse = ApiResponse<List<LeaveBalance>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => (json as List).map((e) => LeaveBalance.fromJson(e as Map<String, dynamic>)).toList(),
      );
      
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      
      return apiResponse.data ?? <LeaveBalance>[];
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<LeaveStatistics> getLeaveStatistics(int year) async {
    try {
      final response = await _dio.get(
        '/leave/statistics',
        queryParameters: {'year': year},
      );
      
      final apiResponse = ApiResponse<Map<String, dynamic>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json as Map<String, dynamic>,
      );
      
      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }
      
      return LeaveStatistics.fromJson(apiResponse.data!);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> _refreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final refreshToken = prefs.getString('refresh_token');
      if (refreshToken == null) throw Exception('No refresh token');
      
      final response = await _dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      
      final newToken = response.data['token'] as String;
      await _storage.saveToken(newToken);
    } catch (e) {
      throw Exception('Session expired. Please login again.');
    }
  }

  Exception _handleError(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return Exception('Connection timeout. Please check your internet.');
        case DioExceptionType.badResponse:
          final message = _extractErrorMessage(error.response?.data);
          return Exception(message ?? 'Server error occurred.');
        case DioExceptionType.cancel:
          return Exception('Request cancelled.');
        default:
          return Exception('An unexpected error occurred.');
      }
    }
    return Exception('An unexpected error occurred.');
  }

  String? _extractErrorMessage(dynamic data) {
    if (data == null) return null;
    if (data is Map<String, dynamic>) {
      return data['message'] ?? data['error'] ?? data['title'];
    }
    if (data is String) return data;
    return null;
  }

  // Legacy endpoints to satisfy older providers
  Future<List<Employee>> getEmployees({int? page}) async {
    try {
      final response = await _dio.get('/employees', queryParameters: {'page': page});
      if (response.data != null) {
        if (response.data is List) {
          return (response.data as List).map((e) => Employee.fromJson(e)).toList();
        } else if (response.data['data'] != null) {
          return (response.data['data'] as List).map((e) => Employee.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<Employee> createEmployee(Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('/employees', data: data);
      return Employee.fromJson(response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<dynamic>> getPendingLeaves() async {
    try {
      final response = await _dio.get('/leave/pending');
      return response.data as List;
    } catch (e) {
      return [];
    }
  }

  // ─── Attendance endpoints ─────────────────────────────────────────────

  Future<AttendanceDto> clockIn({
    String? location,
    double? latitude,
    double? longitude,
    String? deviceInfo,
    String? notes,
  }) async {
    try {
      final response = await _dio.post('/attendance/clock-in', data: {
        if (location != null) 'location': location,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (deviceInfo != null) 'deviceInfo': deviceInfo,
        if (notes != null) 'notes': notes,
      });
      return AttendanceDto.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<AttendanceDto> clockOut(
    String attendanceId, {
    String? location,
    double? latitude,
    double? longitude,
    String? notes,
  }) async {
    try {
      final response = await _dio.post('/attendance/clock-out', data: {
        'attendanceId': attendanceId,
        if (location != null) 'location': location,
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (notes != null) 'notes': notes,
      });
      return AttendanceDto.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<AttendanceDto>> getUserAttendance({
    DateTime? fromDate,
    DateTime? toDate,
  }) async {
    try {
      final response = await _dio.get('/attendance/my-attendance', queryParameters: {
        if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
        if (toDate != null) 'toDate': toDate.toIso8601String(),
      });
      final data = response.data['data'] as List? ?? [];
      return data.map((e) => AttendanceDto.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<AttendanceSummary> getTodayAttendance() async {
    try {
      final response = await _dio.get('/attendance/today');
      return AttendanceSummary.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<AttendanceStatistics> getAttendanceStatistics(int year, {int? month}) async {
    try {
      final response = await _dio.get('/attendance/statistics', queryParameters: {
        'year': year,
        if (month != null) 'month': month,
      });
      return AttendanceStatistics.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> requestAttendanceCorrection(
    String attendanceId, {
    DateTime? newClockIn,
    DateTime? newClockOut,
    AttendanceStatus? newStatus,
    required String reason,
  }) async {
    try {
      await _dio.post('/attendance/correction', data: {
        'attendanceId': attendanceId,
        if (newClockIn != null) 'newClockInTime': newClockIn.toIso8601String(),
        if (newClockOut != null) 'newClockOutTime': newClockOut.toIso8601String(),
        if (newStatus != null) 'newStatus': newStatus.name,
        'reason': reason,
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<List<Holiday>> getHolidays(int year, {String? region}) async {
    try {
      final response = await _dio.get('/attendance/holidays', queryParameters: {
        'year': year,
        if (region != null) 'region': region,
      });
      final data = response.data['data'] as List? ?? [];
      return data.map((e) => Holiday.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<double> getOvertime(DateTime fromDate, DateTime toDate) async {
    try {
      final response = await _dio.get('/attendance/overtime', queryParameters: {
        'fromDate': fromDate.toIso8601String(),
        'toDate': toDate.toIso8601String(),
      });
      return (response.data['data'] as num).toDouble();
    } catch (e) {
      return 0.0;
    }
  }

  Future<List<AttendanceDto>> getTeamAttendance({
    DateTime? fromDate,
    DateTime? toDate,
    String? employeeId,
  }) async {
    try {
      final response = await _dio.get('/attendance/team-attendance', queryParameters: {
        if (fromDate != null) 'fromDate': fromDate.toIso8601String(),
        if (toDate != null) 'toDate': toDate.toIso8601String(),
        if (employeeId != null) 'employeeId': employeeId,
      });
      final data = response.data['data'] as List? ?? [];
      return data.map((e) => AttendanceDto.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<void> processAttendanceRequest(
    String requestId,
    bool approve, {
    String? reason,
  }) async {
    try {
      await _dio.put('/attendance/requests/$requestId', data: {
        'approve': approve,
        if (reason != null) 'reason': reason,
      });
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Clock in using face recognition — sends image as multipart/form-data
  Future<AttendanceDto> clockInWithFace({
    required String imagePath,
    String? location,
    double? latitude,
    double? longitude,
  }) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imagePath, filename: 'face.jpg'),
        if (location != null) 'location': location,
        if (latitude != null) 'latitude': latitude.toString(),
        if (longitude != null) 'longitude': longitude.toString(),
      });

      final response = await _dio.post(
        '/attendance/clock-in/face',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return AttendanceDto.fromJson(response.data['data'] as Map<String, dynamic>);
    } catch (e) {
      throw _handleError(e);
    }
  }

  /// Upload employee profile photo and trigger face enrollment
  Future<String> uploadEmployeePhoto(int employeeId, String imagePath) async {
    try {
      final formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(imagePath, filename: 'photo.jpg'),
      });

      final response = await _dio.post(
        '/employees/$employeeId/photo',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return response.data['photoUrl'] as String? ?? '';
    } catch (e) {
      throw _handleError(e);
    }
  }
}


