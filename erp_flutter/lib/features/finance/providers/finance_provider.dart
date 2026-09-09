import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/transaction.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class FinanceProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Transaction> _transactions = [];
  bool _isLoading = false;
  String _error = '';
  Map<String, dynamic> _stats = {};

  FinanceProvider() {
    fetchTransactions();
    fetchStats();
  }

  List<Transaction> get transactions => _transactions;
  bool get isLoading => _isLoading;
  String get error => _error;
  Map<String, dynamic> get stats => _stats;

  Future<void> fetchTransactions() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      final response = await _apiService.client.get('/finance');
      final List<dynamic> data = response.data;
      _transactions = data.map((e) => Transaction.fromJson(e)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchStats() async {
    try {
      final response = await _apiService.client.get('/finance/stats');
      _stats = response.data;
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to load finance stats: $e');
    }
  }
}
