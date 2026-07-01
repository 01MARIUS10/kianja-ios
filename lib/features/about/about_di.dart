import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/about/data/datasources/remote/about_remote_data.dart';
import 'package:kianja/features/about/data/datasources/remote/about_remote_data_impl.dart';
import 'package:kianja/features/about/data/repositories/about_repository_impl.dart';
import 'package:kianja/features/about/domain/repositories/about_repository.dart';
import 'package:kianja/features/about/domain/usecases/get_all_versions_usecase.dart';
import 'package:kianja/features/about/domain/usecases/get_update_version_usecase.dart';
import 'package:kianja/features/about/presentation/bloc/about_bloc.dart';

Future<void> initAboutDependencies(GetIt getIt, Dio dio) async {
  // Data sources
  getIt.registerLazySingleton<AboutRemoteDataSource>(
    () => AboutRemoteDataSourceImpl(dio: dio),
  );

  // Repositories
  getIt.registerLazySingleton<AboutRepository>(
    () => AboutRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<GetUpdateVersionUseCase>(
    () => GetUpdateVersionUseCase(aboutRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllVersionsUseCase>(
    () => GetAllVersionsUseCase(aboutRepository: getIt()),
  );

  // Blocs
  getIt.registerFactory(
    () => AboutBloc(
      getUpdateVersionUseCase: getIt(),
      getAllVersionsUseCase: getIt(),
    ),
  );
}
