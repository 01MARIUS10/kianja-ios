import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';

abstract class AppRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> getCachedUser();
  Future<Either<Failure, Unit>> deleteCachedUser();
}
