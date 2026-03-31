import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';

abstract interface class AccountRepository {
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> changePassword({
    required String oldPassword,
    required String newPassword,
  });
}
