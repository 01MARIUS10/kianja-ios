import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/shared/app_feature/domain/repositories/app_repository.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';

class DeleteUserUseCase implements UseCase<Unit, NoParams> {
  const DeleteUserUseCase({required this.appRepository});
  final AppRepository appRepository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return appRepository.deleteUser();
  }
}
