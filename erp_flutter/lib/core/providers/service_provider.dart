import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/service_request.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class ServiceProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<ServiceRequest> _requests = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  ServiceProvider() {
    fetchRequests();
    fetchStats();
  }

  List<ServiceRequest> get requests => _requests;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchRequests() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/services');
      final List<dynamic> data = response.data;
      _requests = data.map((e) => ServiceRequest.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/services/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load service stats: $e');
    }
  }
}
