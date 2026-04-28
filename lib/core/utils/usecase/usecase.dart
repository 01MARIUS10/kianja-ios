import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
