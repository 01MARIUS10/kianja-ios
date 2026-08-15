import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';

class GetPricePlanUsecase
    implements UseCase<List<PricePlan>, GetPricePlanParams> {
  const GetPricePlanUsecase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, List<PricePlan>>> call(
    GetPricePlanParams params,
  ) async {
    return await jobsRepository.getPricePlans(getPricePlanParams: params);
  }
}
