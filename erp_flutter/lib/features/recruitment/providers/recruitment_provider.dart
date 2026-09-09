import 'package:flutter/material.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class RecruitmentProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  bool _isLoading = false;
  String? _error;
  List<dynamic> _jobOpenings = [];

  // Per-job applicants cache: jobId -> list of applicants
  final Map<int, List<dynamic>> _applicantsMap = {};
  Map<int, List<dynamic>> get applicantsMap => _applicantsMap;

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<dynamic> get jobOpenings => _jobOpenings;

  Future<void> fetchJobOpenings() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final response = await _apiService.client.get('/Recruitment/jobs');
      _jobOpenings = response.data as List<dynamic>;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchApplications(int jobId) async {
    try {
      final response = await _apiService.client.get('/Recruitment/jobs/$jobId/applications');
      _applicantsMap[jobId] = response.data as List<dynamic>;
      notifyListeners();
    } catch (e) {
      // Ignore per-job errors silently
    }
  }

  Future<void> createJobOpening(Map<String, dynamic> data) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.client.post('/Recruitment/jobs', data: data);
      await fetchJobOpenings();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> applyForJob(int jobId, Map<String, dynamic> data) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      await _apiService.client.post('/Recruitment/jobs/$jobId/apply', data: data);
      await fetchJobOpenings();
      await fetchApplications(jobId);
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Pass an applicant — they become an Employee.
  Future<String?> passApplicant(int applicationId, int jobId) async {
    try {
      final response = await _apiService.client.post('/Recruitment/applications/$applicationId/pass');
      // Refresh applicants for this job
      await fetchApplications(jobId);
      await fetchJobOpenings();
      return response.data['message'] as String?;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
