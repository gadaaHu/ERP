import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/project.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class ProjectProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Project> _projects = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  ProjectProvider() {
    fetchProjects();
    fetchStats();
  }

  List<Project> get projects => _projects;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchProjects() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/projects');
      final List<dynamic> data = response.data;
      _projects = data.map((e) => Project.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/projects/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load project stats: $e');
    }
  }
}
