import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/app_feature/domain/repositories/app_repository.dart';
import 'package:kianja/core/utils/usecase.dart';

class GetCachedUserUseCase implements UseCase<User, NoParams> {
  const GetCachedUserUseCase({required this.appRepository});
  final AppRepository appRepository;

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return appRepository.getCachedUser();
  }
}
