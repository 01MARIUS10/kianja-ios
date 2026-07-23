import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/sponsor_and_partner.dart';
import 'package:kianja/core/shared/app_feature/domain/repositories/app_repository.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';

class GetSponsorAndPartnerByMenuIdUseCase
    implements UseCase<SponsorAndPartner, GetSponsorAndPartnerByMenuIdParams> {
  const GetSponsorAndPartnerByMenuIdUseCase({required this.appRepository});
  final AppRepository appRepository;

  @override
  Future<Either<Failure, SponsorAndPartner>> call(
    GetSponsorAndPartnerByMenuIdParams params,
  ) async {
    return appRepository.getSponsorAndPartnerByMenuId(menuId: params.menuId);
  }
}

class GetSponsorAndPartnerByMenuIdParams {
  const GetSponsorAndPartnerByMenuIdParams({required this.menuId});
  final int menuId;
}
