import 'package:dio/dio.dart';
import 'package:kianja/core/services/api/api_endpoint.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/features/about/data/datasources/remote/about_remote_data.dart';
import 'package:kianja/features/about/data/models/app_version_model.dart';

class AboutRemoteDataSourceImpl implements AboutRemoteDataSource {
  const AboutRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<AppVersionModel> getUpdate() async {
    return requestHandler(() async {
      final response = await dio.get(ApiEndpoint.getUpdate.path);
      final result = jsonHandler(response.data);
      final version = result['version'] as Map<String, dynamic>;
      return AppVersionModel.fromJson(version);
    });
  }

  @override
  Future<List<AppVersionModel>> getAllVersions() async {
    return requestHandler(() async {
      final response = await dio.get(ApiEndpoint.appVersions.path);
      final result = jsonHandler(response.data);
      final versions = result['versions'] as List<dynamic>;
      return versions
          .map((e) => AppVersionModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }
}
