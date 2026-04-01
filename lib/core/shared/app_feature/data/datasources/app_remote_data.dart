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
      final Map<String, dynamic> profil = result['profil'];
      final email = profil['email'];
      final phone = profil['phone'];
      final genre = profil['genre'];
      final pseudo = profil['pseudo'];
      final residence = profil['lieu_residence'];

      return UserModel.fromJson({
        'id': result['user_id'] ?? 0,
        'firstName': result['first_name'] ?? '',
        'lastName': result['last_name'] ?? '',
        'photoUrl': result['photo'] ?? '',
        'email': email,
        'phone': phone,
        'genre': genre,
        'pseudo': pseudo,
        'residence': residence,
      });
    });
  }
}
