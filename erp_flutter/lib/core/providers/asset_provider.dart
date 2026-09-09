import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/asset.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class AssetProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Asset> _assets = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  AssetProvider() {
    fetchAssets();
    fetchStats();
  }

  List<Asset> get assets => _assets;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchAssets() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/assets');
      final List<dynamic> data = response.data;
      _assets = data.map((e) => Asset.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/assets/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load asset stats: $e');
    }
  }
}
