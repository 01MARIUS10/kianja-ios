import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/spons_partner.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/sponsor_and_partner.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';

abstract class AppRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> getCachedUser();
  Future<Either<Failure, Unit>> deleteCachedUser();
  Future<Either<Failure, Unit>> deleteUser();
  Future<Either<Failure, List<SponsPartner>>> getSponsPartner();
  Future<Either<Failure, SponsorAndPartner>> getSponsorAndPartnerByMenuId({
    required int menuId,
  });
}
