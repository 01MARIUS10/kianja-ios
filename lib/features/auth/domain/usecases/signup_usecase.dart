import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase implements UseCase<String, SignUpParams> {
  const SignUpUseCase({required this.authRepository});
  final AuthRepository authRepository;

  @override
  Future<Either<Failure, String>> call(SignUpParams params) async {
    return authRepository.signUp(
      params.firstName,
      params.lastName,
      params.genre,
      params.phone,
      params.birthDate,
      params.residence,
      params.email,
      params.password,
    );
  }
}

class SignUpParams {
  const SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.genre,
    required this.phone,
    required this.birthDate,
    required this.residence,
    required this.email,
    required this.password,
  });
  final String firstName;
  final String lastName;
  final String genre;
  final String phone;
  final int birthDate;
  final String residence;
  final String email;
  final String password;
}
