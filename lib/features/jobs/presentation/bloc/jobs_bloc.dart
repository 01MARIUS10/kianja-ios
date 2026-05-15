import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_plan.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_view_all_category.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_filters_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_plan_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_professions_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_zone_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_features_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offers_group_by_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_categories_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_filter_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_view_category_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_image_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_pdf_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_offers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_training_centers_usecase.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({
    required GetJobOffersGroupByUseCase getJobOffersGroupByUseCase,
    required ViewAllJobOffersUseCase viewAllJobOffersUseCase,
    required UploadPdfUseCase uploadPdfUseCase,
    required UploadImageUseCase uploadImageUseCase,
    required CreateJobOfferUseCase createJobOfferUseCase,
    required GetJobOfferDetailUseCase getJobOfferDetailUseCase,
    required GetJobApplicantDetailUseCase getJobApplicantDetailUseCase,
    required GetJobFeaturesUseCase getJobFeaturesUseCase,
    required GetJobApplicantZoneUseCase getJobApplicantZoneUseCase,
    required ViewAllJobApplicantsUseCase viewAllJobApplicantsUseCase,
    required GetJobApplicantProfessionsUseCase
    getJobApplicantProfessionsUseCase,
    required GetJobApplicantFiltersUseCase getJobApplicantFiltersUseCase,
    required GetJobApplicantPlanUsecase getJobApplicantPlanUsecase,
    required CreateJobApplicantUseCase createJobApplicantUseCase,
    required GetTrainingCenterCategoriesUseCase
    getTrainingCenterCategoriesUseCase,
    required GetTrainingCenterFilterUseCase getTrainingCenterFilterUseCase,
    required GetTrainingCenterHotEventUseCase getTrainingCenterHotEventUseCase,
    required ViewAllHotEventUseCase viewAllHotEventUseCase,
    required ViewAllTrainingCenterUseCase viewAllTrainingCenterUseCase,
    required GetHotEventDetailUseCase getHotEventDetailUseCase,
    required GetTrainingCenterDetailUseCase getTrainingCenterDetailUseCase,
    required GetTrainingCenterViewCategoryUseCase
    getTrainingCenterViewCategoryUseCase,
  }) : _getJobOffersGroupByUseCase = getJobOffersGroupByUseCase,
       _viewAllJobOffersUseCase = viewAllJobOffersUseCase,
       _uploadPdfUseCase = uploadPdfUseCase,
       _uploadImageUseCase = uploadImageUseCase,
       _createJobOfferUseCase = createJobOfferUseCase,
       _getJobOfferDetailUseCase = getJobOfferDetailUseCase,
       _getJobApplicantDetailUseCase = getJobApplicantDetailUseCase,
       _getJobFeaturesUseCase = getJobFeaturesUseCase,
       _getJobApplicantZoneUseCase = getJobApplicantZoneUseCase,
       _viewAllJobApplicantsUseCase = viewAllJobApplicantsUseCase,
       _getJobApplicantProfessionsUseCase = getJobApplicantProfessionsUseCase,
       _getJobApplicantFiltersUseCase = getJobApplicantFiltersUseCase,
       _getJobApplicantPlanUsecase = getJobApplicantPlanUsecase,
       _createJobApplicantUseCase = createJobApplicantUseCase,
       _getTrainingCenterCategoriesUseCase = getTrainingCenterCategoriesUseCase,
       _getTrainingCenterFilterUseCase = getTrainingCenterFilterUseCase,
       _getTrainingCenterHotEventUseCase = getTrainingCenterHotEventUseCase,
       _viewAllHotEventUseCase = viewAllHotEventUseCase,
       _viewAllTrainingCenterUseCase = viewAllTrainingCenterUseCase,
       _getHotEventDetailUseCase = getHotEventDetailUseCase,
       _getTrainingCenterDetailUseCase = getTrainingCenterDetailUseCase,
       _getTrainingCenterViewCategoryUseCase =
           getTrainingCenterViewCategoryUseCase,
       super(JobsInitial()) {
    on<JobsGroupByTypeFetchRequested>(_onGroupByTypeFetchRequested);
    on<JobsGroupByDateFetchRequested>(_onGroupByDateFetchRequested);
    on<JobsGroupByZoneFetchRequested>(_onGroupByZoneFetchRequested);
    on<JobsViewAllFetchRequested>(_onViewAllFetchRequested);
    on<JobsUploadPdfRequested>(_onUploadPdfRequested);
    on<JobsUploadImageRequested>(_onUploadImageRequested);
    on<JobsCreateJobOfferRequested>(_onCreateJobOfferRequested);
    on<JobsGetJobOfferDetailRequested>(_onGetJobOfferDetailRequested);
    on<JobsGetJobApplicantDetailRequested>(_onGetJobApplicantDetailRequested);
    on<JobFeaturesFetchRequested>(_onJobFeaturesFetchRequested);
    on<JobApplicantsViewAllFetchRequested>(
      _onJobApplicantsViewAllFetchRequested,
    );
    on<JobApplicantsZoneFetchRequested>(_onJobApplicantsZoneFetchRequested);
    on<JobApplicantProfessionsFetchRequested>(
      _onJobApplicantProfessionsFetchRequested,
    );
    on<JobApplicantFiltersFetchRequested>(_onJobApplicantFiltersFetchRequested);
    on<JobsGetJobApplicantPlanRequested>(_onJobsGetJobApplicantPlanRequested);
    on<JobCreateJobApplicantRequested>(_onJobCreateJobApplicantRequested);
    on<GetTrainingCenterCategoriesRequested>(
      _onGetTrainingCenterCategoriesRequested,
    );
    on<GetTrainingCenterFilterRequested>(_onGetTrainingCenterFilterRequested);
    on<GetTrainingCenterHotEventRequested>(
      _onGetTrainingCenterHotEventRequested,
    );
    on<ViewAllHotEventsRequested>(_onViewAllHotEventsRequested);
    on<ViewAllTrainingCentersRequested>(_onViewAllTrainingCentersRequested);
    on<GetHotEventDetailRequested>(_onGetHotEventDetailRequested);
    on<GetTrainingCenterDetailRequested>(_onGetTrainingCenterDetailRequested);
    on<GetTrainingCenterViewCategoryRequested>(
      _onGetTrainingCenterViewCategoryRequested,
    );
  }

  final GetJobOffersGroupByUseCase _getJobOffersGroupByUseCase;
  final ViewAllJobOffersUseCase _viewAllJobOffersUseCase;
  final UploadPdfUseCase _uploadPdfUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final CreateJobOfferUseCase _createJobOfferUseCase;
  final GetJobOfferDetailUseCase _getJobOfferDetailUseCase;
  final GetJobApplicantDetailUseCase _getJobApplicantDetailUseCase;
  final GetJobFeaturesUseCase _getJobFeaturesUseCase;
  final GetJobApplicantZoneUseCase _getJobApplicantZoneUseCase;
  final ViewAllJobApplicantsUseCase _viewAllJobApplicantsUseCase;
  final GetJobApplicantProfessionsUseCase _getJobApplicantProfessionsUseCase;
  final GetJobApplicantFiltersUseCase _getJobApplicantFiltersUseCase;
  final GetJobApplicantPlanUsecase _getJobApplicantPlanUsecase;
  final CreateJobApplicantUseCase _createJobApplicantUseCase;
  final GetTrainingCenterCategoriesUseCase _getTrainingCenterCategoriesUseCase;
  final GetTrainingCenterFilterUseCase _getTrainingCenterFilterUseCase;
  final GetTrainingCenterHotEventUseCase _getTrainingCenterHotEventUseCase;
  final ViewAllHotEventUseCase _viewAllHotEventUseCase;
  final ViewAllTrainingCenterUseCase _viewAllTrainingCenterUseCase;
  final GetHotEventDetailUseCase _getHotEventDetailUseCase;
  final GetTrainingCenterDetailUseCase _getTrainingCenterDetailUseCase;
  final GetTrainingCenterViewCategoryUseCase
  _getTrainingCenterViewCategoryUseCase;

  Future<void> _onGetHotEventDetailRequested(
    GetHotEventDetailRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Hot event detail request');

    emit(JobsRequestInProgress());
    final result = await _getHotEventDetailUseCase(
      event.getHotEventDetailParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (hotEventDetail) =>
          emit(GetHotEventDetailSuccess(hotEvent: hotEventDetail)),
    );
  }

  Future<void> _onGetTrainingCenterViewCategoryRequested(
    GetTrainingCenterViewCategoryRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center view category request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterViewCategoryUseCase(event.params);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterViewCategory) => emit(
        GetTrainingCenterViewCategorySuccess(
          trainingCenterViewCategory: trainingCenterViewCategory,
        ),
      ),
    );
  }

  Future<void> _onGetTrainingCenterDetailRequested(
    GetTrainingCenterDetailRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center detail request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterDetailUseCase(
      event.trainingCenterDetailParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterDetail) => emit(
        GetTrainingCenterDetailSuccess(trainingCenter: trainingCenterDetail),
      ),
    );
  }

  Future<void> _onViewAllHotEventsRequested(
    ViewAllHotEventsRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - View all hot events request');

    emit(JobsRequestInProgress());
    final result = await _viewAllHotEventUseCase(event.viewAllHotEventParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (hotEvents) => emit(ViewAllHotEventsSuccess(hotEvents: hotEvents)),
    );
  }

  Future<void> _onViewAllTrainingCentersRequested(
    ViewAllTrainingCentersRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - View all training centers request');

    emit(JobsRequestInProgress());
    final result = await _viewAllTrainingCenterUseCase(
      event.viewAllTrainingCentersParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenters) =>
          emit(ViewAllTrainingCentersSuccess(trainingCenters: trainingCenters)),
    );
  }

  Future<void> _onGetTrainingCenterHotEventRequested(
    GetTrainingCenterHotEventRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center hot event request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterHotEventUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterHotEvents) {
        final trainingCenterHotEventList = trainingCenterHotEvents
            .where(
              (trainingCenterHotEvent) =>
                  trainingCenterHotEvent.hotEvents.isNotEmpty,
            )
            .toList();
        emit(
          GetTrainingCenterHotEventSuccess(
            trainingCenterHotEvents: trainingCenterHotEventList,
          ),
        );
      },
    );
  }

  Future<void> _onGetTrainingCenterFilterRequested(
    GetTrainingCenterFilterRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center filter request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterFilterUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterFilter) => emit(
        GetTrainingCenterFilterSuccess(
          trainingCenterFilter: trainingCenterFilter,
        ),
      ),
    );
  }

  Future<void> _onGetTrainingCenterCategoriesRequested(
    GetTrainingCenterCategoriesRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center categories request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterCategoriesUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterCategories) => emit(
        GetTrainingCenterCategoriesSuccess(
          trainingCenterCategories: trainingCenterCategories,
        ),
      ),
    );
  }

  Future<void> _onJobFeaturesFetchRequested(
    JobFeaturesFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Job features request');

    emit(JobsRequestInProgress());
    final result = await _getJobFeaturesUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobFeatures) => emit(JobFeaturesFetchSuccess(jobFeatures: jobFeatures)),
    );
  }

  Future<void> _onJobApplicantProfessionsFetchRequested(
    JobApplicantProfessionsFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Job applicant professions request');

    emit(JobsRequestInProgress());
    final result = await _getJobApplicantProfessionsUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicantProfessions) => emit(
        JobApplicantProfessionsFetchSuccess(
          jobCategories: jobApplicantProfessions,
        ),
      ),
    );
  }

  Future<void> _onJobApplicantFiltersFetchRequested(
    JobApplicantFiltersFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Job applicant filters request');

    emit(JobsRequestInProgress());
    final result = await _getJobApplicantFiltersUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicantFilters) => emit(
        JobApplicantFiltersFetchSuccess(
          jobApplicantFilter: jobApplicantFilters,
        ),
      ),
    );
  }

  Future<void> _onGroupByTypeFetchRequested(
    JobsGroupByTypeFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Group by request : ${event.query}');

    emit(JobsRequestInProgress());
    final result = await _getJobOffersGroupByUseCase(
      GetJobOffersGroupByParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFilters) {
        final jobOfferFilterList = jobOfferFilters
            .where((jobOfferFilter) => jobOfferFilter.jobOffers.isNotEmpty)
            .toList();
        emit(JobsGroupByTypeFetchSuccess(jobOffersType: jobOfferFilterList));
      },
    );
  }

  Future<void> _onGroupByDateFetchRequested(
    JobsGroupByDateFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Group by request : ${event.query}');

    emit(JobsRequestInProgress());
    final result = await _getJobOffersGroupByUseCase(
      GetJobOffersGroupByParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFilters) {
        final jobOfferFilterList = jobOfferFilters
            .where((jobOfferFilter) => jobOfferFilter.jobOffers.isNotEmpty)
            .toList();
        emit(JobsGroupByDateFetchSuccess(jobOffersDate: jobOfferFilterList));
      },
    );
  }

  Future<void> _onGroupByZoneFetchRequested(
    JobsGroupByZoneFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Group by request : ${event.query}');

    emit(JobsRequestInProgress());
    final result = await _getJobOffersGroupByUseCase(
      GetJobOffersGroupByParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFilters) {
        final jobOfferFilterList = jobOfferFilters
            .where((jobOfferFilter) => jobOfferFilter.jobOffers.isNotEmpty)
            .toList();
        emit(JobsGroupByZoneFetchSuccess(jobOffersZone: jobOfferFilterList));
      },
    );
  }

  Future<void> _onViewAllFetchRequested(
    JobsViewAllFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _viewAllJobOffersUseCase(
      ViewAllJobOffersParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffers) => emit(
        JobsViewAllFetchSuccess(jobOffers: jobOffers, query: event.query),
      ),
    );
  }

  Future<void> _onJobApplicantsZoneFetchRequested(
    JobApplicantsZoneFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobApplicantZoneUseCase(
      event.getJobApplicantParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicantsZone) {
        final jobApplicantsZoneList = jobApplicantsZone
            .where(
              (jobApplicantsZone) => jobApplicantsZone.jobApplicants.isNotEmpty,
            )
            .toList();
        emit(
          JobApplicantsZoneFetchSuccess(
            jobApplicantsZone: jobApplicantsZoneList,
          ),
        );
      },
    );
  }

  Future<void> _onJobsGetJobApplicantPlanRequested(
    JobsGetJobApplicantPlanRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobApplicantPlanUsecase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicantPlans) => emit(
        JobsGetJobApplicantPlanSuccess(jobApplicantPlans: jobApplicantPlans),
      ),
    );
  }

  Future<void> _onJobCreateJobApplicantRequested(
    JobCreateJobApplicantRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _createJobApplicantUseCase(
      event.createJobApplicantParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicant) =>
          emit(JobsCreateJobApplicantSuccess(jobApplicant: jobApplicant)),
    );
  }

  Future<void> _onJobApplicantsViewAllFetchRequested(
    JobApplicantsViewAllFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _viewAllJobApplicantsUseCase(
      event.viewAllJobApplicantsParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicants) =>
          emit(JobApplicantsViewAllFetchSuccess(jobApplicants: jobApplicants)),
    );
  }

  Future<void> _onUploadPdfRequested(
    JobsUploadPdfRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _uploadPdfUseCase(UploadPdfParams(file: event.file));
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobPdf) => emit(JobsUploadPdfSuccess(jobPdf: jobPdf)),
    );
  }

  Future<void> _onUploadImageRequested(
    JobsUploadImageRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _uploadImageUseCase(
      UploadImageParams(file: event.file),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobImage) => emit(JobsUploadImageSuccess(jobImage: jobImage)),
    );
  }

  Future<void> _onCreateJobOfferRequested(
    JobsCreateJobOfferRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _createJobOfferUseCase(
      CreateJobOfferParams(
        title: event.title,
        imageId: event.imageId,
        description: event.description,
        categories: event.categories,
        location: event.location,
        gender: event.gender,
        actor: event.actor,
        limitDate: event.limitDate,
        status: event.status,
      ),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffer) => emit(JobsCreateJobOfferSuccess(jobOffer: jobOffer)),
    );
  }

  Future<void> _onGetJobOfferDetailRequested(
    JobsGetJobOfferDetailRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobOfferDetailUseCase(
      GetJobOfferDetailParams(id: event.id),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffer) => emit(JobsGetJobOfferDetailSuccess(jobOffer: jobOffer)),
    );
  }

  Future<void> _onGetJobApplicantDetailRequested(
    JobsGetJobApplicantDetailRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobApplicantDetailUseCase(
      GetJobApplicantDetailParams(id: event.id),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicant) =>
          emit(JobsGetJobApplicantDetailSuccess(jobApplicant: jobApplicant)),
    );
  }
}
