import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Enregistrer le token
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(key: "token", value: token);
    } catch (e) {
      print("SECURE STORAGE ERROR: $e");
      rethrow;
    }
  }

  // Récupérer le token
  Future<String?> getToken() async {
    try {
      return await _storage.read(key: "token");
    } catch (e) {
      print("SECURE STORAGE ERROR: $e");
      rethrow;
    }
  }

  // Supprimer le token
  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: "token");
    } catch (e) {
      print("SECURE STORAGE ERROR: $e");
      rethrow;
    }
  }

  // Déconnexion
  Future<void> logout() async {
    try {
      await _storage.deleteAll();
    } catch (e) {
      print("SECURE STORAGE ERROR: $e");
      rethrow;
    }
  }
}
