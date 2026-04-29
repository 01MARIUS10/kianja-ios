import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/features/auth/domain/usecases/sigin/signin_params.dart';
import 'package:kianja/features/auth/domain/usecases/signup/signup_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signIn({required SignInParams signInParams});
  Future<Either<Failure, String>> signUp({required SignUpParams signUpParams});
}
