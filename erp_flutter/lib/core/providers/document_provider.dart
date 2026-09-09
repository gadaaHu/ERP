import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/document.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class DocumentProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Document> _documents = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  DocumentProvider() {
    fetchDocuments();
    fetchStats();
  }

  List<Document> get documents => _documents;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchDocuments() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/documents');
      final List<dynamic> data = response.data;
      _documents = data.map((e) => Document.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/documents/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load document stats: $e');
    }
  }
}
