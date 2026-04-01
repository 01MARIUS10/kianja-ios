import 'package:dio/dio.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/core/utils/app_debug.dart';

abstract interface class AccountRemoteDataSource {
  Future<void> logout();
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<UserModel> updateUserInfo({
    required String firstName,
    required String lastName,
    required String email,
    required String photo,
    required String genre,
    required String pseudo,
    required String residence,
  });
}

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  const AccountRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> logout() async {
    return requestHandler(() async {
      await dio.post('/api/auth/logout');
    });
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return requestHandler(() async {
      await dio.post(
        '/api/auth/change-password',
        data: {'old_password': oldPassword, 'new_password': newPassword},
      );
    });
  }

  @override
  Future<UserModel> updateUserInfo({
    required String firstName,
    required String lastName,
    required String email,
    required String photo,
    required String genre,
    required String pseudo,
    required String residence,
  }) async {
    return requestHandler(() async {
      final response = await dio.put(
        '/api/profil',
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'photo': photo,
          'genre': genre,
          'pseudo': pseudo,
          'email': email,
          'lieu_residence': residence,
        },
      );

      final result = jsonHandler(response.data);
      AppDebug.showPrint('User data $result');
      final Map<String, dynamic> profil = result['profil'];
      // final profilEmail = profil['email'];
      final profilPhone = profil['phone'];
      // final profilGenre = profil['genre'];
      // final profilPseudo = profil['pseudo'];
      // final profilResidence = profil['lieu_residence'];

      return UserModel.fromJson({
        'id': result['user_id'] ?? 0,
        'firstName': result['first_name'] ?? '',
        'lastName': result['last_name'] ?? '',
        'photoUrl': result['photo'] ?? '',
        'email': email,
        'phone': profilPhone,
        'genre': genre,
        'pseudo': pseudo,
        'residence': residence,
      });
    });
  }
}
