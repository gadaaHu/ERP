import 'package:flutter/material.dart';
import 'package:hr_app/core/services/api_service.dart';
import 'package:hr_app/core/services/storage_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  final StorageService _storage = StorageService();
  
  bool _isLoading = false;
  bool _isAuthenticated = false;
  String? _token;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    _token = await _storage.getToken();
    _isAuthenticated = _token != null;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _token = await _apiService.login(username, password);
      await _storage.saveToken(_token!);
      _isAuthenticated = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    await _storage.deleteToken();
    _token = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}
