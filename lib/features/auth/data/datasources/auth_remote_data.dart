import 'package:dio/dio.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/app_debug.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signIn(String phone, String password, bool stayLogged);
  Future<String> signUp(
    String firstName,
    String lastName,
    String genre,
    String phone,
    int birthDate,
    String residence,
    String email,
    String password,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<String> signIn(String phone, String password, bool stayLogged) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/auth/login',
        data: {
          'email': phone,
          'password': password,
          'a_vis': stayLogged ? 1 : 0,
        },
      );
      final result = jsonHandler(response.data);
      AppDebug.showPrint('Token: ${result['token']}');
      return result['token'];
    });
  }

  @override
  Future<String> signUp(
    String firstName,
    String lastName,
    String genre,
    String phone,
    int birthDate,
    String residence,
    String email,
    String password,
  ) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/auth/register',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'genre': genre,
          'phone': phone,
          'annee_naissance': birthDate,
          'lieu_residence': residence,
          'email': email,
          'password': password,
        },
      );
      final result = jsonHandler(response.data);
      AppDebug.showPrint('Token: ${result['token']}');
      return result['token'];
    });
  }
}
