import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';
import 'package:kianja/features/auth/domain/usecases/signup/signup_params.dart';

class SignUpUseCase implements UseCase<String, SignUpParams> {
  const SignUpUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String>> call(SignUpParams params) async {
    return authRepository.signUp(signUpParams: params);
  }
}
