import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase implements UseCase<String, SignInParams> {
  const SignInUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String>> call(SignInParams params) async {
    return authRepository.signIn(
      params.phone,
      params.password,
      params.stayLogged,
    );
  }
}

class SignInParams {
  const SignInParams({
    required this.phone,
    required this.password,
    required this.stayLogged,
  });
  final String phone;
  final String password;
  final bool stayLogged;
}
