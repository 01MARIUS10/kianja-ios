import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';

class UpdateUserInfoUseCase implements UseCase<User, UpdateUserInfoParams> {
  const UpdateUserInfoUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, User>> call(UpdateUserInfoParams params) async {
    return await accountRepository.updateProfile(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      photo: params.photo,
      genre: params.genre,
      pseudo: params.pseudo,
      residence: params.residence,
    );
  }
}

class UpdateUserInfoParams {
  const UpdateUserInfoParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.genre,
    required this.pseudo,
    required this.residence,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String photo;
  final String genre;
  final String pseudo;
  final String residence;
}
