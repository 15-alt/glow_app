import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../services/secure_storage_service.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost:3001",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  static Future<void> initialize() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorageService().getToken();

          if (token != null) {
            options.headers["Authorization"] = "Bearer $token";
          }

          handler.next(options);
        },

        onError: (e, handler) {
          debugPrint("DIO ERROR : ${e.message}");
          handler.next(e);
        },
      ),
    );
  }
}
