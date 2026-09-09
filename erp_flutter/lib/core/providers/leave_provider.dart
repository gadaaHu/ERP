import 'package:flutter/material.dart';
import 'package:erp_flutter/core/models/leave.dart';
import 'package:erp_flutter/core/services/api_service.dart';

class LeaveProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<LeaveRequest> _pendingLeaves = [];
  bool _isLoading = false;
  String? _error;

  List<LeaveRequest> get pendingLeaves => _pendingLeaves;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPendingLeaves() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await _apiService.getPendingLeaves();
      _pendingLeaves = result.map((e) => LeaveRequest.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
