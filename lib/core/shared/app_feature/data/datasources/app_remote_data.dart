import 'package:dio/dio.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/core/utils/app_debug.dart';

abstract interface class AppRemoteDataSource {
  Future<UserModel> getUser();
}

class AppRemoteDataSourceImpl implements AppRemoteDataSource {
  const AppRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<UserModel> getUser() async {
    return requestHandler(() async {
      final response = await dio.get('/api/profil');
      final result = jsonHandler(response.data);
      AppDebug.showPrint('User data $result');
      return UserModel.fromJson(result);
    });
  }
}
