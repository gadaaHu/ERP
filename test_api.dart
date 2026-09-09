import 'dart:convert';
import 'package:dio/dio.dart';

void main() async {
  try {
    final dio = Dio();
    dio.options.baseUrl = 'http://localhost:5073/api';
    
    final response = await dio.get('/Employees');
    print('Response status: \${response.statusCode}');
    
    final data = response.data as List;
    print('Data length: \${data.length}');
    
    if (data.isNotEmpty) {
      print('First item keys: \${(data.first as Map).keys.toList()}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
