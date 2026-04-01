import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/account/data/datasources/account_remote_data.dart';
import 'package:kianja/features/account/data/repositories/account_repository_impl.dart';
import 'package:kianja/features/account/domain/repositories/account_repository.dart';
import 'package:kianja/features/account/domain/usecases/change_password_usecase.dart';
import 'package:kianja/features/account/domain/usecases/logout_usecase.dart';
import 'package:kianja/features/account/domain/usecases/update_user_info_usecase.dart';
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

  // Blocs
  getIt.registerFactory(
    () => AccountBloc(
      logoutUseCase: getIt(),
      changePasswordUseCase: getIt(),
      updateUserInfoUseCase: getIt(),
    ),
  );
}
