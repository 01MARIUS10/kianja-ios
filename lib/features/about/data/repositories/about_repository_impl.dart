import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/features/about/data/datasources/remote/about_remote_data.dart';
import 'package:kianja/features/about/domain/entities/app_version.dart';
import 'package:kianja/features/about/domain/repositories/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  const AboutRepositoryImpl({
    required this.remoteDataSource,
  });
  
  final AboutRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, AppVersion>> getUpdateVersion() async {
    try {
      final appVersionModel = await remoteDataSource.getUpdate();
      return right(appVersionModel);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, List<AppVersion>>> getAllVersions() async {
    try {
      final appVersionModels = await remoteDataSource.getAllVersions();
      return right(appVersionModels);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
