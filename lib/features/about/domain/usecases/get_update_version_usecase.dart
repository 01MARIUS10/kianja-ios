import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/about/domain/entities/app_version.dart';
import 'package:kianja/features/about/domain/repositories/about_repository.dart';

class GetUpdateVersionUseCase implements UseCase<AppVersion, NoParams> {
  const GetUpdateVersionUseCase({required this.aboutRepository});
  
  final AboutRepository aboutRepository;

  @override
  Future<Either<Failure, AppVersion>> call(NoParams params) async {
    return await aboutRepository.getUpdateVersion();
  }
}
