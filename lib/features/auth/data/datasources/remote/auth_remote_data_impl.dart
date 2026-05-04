import 'package:dio/dio.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/auth/data/datasources/remote/auth_remote_data.dart';
import 'package:kianja/features/auth/data/models/input/signin/signin_input_model.dart';
import 'package:kianja/features/auth/data/models/input/signup/signup_input_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<String> signIn({required SignInInputModel signInInputModel}) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/auth/login',
        data: signInInputModel.toJson(),
      );
      final result = jsonHandler(response.data);
      AppDebug.showPrint('Token: ${result['token']}');
      return result['token'];
    });
  }

  @override
  Future<String> signUp({required SignUpInputModel signUpInputModel}) async {
    return requestHandler(() async {
      final response = await dio.post(
        '/api/auth/register',
        data: signUpInputModel.toJson(),
      );
      final result = jsonHandler(response.data);
      AppDebug.showPrint('Token: ${result['token']}');
      return result['token'];
    });
  }
}
