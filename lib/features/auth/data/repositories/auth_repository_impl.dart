import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/exceptions.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/services/service_helper.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/auth/data/datasources/remote/auth_remote_data.dart';
import 'package:kianja/features/auth/data/models/input/signin/signin_input_model.dart';
import 'package:kianja/features/auth/data/models/input/signup/signup_input_model.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';
import 'package:kianja/features/auth/domain/usecases/sigin/signin_params.dart';
import 'package:kianja/features/auth/domain/usecases/signup/signup_params.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.appSharedPrefs,
  });
  final AuthRemoteDataSource remoteDataSource;
  final AppSharedPrefs appSharedPrefs;

  @override
  Future<Either<Failure, String>> signIn({
    required SignInParams signInParams,
  }) async {
    try {
      final token = await remoteDataSource.signIn(
        signInInputModel: SignInInputModel(
          email: signInParams.phone,
          password: signInParams.password,
          aVis: signInParams.stayLogged ? 1 : 0,
        ),
      );
      await appSharedPrefs.save(Constants.token, token);
      return right(token);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }

  @override
  Future<Either<Failure, String>> signUp({
    required SignUpParams signUpParams,
  }) async {
    try {
      final token = await remoteDataSource.signUp(
        signUpInputModel: SignUpInputModel(
          firstName: signUpParams.firstName,
          lastName: signUpParams.lastName,
          genre: signUpParams.genre,
          phone: signUpParams.phone,
          birthDate: signUpParams.birthDate,
          residence: signUpParams.residence,
          email: signUpParams.email,
          password: signUpParams.password,
        ),
      );
      await appSharedPrefs.save(Constants.token, token);
      return right(token);
    } on AppException catch (e) {
      return left(failureHandler(e));
    }
  }
}
