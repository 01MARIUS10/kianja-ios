import 'package:dio/dio.dart';
import 'package:kianja/core/services/api/api_endpoint.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/account/data/datasources/remote/account_remote_data.dart';
import 'package:kianja/features/account/data/models/input/change_password/change_password_input_model.dart';
import 'package:kianja/features/account/data/models/input/update_user_info/update_user_info_input_model.dart';
import 'package:kianja/features/account/data/models/output/kara_history/kara_history_model.dart';

class AccountRemoteDataSourceImpl implements AccountRemoteDataSource {
  const AccountRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<void> logout() async {
    return requestHandler(() async {
      await dio.post(ApiEndpoint.logout.path);
    });
  }

  @override
  Future<void> changePassword({
    required ChangePasswordInputModel changePasswordInputModel,
  }) async {
    return requestHandler(() async {
      await dio.post(
        ApiEndpoint.changePassword.path,
        data: changePasswordInputModel.toJson(),
      );
    });
  }

  @override
  Future<UserModel> updateUserInfo({
    required UpdateUserInfoInputModel updateUserInfoInputModel,
  }) async {
    AppDebug.showPrint('User data ${updateUserInfoInputModel.toJson()}');

    return requestHandler(() async {
      final response = await dio.put(
        ApiEndpoint.profile.path,
        data: updateUserInfoInputModel.toJson(),
      );
      final result = jsonHandler(response.data);
      AppDebug.showPrint('User data $result');
      return UserModel.fromJson(result);
    });
  }

  @override
  Future<String> cgu() async {
    return requestHandler(() async {
      final response = await dio.get(ApiEndpoint.cgu.path);
      return response.data;
    });
  }

  @override
  Future<List<KaraHistoryModel>> getAllKaraHistory({required int page}) async {
    return requestHandler(() async {
      final response = await dio.get(
        '${ApiEndpoint.karaHistory.path}?page=$page&nbPerPage=15',
      );
      final Map<String, dynamic> result = jsonHandler(response.data);
      final Map<String, dynamic> historiques = result['historiques'];
      final List<dynamic> historyList = historiques['data'];
      return historyList
          .map((e) => KaraHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Future<int> getKaraCount() async {
    return requestHandler(() async {
      final response = await dio.get(ApiEndpoint.karaHistory.path);
      final Map<String, dynamic> result = jsonHandler(response.data);
      AppDebug.showPrint('Solde : ${result['solde']}');
      return result['solde'] ?? 0;
    });
  }
}
