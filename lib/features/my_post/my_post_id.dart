import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/features/my_post/data/datasources/remote/my_post_remote_data.dart';
import 'package:kianja/features/my_post/data/datasources/remote/my_post_remote_data_impl.dart';
import 'package:kianja/features/my_post/data/repositories/my_post_repository_impl.dart';
import 'package:kianja/features/my_post/domain/repositories/my_post_repository.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_expert_executive/delete_expert_executive_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_events_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_hots_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_job_applicants_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_job_offers_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_training_centers_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_usecase.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';

Future<void> initMyPostDependencies(GetIt getIt, Dio dio) async {
  // Data sources
  getIt.registerLazySingleton<MyPostRemoteData>(
    () => MyPostRemoteDataImpl(dio: dio),
  );

  // Repositories
  getIt.registerLazySingleton<MyPostRepository>(
    () => MyPostRepositoryImpl(myPostRemoteData: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton<UpdateJobOfferUseCase>(
    () => UpdateJobOfferUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<UpdateJobApplicantUseCase>(
    () => UpdateJobApplicantUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<UpdateTrainingCenterUseCase>(
    () => UpdateTrainingCenterUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<UpdateExpertExecutiveUseCase>(
    () => UpdateExpertExecutiveUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<UpdateHotEventUseCase>(
    () => UpdateHotEventUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteJobOfferUseCase>(
    () => DeleteJobOfferUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteJobApplicantUseCase>(
    () => DeleteJobApplicantUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteTrainingCenterUseCase>(
    () => DeleteTrainingCenterUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteExpertExecutiveUseCase>(
    () => DeleteExpertExecutiveUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<DeleteHotEventUseCase>(
    () => DeleteHotEventUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllJobOffersUseCase>(
    () => GetAllJobOffersUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllJobApplicantsUseCase>(
    () => GetAllJobApplicantsUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllTrainingCentersUseCase>(
    () => GetAllTrainingCentersUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllHotsUseCase>(
    () => GetAllHotsUseCase(myPostRepository: getIt()),
  );
  getIt.registerLazySingleton<GetAllEventsUseCase>(
    () => GetAllEventsUseCase(myPostRepository: getIt()),
  );

  // Blocs
  getIt.registerFactory(
    () => MyPostBloc(
      updateJobOfferUseCase: getIt(),
      updateJobApplicantUseCase: getIt(),
      updateTrainingCenterUseCase: getIt(),
      updateExpertExecutiveUseCase: getIt(),
      updateHotEventUseCase: getIt(),
      deleteJobOfferUseCase: getIt(),
      deleteJobApplicantUseCase: getIt(),
      deleteTrainingCenterUseCase: getIt(),
      deleteExpertExecutiveUseCase: getIt(),
      deleteHotEventUseCase: getIt(),
      getAllJobOffersUseCase: getIt(),
      getAllJobApplicantsUseCase: getIt(),
      getAllTrainingCentersUseCase: getIt(),
      getAllHotsUseCase: getIt(),
      getAllEventsUseCase: getIt(),
    ),
  );
}
