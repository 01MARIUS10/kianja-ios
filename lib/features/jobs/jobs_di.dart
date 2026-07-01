import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/jobs/data/datasources/jobs_remote_data.dart';
import 'package:kianja/features/jobs/data/repositories/jobs_repository_impl.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_filters_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_professions_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_zone_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_features_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offers_group_by_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_domains_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_filter_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_view_domain_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_image_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_pdf_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_offers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_training_centers_usecase.dart';
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
  getIt.registerLazySingleton<GetJobApplicantProfessionsUseCase>(
    () => GetJobApplicantProfessionsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobApplicantFiltersUseCase>(
    () => GetJobApplicantFiltersUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobFeaturesUseCase>(
    () => GetJobFeaturesUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobApplicantZoneUseCase>(
    () => GetJobApplicantZoneUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<ViewAllJobApplicantsUseCase>(
    () => ViewAllJobApplicantsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobApplicantDetailUseCase>(
    () => GetJobApplicantDetailUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetPricePlanUsecase>(
    () => GetPricePlanUsecase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<CreateJobApplicantUseCase>(
    () => CreateJobApplicantUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetTrainingCenterDomainsUseCase>(
    () => GetTrainingCenterDomainsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetTrainingCenterFilterUseCase>(
    () => GetTrainingCenterFilterUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetTrainingCenterHotEventUseCase>(
    () => GetTrainingCenterHotEventUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<ViewAllHotEventUseCase>(
    () => ViewAllHotEventUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<ViewAllTrainingCenterUseCase>(
    () => ViewAllTrainingCenterUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetHotEventDetailUseCase>(
    () => GetHotEventDetailUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetTrainingCenterDetailUseCase>(
    () => GetTrainingCenterDetailUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetTrainingCenterViewDomainUseCase>(
    () => GetTrainingCenterViewDomainUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<CreateTrainingCenterUseCase>(
    () => CreateTrainingCenterUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<SubscribeExpertExecutiveUseCase>(
    () => SubscribeExpertExecutiveUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<CreateHotEventUseCase>(
    () => CreateHotEventUseCase(jobsRepository: getIt()),
  );

  // Bloc
  getIt.registerFactory(
    () => JobsBloc(
      getJobFeaturesUseCase: getIt(),
      getJobApplicantFiltersUseCase: getIt(),
      getJobApplicantProfessionsUseCase: getIt(),
      getJobOffersGroupByUseCase: getIt(),
      viewAllJobOffersUseCase: getIt(),
      getJobApplicantZoneUseCase: getIt(),
      viewAllJobApplicantsUseCase: getIt(),
      getJobApplicantDetailUseCase: getIt(),
      uploadPdfUseCase: getIt(),
      uploadImageUseCase: getIt(),
      createJobOfferUseCase: getIt(),
      getJobOfferDetailUseCase: getIt(),
      getPricePlanUsecase: getIt(),
      createJobApplicantUseCase: getIt(),
      getTrainingCenterDomainsUseCase: getIt(),
      getTrainingCenterFilterUseCase: getIt(),
      getTrainingCenterHotEventUseCase: getIt(),
      viewAllHotEventUseCase: getIt(),
      viewAllTrainingCenterUseCase: getIt(),
      getHotEventDetailUseCase: getIt(),
      getTrainingCenterDetailUseCase: getIt(),
      getTrainingCenterViewDomainUseCase: getIt(),
      createTrainingCenterUseCase: getIt(),
      subscribeExpertExecutiveUseCase: getIt(),
      createHotEventUseCase: getIt(),
    ),
  );
}
