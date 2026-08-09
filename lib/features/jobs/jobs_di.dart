import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/jobs/data/datasources/jobs_remote_data.dart';
import 'package:kianja/features/jobs/data/repositories/jobs_repository_impl.dart';
import 'package:kianja/features/jobs/domain/repositories/jobs_repository.dart';
import 'package:kianja/features/jobs/domain/usecases/apply_to_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/block_user/block_user_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_events_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_hots_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_job_applicants_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_job_offers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_training_centers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_filters_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_professions_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_zone_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applications_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_features_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_filtering_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offers_group_by_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_motifs_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_domains_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_filter_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_view_domain_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/signaler_contenu/signaler_contenu_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_image_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_pdf_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_offers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_training_centers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_user_profile/view_user_profile_usecase.dart';
import 'package:kianja/features/jobs/presentation/bloc/apply_to_offer/apply_to_offer_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/job_applications/job_applications_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/save_content/save_content_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_events_list/saved_events_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_hots_list/saved_hots_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_job_applicants_list/saved_job_applicants_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_list/saved_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/saved_training_centers_list/saved_training_centers_list_bloc.dart';
import 'package:kianja/features/jobs/presentation/jobs_tab_reset_notifier.dart';

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
  getIt.registerLazySingleton<ApplyToOfferUseCase>(
    () => ApplyToOfferUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobApplicantProfessionsUseCase>(
    () => GetJobApplicantProfessionsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobApplicantFiltersUseCase>(
    () => GetJobApplicantFiltersUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobOfferFilteringUseCase>(
    () => GetJobOfferFilteringUseCase(jobsRepository: getIt()),
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
  getIt.registerLazySingleton<SaveContentUseCase>(
    () => SaveContentUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllSavedJobOffersUseCase>(
    () => GetAllSavedJobOffersUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllSavedJobApplicantsUseCase>(
    () => GetAllSavedJobApplicantsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllSavedTrainingCentersUseCase>(
    () => GetAllSavedTrainingCentersUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllSavedHotsUseCase>(
    () => GetAllSavedHotsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllSavedEventsUseCase>(
    () => GetAllSavedEventsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetJobApplicationsUseCase>(
    () => GetJobApplicationsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<ViewUserProfileUseCase>(
    () => ViewUserProfileUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<BlockUserUseCase>(
    () => BlockUserUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<GetMotifsUseCase>(
    () => GetMotifsUseCase(jobsRepository: getIt()),
  );
  getIt.registerLazySingleton<SignalerContenuUseCase>(
    () => SignalerContenuUseCase(jobsRepository: getIt()),
  );

  getIt.registerLazySingleton(JobsTabResetNotifier.new);

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
      getJobOfferFilteringUseCase: getIt(),
      getTrainingCenterHotEventUseCase: getIt(),
      viewAllHotEventUseCase: getIt(),
      viewAllTrainingCenterUseCase: getIt(),
      getHotEventDetailUseCase: getIt(),
      getTrainingCenterDetailUseCase: getIt(),
      getTrainingCenterViewDomainUseCase: getIt(),
      createTrainingCenterUseCase: getIt(),
      subscribeExpertExecutiveUseCase: getIt(),
      createHotEventUseCase: getIt(),
      viewUserProfileUseCase: getIt(),
      blockUserUseCase: getIt(),
      getMotifsUseCase: getIt(),
      signalerContenuUseCase: getIt(),
    ),
  );
  getIt.registerFactory(() => ApplyToOfferBloc(applyToOfferUseCase: getIt()));
  getIt.registerFactory(() => SaveContentBloc(saveContentUseCase: getIt()));
  getIt.registerFactory(
    () => SavedListBloc(getAllSavedJobOffersUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SavedJobApplicantsListBloc(getAllSavedJobApplicantsUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SavedTrainingCentersListBloc(
      getAllSavedTrainingCentersUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => SavedHotsListBloc(getAllSavedHotsUseCase: getIt()),
  );
  getIt.registerFactory(
    () => SavedEventsListBloc(getAllSavedEventsUseCase: getIt()),
  );
  getIt.registerFactory(
    () => JobApplicationsBloc(getJobApplicationsUseCase: getIt()),
  );
}
