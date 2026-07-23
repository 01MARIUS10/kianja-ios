import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_cv/upload_profil_cv_params.dart';

class UploadProfilCVUseCase implements UseCase<Unit, UploadProfilCVParams> {
  const UploadProfilCVUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(UploadProfilCVParams params) async {
    return await accountRepository.uploadProfilCV(file: params.file);
  }
}
