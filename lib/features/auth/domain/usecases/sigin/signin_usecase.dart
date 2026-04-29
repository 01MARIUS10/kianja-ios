import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';
import 'package:kianja/features/auth/domain/usecases/sigin/signin_params.dart';

class SignInUseCase implements UseCase<String, SignInParams> {
  const SignInUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String>> call(SignInParams params) async {
    return authRepository.signIn(signInParams: params);
  }
}
