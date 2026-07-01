import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/account/data/datasources/remote/account_remote_data.dart';
import 'package:kianja/features/account/data/datasources/remote/account_remote_data_impl.dart';
import 'package:kianja/features/account/data/repositories/account_repository_impl.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/cgu_usecase.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_usecase.dart';
import 'package:kianja/features/account/domain/usecases/delete_profil_photo_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_all_kara_history_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_kara_usecase.dart';
import 'package:kianja/features/account/domain/usecases/logout_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_photo/upload_profil_photo_usecase.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';

Future<void> initAccountDependencies(GetIt getIt, Dio dio) async {
  // Data sources
  getIt.registerLazySingleton<AccountRemoteDataSource>(
    () => AccountRemoteDataSourceImpl(dio: dio),
  );

  // Repositories
  getIt.registerLazySingleton<AccountRepository>(
    () => AccountRepositoryImpl(
      remoteDataSource: getIt(),
      appSharedPrefs: getIt(),
    ),
  );

  // Use cases
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<ChangePasswordUseCase>(
    () => ChangePasswordUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<UpdateUserInfoUseCase>(
    () => UpdateUserInfoUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<CguUsecase>(
    () => CguUsecase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllKaraHistoryUsecase>(
    () => GetAllKaraHistoryUsecase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<GetKaraUseCase>(
    () => GetKaraUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<UploadProfilPhotoUseCase>(
    () => UploadProfilPhotoUseCase(accountRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteProfilPhotoUseCase>(
    () => DeleteProfilPhotoUseCase(accountRepository: getIt()),
  );

  // Blocs
  getIt.registerFactory(
    () => AccountBloc(
      appSharedPrefs: getIt(),
      logoutUseCase: getIt(),
      changePasswordUseCase: getIt(),
      updateUserInfoUseCase: getIt(),
      cguUseCase: getIt(),
      getAllKaraHistoryUsecase: getIt(),
      getKaraUseCase: getIt(),
      uploadProfilPhotoUseCase: getIt(),
      deleteProfilPhotoUseCase: getIt(),
    ),
  );
}
