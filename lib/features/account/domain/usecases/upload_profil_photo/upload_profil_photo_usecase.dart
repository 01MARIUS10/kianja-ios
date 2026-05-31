import 'package:fpdart/fpdart.dart';
import 'package:kianja/core/errors/failures.dart';
import 'package:kianja/core/utils/usecase/usecase.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_photo/upload_profil_photo_params.dart';

class UploadProfilPhotoUseCase
    implements UseCase<Unit, UploadProfilPhotoParams> {
  const UploadProfilPhotoUseCase({required this.accountRepository});
  final AccountRepository accountRepository;

  @override
  Future<Either<Failure, Unit>> call(UploadProfilPhotoParams params) async {
    return await accountRepository.uploadProfilPhoto(file: params.file);
  }
}
