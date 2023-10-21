import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';
import 'dio.dart';

class Data with ChangeNotifier {
  static Dio _dio = Dio();
  bool _isLoggedIn = false;
  late User _user = User(name: '', email: '', avatar: '');
  late String _token = '';

  bool get authenticated => _isLoggedIn;
  User get user => _user;

  final storage = FlutterSecureStorage();

  Dio createDioInstance() {
    // Create and configure Dio instance
    Dio dio = Dio();
    // Add any necessary configurations to the Dio instance
    return dio;
  }


  Future<List<dynamic>> fetchPMData() async {
    try {
      // Create a Dio instance using createDioInstance() or use the existing one.


      // Fetch PM data using Dio
      final response = await dio().get('/pm'); // Replace with your API URL.

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data;
      } else {
        throw Exception('Failed to fetch PM data');
      }
    } catch (e) {
      throw Exception('Failed to fetch PM data: $e');
    }
  }



  Future<List<String>> fetchlocation() async {
    try {
      final response = await dio().get('/location');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<String> locations = data.map((item) => item.toString()).toList();
        return locations;
      } else {
        // Handle error here, e.g., throw an exception or return an empty list
        throw Exception('Failed to fetch locations');
      }
    } catch (error) {
      // Handle DioError or other exceptions
      throw Exception('Failed to fetch locations: $error');
    }
  }
  }