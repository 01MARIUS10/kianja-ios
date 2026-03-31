import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/auth/data/datasources/auth_remote_data.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.appSharedPrefs,
  });
  final AuthRemoteDataSource remoteDataSource;
  final AppSharedPrefs appSharedPrefs;

  @override
  Future<Either<Failure, String>> signIn(
    String phone,
    String password,
    bool stayLogged,
  ) async {
    try {
      final token = await remoteDataSource.signIn(phone, password, stayLogged);
      await appSharedPrefs.save(Constants.token, token);
      return right(token);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, String>> signUp(
    String firstName,
    String lastName,
    String genre,
    String phone,
    int birthDate,
    String residence,
    String email,
    String password,
  ) async {
    try {
      final token = await remoteDataSource.signUp(
        firstName,
        lastName,
        genre,
        phone,
        birthDate,
        residence,
        email,
        password,
      );
      await appSharedPrefs.save(Constants.token, token);
      return right(token);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
