import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_params.dart';

class SubscribeExpertExecutiveUseCase
    implements UseCase<ExpertExecutive, SubscribeExpertExecutiveParams> {
  const SubscribeExpertExecutiveUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, ExpertExecutive>> call(
    SubscribeExpertExecutiveParams params,
  ) async {
    return await jobsRepository.subscribeExpertExecutive(
      subscribeExpertExecutiveParams: params,
    );
  }
}
