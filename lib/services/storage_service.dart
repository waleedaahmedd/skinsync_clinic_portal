import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';

import '../utils/Colored_print.dart';
import '../utils/enums.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  static const _tokenKey = SharedPreferencesKeys.accessTokenKey;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  final _authStateController = StreamController<bool>.broadcast();

  String? _token;

  /// Call once at app start
  Future<void> init() async {
    _token = await _storage.read(key: _tokenKey.name);
    ColoredPrint.green("Auth Token: $_token");
    _authStateController.add(isLoggedIn);
  }

  String? get token => _token;
  bool get isLoggedIn => _token != null;

  Stream<bool> get authStateChanges => _authStateController.stream;

  Future<void> saveToken(String token) async {
    _token = token;
    await _storage.write(key: _tokenKey.name, value: token);
    ColoredPrint.green("Token Saved");
    _authStateController.add(true);
  }

  Future<void> clearToken() async {
    _token = null;
    await _storage.delete(key: _tokenKey.name);
    ColoredPrint.red("Token Cleared");
    _authStateController.add(false);
  }

  void dispose() {
    ColoredPrint.red("Dispose: SecureStorageService");
    _authStateController.close();
  }
}
