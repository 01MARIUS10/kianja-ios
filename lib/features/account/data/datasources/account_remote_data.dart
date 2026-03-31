import 'package:dio/dio.dart';
import 'package:kianja/core/services/service_helper.dart';

abstract interface class AccountRemoteDataSource {
  Future<void> logout();
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
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
}
