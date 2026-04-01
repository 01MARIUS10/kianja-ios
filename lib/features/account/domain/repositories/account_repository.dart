import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';

abstract interface class AccountRepository {
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
  Future<Either<Failure, User>> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
    required String photo,
    required String genre,
    required String pseudo,
    required String residence,
  });
}
