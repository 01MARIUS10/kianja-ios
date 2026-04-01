import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/data/datasources/account_remote_data.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  const AccountRepositoryImpl({
    required this.remoteDataSource,
    required this.appSharedPrefs,
  });
  final AccountRemoteDataSource remoteDataSource;
  final AppSharedPrefs appSharedPrefs;

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await remoteDataSource.logout();
      await appSharedPrefs.remove(Constants.token);
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      return right(unit);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String photo,
    required String genre,
    required String pseudo,
    required String residence,
  }) async {
    try {
      final user = await remoteDataSource.updateUserInfo(
        firstName: firstName,
        lastName: lastName,
        email: email,
        photo: photo,
        genre: genre,
        pseudo: pseudo,
        residence: residence,
      );
      return right(user);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
