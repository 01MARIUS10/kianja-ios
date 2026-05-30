import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_view_domain/training_center_view_domain_model.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterViewDomainUseCase
    implements
        UseCase<
          TrainingCenterViewDomainModel,
          GetTrainingCenterViewDomainParams
        > {
  const GetTrainingCenterViewDomainUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, TrainingCenterViewDomainModel>> call(
    GetTrainingCenterViewDomainParams params,
  ) async {
    return await jobsRepository.getTrainingCenterViewDomain(id: params.id);
  }
}

class GetTrainingCenterViewDomainParams {
  const GetTrainingCenterViewDomainParams({required this.id});

  final int id;
}
