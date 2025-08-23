import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/constants/cache_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

@module
abstract class RegisterModule {
  /// Pre-resolve SharedPreferences once; reuse everywhere.
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  Dio dio(SharedPreferences prefs) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 20),
        headers: const {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      // Keep this in dev only if you prefer:
      LogInterceptor(requestBody: true, responseBody: true),

      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = prefs.getString(CacheConstants.tokenKey);
          if (token != null && token.isNotEmpty) {
            // EITHER use standard bearer:
            // options.headers['Authorization'] = 'Bearer $token';

            // OR if your backend uses a custom header key:
            options.headers[CacheConstants.apiHeaderTokenKey] = token;
          }
          return handler.next(options);
        },
        onResponse: (response, handler) => handler.next(response),
        onError: (error, handler) => handler.next(error),
      ),
    ]);

    return dio;
  }
}
