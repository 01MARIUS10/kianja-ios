import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  String? getCachedToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this._prefs);
  final SharedPreferences _prefs;

  static const _tokenKey = 'cached_token';

  @override
  Future<void> cacheToken(String token) => _prefs.setString(_tokenKey, token);

  @override
  String? getCachedToken() => _prefs.getString(_tokenKey);

  @override
  Future<void> clearToken() => _prefs.remove(_tokenKey);
}
