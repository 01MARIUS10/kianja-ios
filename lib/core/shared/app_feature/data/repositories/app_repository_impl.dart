import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_remote_data.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_user_hive.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/app_feature/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  const AppRepositoryImpl({
    required this.remoteDataSource,
    required this.appUserHive,
  });
  final AppRemoteDataSource remoteDataSource;
  final AppUserHive appUserHive;

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      await appUserHive.saveUser(user);
      return right(user);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, User>> getCachedUser() async {
    try {
      final user = appUserHive.getUser();
      return right(user ?? const User.empty());
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCachedUser() async {
    try {
      await appUserHive.deleteUser();
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
