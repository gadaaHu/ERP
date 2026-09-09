import 'package:flutter/material.dart';
import 'package:hr_app/core/services/api_service.dart';
import 'package:hr_app/core/models/leave.dart';

class LeaveProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  bool _isLoading = false;
  String? _error;
  List<LeaveRequest> _pendingLeaves = [];

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<LeaveRequest> get pendingLeaves => _pendingLeaves;

  Future<void> loadPendingLeaves() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pendingLeaves = await _apiService.getPendingLeaves();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
