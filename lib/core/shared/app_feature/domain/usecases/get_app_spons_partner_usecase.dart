import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/spons_partner.dart';
import 'package:kianja/core/shared/app_feature/domain/repositories/app_repository.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';

class GetAppSponsPartnerUseCase
    implements UseCase<List<SponsPartner>, NoParams> {
  const GetAppSponsPartnerUseCase({required this.appRepository});
  final AppRepository appRepository;

  @override
  Future<Either<Failure, List<SponsPartner>>> call(NoParams params) async {
    return appRepository.getSponsPartner();
  }
}
