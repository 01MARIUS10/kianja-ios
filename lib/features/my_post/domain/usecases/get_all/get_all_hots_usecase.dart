import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';

class GetAllHotsUseCase implements UseCase<List<HotEvent>, QueryPageParams> {
  const GetAllHotsUseCase({required this.myPostRepository});
  final MyPostRepository myPostRepository;

  @override
  Future<Either<Failure, List<HotEvent>>> call(QueryPageParams params) async {
    return await myPostRepository.getAllHots(queryPageParams: params);
  }
}
