import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/features/about/domain/entities/app_version.dart';

abstract interface class AboutRepository {
  Future<Either<Failure, AppVersion>> getUpdateVersion();
  Future<Either<Failure, List<AppVersion>>> getAllVersions();
}
