import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glowapp/repositories/auth_repository.dart';
import 'package:glowapp/services/secure_storage_service.dart';
import 'package:glowapp/core/dependency_injection.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository = getIt<AuthRepository>();

  final SecureStorageService storage = getIt<SecureStorageService>();

  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_login);

    on<RegisterEvent>(_register);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await repository.login(
        email: event.email,
        password: event.password,
      );

      await storage.saveToken(user.token);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await repository.register(
        nom: event.nom,
        email: event.email,
        password: event.password,
        role: event.role,
      );

      await storage.saveToken(user.token);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
