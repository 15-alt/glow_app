import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:glowapp/services/secure_storage_service.dart';
import 'package:glowapp/viewmodel/auth/auth_bloc.dart';
import '../repositories/auth_repository.dart';
import 'dio_client.dart';

final getIt = GetIt.instance;
void setupDependencies() {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3001',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"content-type": "application/json"},
    ),
  );
  getIt.registerLazySingleton<Dio>(() => DioClient.dio);
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepository(getIt<Dio>()),
  );
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(),
  );
  getIt.registerFactory<AuthBloc>(() => AuthBloc());
}
