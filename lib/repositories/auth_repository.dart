import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthRepository {
  final Dio dio;

  AuthRepository(this.dio);

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        "/auth/login",
        data: {"email": email, "password": password},
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      print("DIO ERROR: $e");
      rethrow;
    }
  }

  Future<UserModel> register({
    required String nom,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final response = await dio.post(
        "/auth/register",
        data: {"nom": nom, "email": email, "password": password, "role": role},
      );

      return UserModel.fromJson(response.data);
    } catch (e) {
      print("e.response?.statusCode");
      print("e.response?.data");
      rethrow;
    }
  }
}
