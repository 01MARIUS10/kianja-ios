import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center_view_category/training_center_view_category_model.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';

class GetTrainingCenterViewCategoryUseCase
    implements
        UseCase<
          TrainingCenterViewCategoryModel,
          GetTrainingCenterViewCategoryParams
        > {
  const GetTrainingCenterViewCategoryUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, TrainingCenterViewCategoryModel>> call(
    GetTrainingCenterViewCategoryParams params,
  ) async {
    return await jobsRepository.getTrainingCenterViewCategory(id: params.id);
  }
}

class GetTrainingCenterViewCategoryParams {
  const GetTrainingCenterViewCategoryParams({required this.id});

  final int id;
}
