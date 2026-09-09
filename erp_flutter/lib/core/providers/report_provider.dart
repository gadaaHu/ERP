import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/report.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class ReportProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Report> _reports = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  ReportProvider() {
    fetchReports();
    fetchStats();
  }

  List<Report> get reports => _reports;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchReports() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/reports');
      final List<dynamic> data = response.data;
      _reports = data.map((e) => Report.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/reports/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load report stats: $e');
    }
  }
}
