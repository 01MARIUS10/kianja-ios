import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';

class GetAllTrainingCentersUseCase
    implements UseCase<List<TrainingCenter>, QueryPageParams> {
  const GetAllTrainingCentersUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, List<TrainingCenter>>> call(
    QueryPageParams params,
  ) async {
    return await myPostRepository.getAllTrainingCenters(queryPageParams: params);
  }
}

