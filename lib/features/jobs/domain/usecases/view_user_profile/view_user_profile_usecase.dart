import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/view_user_profile/view_user_profile_params.dart';

class ViewUserProfileUseCase implements UseCase<User, ViewUserProfileParams> {
  const ViewUserProfileUseCase({required this.jobsRepository});
  final JobsRepository jobsRepository;

  @override
  Future<Either<Failure, User>> call(ViewUserProfileParams params) async {
    return await jobsRepository.viewUserProfile(viewUserProfileParams: params);
  }
}
