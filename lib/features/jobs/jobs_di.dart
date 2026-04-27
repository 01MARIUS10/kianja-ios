import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/jobs/data/datasources/jobs_remote_data.dart';
import 'package:kianja/features/jobs/data/repositories/jobs_repository_impl.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_featurs_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offers_group_by_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_image_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_pdf_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_offers_usecase.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';

Future<void> initJobsDependencies(GetIt getIt, Dio dio) async {
  // Data sources
  getIt.registerLazySingleton<JobsRemoteDataSource>(
    () => JobsRemoteDataSourceImpl(dio: dio),
  );

  // Repositories
  getIt.registerLazySingleton<JobsRepository>(
    () => JobsRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<GetJobOffersGroupByUseCase>(
    () => GetJobOffersGroupByUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<ViewAllJobOffersUseCase>(
    () => ViewAllJobOffersUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<UploadPdfUseCase>(
    () => UploadPdfUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<UploadImageUseCase>(
    () => UploadImageUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<CreateJobOfferUseCase>(
    () => CreateJobOfferUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobOfferDetailUseCase>(
    () => GetJobOfferDetailUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobFeaturesUseCase>(
    () => GetJobFeaturesUseCase(jobsRepository: getIt()),
  );

  // Bloc
  getIt.registerFactory(
    () => JobsBloc(
      getJobFeaturesUseCase: getIt(),
      getJobOffersGroupByUseCase: getIt(),
      viewAllJobOffersUseCase: getIt(),
      uploadPdfUseCase: getIt(),
      uploadImageUseCase: getIt(),
      createJobOfferUseCase: getIt(),
      getJobOfferDetailUseCase: getIt(),
    ),
  );
}
