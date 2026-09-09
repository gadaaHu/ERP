import 'package:flutter/material.dart';
import 'package:erp_flutter/features/purchase/models/purchase_order.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class PurchaseProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<PurchaseOrder> _orders = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  PurchaseProvider() {
    Future.microtask(() {
      fetchOrders();
      fetchStats();
    });
  }

  List<PurchaseOrder> get orders => _orders;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchOrders() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/purchase');
      final List<dynamic> data = response.data;
      _orders = data.map((e) => PurchaseOrder.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/purchase/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load purchase stats: $e');
    }
  }
}
