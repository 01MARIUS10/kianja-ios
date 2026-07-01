import 'package:kianja/features/about/data/models/app_version_model.dart';

abstract interface class AboutRemoteDataSource {
  Future<AppVersionModel> getUpdate();
  Future<List<AppVersionModel>> getAllVersions();
}
