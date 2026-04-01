import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/auth/data/datasources/auth_remote_data.dart';
import 'package:kianja/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:kianja/features/auth/domain/repositories/auth_repository.dart';
import 'package:kianja/features/auth/domain/usecases/signin_usecase.dart';
import 'package:kianja/features/auth/domain/usecases/signup_usecase.dart';
import 'package:kianja/features/auth/presentation/bloc/auth_bloc.dart';

Future<void> initAuthDependencies(GetIt getIt, Dio dio) async {
  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: dio),
  );

  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () =>
        AuthRepositoryImpl(remoteDataSource: getIt(), appSharedPrefs: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(authRepository: getIt()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(authRepository: getIt()),
  );

  // Blocs
  getIt.registerFactory(
    () => AuthBloc(signInUseCase: getIt(), signUpUseCase: getIt()),
  );
}
