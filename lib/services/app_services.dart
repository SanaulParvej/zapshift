import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/app_config.dart';

class LocalStorageService {
  late final SharedPreferences _preferences;

  Future<LocalStorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _preferences.getBool(key) ?? defaultValue;
  }

  String? getString(String key) => _preferences.getString(key);

  Future<bool> setBool(String key, bool value) =>
      _preferences.setBool(key, value);

  Future<bool> setString(String key, String value) =>
      _preferences.setString(key, value);

  Future<bool> remove(String key) => _preferences.remove(key);
}

class ApiService {
  ApiService({String? baseUrl})
    : _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl ?? AppConfig.apiBaseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
          sendTimeout: const Duration(seconds: 20),
          headers: const <String, dynamic>{
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      ) {
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
      ),
    );
  }

  final Dio _dio;

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 900));
      return <String, dynamic>{
        'token': 'demo-token',
        'user': {'name': 'Ayesha Rahman', 'email': email},
      };
    }

    final response = await _dio.post(
      '/auth/login',
      data: <String, dynamic>{'email': email, 'password': password},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
  }) async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 900));
      return <String, dynamic>{
        'token': 'demo-token',
        'user': {'name': name, 'email': email},
      };
    }

    final response = await _dio.post(
      '/auth/register',
      data: <String, dynamic>{'name': name, 'email': email},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> forgotPassword({required String email}) async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
      return <String, dynamic>{'message': 'OTP sent to $email'};
    }

    final response = await _dio.post(
      '/auth/forgot-password',
      data: <String, dynamic>{'email': email},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 700));
      return <String, dynamic>{'verified': true, 'email': email, 'otp': otp};
    }

    final response = await _dio.post(
      '/auth/verify-otp',
      data: <String, dynamic>{'email': email, 'otp': otp},
    );
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> searchTracking(String trackingNumber) async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 850));
      return <String, dynamic>{
        'trackingNumber': trackingNumber,
        'status': 'Out for delivery',
      };
    }

    final response = await _dio.get('/parcels/$trackingNumber');
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<Map<String, dynamic>> createParcel(
    Map<String, dynamic> payload,
  ) async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 1000));
      return <String, dynamic>{
        'success': true,
        'trackingNumber': 'ZP-2406-NEW',
      };
    }

    final response = await _dio.post('/parcels', data: payload);
    return Map<String, dynamic>.from(response.data as Map);
  }

  Future<List<dynamic>> loadNotifications() async {
    if (AppConfig.useMockApi) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      return <dynamic>[];
    }

    final response = await _dio.get('/notifications');
    return List<dynamic>.from(response.data as List);
  }
}
