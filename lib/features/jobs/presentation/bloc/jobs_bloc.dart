import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filtering.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_view_all_domain.dart';
import 'package:kianja/features/jobs/domain/usecases/apply_to_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/block_user/block_user_params.dart';
import 'package:kianja/features/jobs/domain/usecases/block_user/block_user_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_params.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_filters_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_professions_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_zone_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_features_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_filtering_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offers_group_by_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_domains_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_filter_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_view_domain_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_params.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_image_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_pdf_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_hot_event_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_offers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_training_centers_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_user_profile/view_user_profile_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_user_profile/view_user_profile_usecase.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({
    required this._getJobOffersGroupByUseCase,
    required this._viewAllJobOffersUseCase,
    required this._uploadPdfUseCase,
    required this._uploadImageUseCase,
    required this._createJobOfferUseCase,
    required this._getJobOfferDetailUseCase,
    required this._getJobApplicantDetailUseCase,
    required this._getJobFeaturesUseCase,
    required this._getJobApplicantZoneUseCase,
    required this._viewAllJobApplicantsUseCase,
    required this._getJobApplicantProfessionsUseCase,
    required this._getJobApplicantFiltersUseCase,
    required this._getJobOfferFilteringUseCase,
    required this._getPricePlanUsecase,
    required this._createJobApplicantUseCase,
    required this._getTrainingCenterDomainsUseCase,
    required this._getTrainingCenterFilterUseCase,
    required this._getTrainingCenterHotEventUseCase,
    required this._viewAllHotEventUseCase,
    required this._viewAllTrainingCenterUseCase,
    required this._getHotEventDetailUseCase,
    required this._getTrainingCenterDetailUseCase,
    required this._getTrainingCenterViewDomainUseCase,
    required this._createTrainingCenterUseCase,
    required this._subscribeExpertExecutiveUseCase,
    required this._createHotEventUseCase,
    required this._viewUserProfileUseCase,
    required this._blockUserUseCase,
  }) : super(JobsInitial()) {
    on<JobsGroupByTypeFetchRequested>(_onGroupByTypeFetchRequested);
    on<JobsGroupByDateFetchRequested>(_onGroupByDateFetchRequested);
    on<JobsGroupByZoneFetchRequested>(_onGroupByZoneFetchRequested);
    on<JobsViewAllFetchRequested>(_onViewAllFetchRequested);
    on<JobsLoadMoreViewAllRequested>(_onLoadMoreViewAllRequested);
    on<JobsUploadPdfRequested>(_onUploadPdfRequested);
    on<JobsUploadImageRequested>(_onUploadImageRequested);
    on<JobsUploadMultipleImagesRequested>(_onUploadMultipleImagesRequested);
    on<JobsCreateJobOfferRequested>(_onCreateJobOfferRequested);
    on<JobsGetJobOfferDetailRequested>(_onGetJobOfferDetailRequested);
    on<JobsGetJobApplicantDetailRequested>(_onGetJobApplicantDetailRequested);
    on<JobFeaturesFetchRequested>(_onJobFeaturesFetchRequested);
    on<JobApplicantsViewAllFetchRequested>(
      _onJobApplicantsViewAllFetchRequested,
    );
    on<JobApplicantLoadMoreViewAllRequested>(
      _onLoadMoreJopApplicantViewAllRequested,
    );
    on<JobApplicantsZoneFetchRequested>(_onJobApplicantsZoneFetchRequested);
    on<JobApplicantProfessionsFetchRequested>(
      _onJobApplicantProfessionsFetchRequested,
    );
    on<JobApplicantFiltersFetchRequested>(_onJobApplicantFiltersFetchRequested);
    on<JobOfferFilteringFetchRequested>(_onJobOfferFilteringFetchRequested);
    on<JobsGetPricePlanRequested>(_onJobsGetPricePlanRequested);
    on<JobCreateJobApplicantRequested>(_onJobCreateJobApplicantRequested);
    on<GetTrainingCenterDomainsRequested>(_onGetTrainingCenterDomainsRequested);
    on<GetTrainingCenterFilterRequested>(_onGetTrainingCenterFilterRequested);
    on<GetTrainingCenterHotEventRequested>(
      _onGetTrainingCenterHotEventRequested,
    );
    on<ViewAllHotEventsRequested>(_onViewAllHotEventsRequested);
    on<LoadMoreHotEventsRequested>(_onLoadMoreHotEventsRequested);
    on<ViewAllTrainingCentersRequested>(_onViewAllTrainingCentersRequested);
    on<LoadMoreTrainingCenterRequested>(_onLoadMoreTrainingCentersRequested);
    on<GetHotEventDetailRequested>(_onGetHotEventDetailRequested);
    on<GetTrainingCenterDetailRequested>(_onGetTrainingCenterDetailRequested);
    on<GetTrainingCenterViewDomainRequested>(
      _onGetTrainingCenterViewDomainRequested,
    );
    on<CreateTrainingCenterRequested>(_onCreateTrainingCenterRequested);
    on<SubscribeExpertExecutiveRequested>(_onSubscribeExpertExecutiveRequested);
    on<CreateHotEventRequested>(_onCreateHotEventRequested);
    on<JobsViewUserProfileRequested>(_onJobsViewUserProfileRequested);
    on<JobsBlockUserRequested>(_onJobsBlockUserRequested);
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
  final GetJobOfferFilteringUseCase _getJobOfferFilteringUseCase;
  final GetPricePlanUsecase _getPricePlanUsecase;
  final CreateJobApplicantUseCase _createJobApplicantUseCase;
  final GetTrainingCenterDomainsUseCase _getTrainingCenterDomainsUseCase;
  final GetTrainingCenterFilterUseCase _getTrainingCenterFilterUseCase;
  final GetTrainingCenterHotEventUseCase _getTrainingCenterHotEventUseCase;
  final ViewAllHotEventUseCase _viewAllHotEventUseCase;
  final ViewAllTrainingCenterUseCase _viewAllTrainingCenterUseCase;
  final GetHotEventDetailUseCase _getHotEventDetailUseCase;
  final GetTrainingCenterDetailUseCase _getTrainingCenterDetailUseCase;
  final GetTrainingCenterViewDomainUseCase _getTrainingCenterViewDomainUseCase;
  final CreateTrainingCenterUseCase _createTrainingCenterUseCase;
  final SubscribeExpertExecutiveUseCase _subscribeExpertExecutiveUseCase;
  final CreateHotEventUseCase _createHotEventUseCase;
  final ViewUserProfileUseCase _viewUserProfileUseCase;
  final BlockUserUseCase _blockUserUseCase;

  static const int _viewAllPageSize = 15;
  int _currentViewAllPage = 1;
  String _currentViewAllQuery = '';
  List<JobOffer> _cachedViewAllJobOffers = [];
  bool _hasMoreViewAll = true;
  bool _isLoadMoreViewAllInProgress = false;

  int _currentViewAllJobApplicantPage = 1;
  String _currentViewAllJobApplicantQuery = '';
  List<JobApplicant> _cachedViewAllJobApplicants = [];
  bool _hasMoreViewAllJobApplicants = true;
  bool _isLoadMoreViewAllJobApplicantsInProgress = false;

  int _currentViewAllTrainingCenterPage = 1;
  String _currentViewAllTrainingCenterQuery = '';
  List<TrainingCenter> _cachedViewAllTrainingCenters = [];
  bool _hasMoreViewAllTrainingCenters = true;
  bool _isLoadMoreViewAllTrainingCentersInProgress = false;

  int _currentViewAllHotEventPage = 1;
  String _currentViewAllHotEventQuery = '';
  List<HotEvent> _cachedViewAllHotEvents = [];
  bool _hasMoreViewAllHotEvents = true;
  bool _isLoadMoreViewAllHotEventsInProgress = false;

  Future<void> _onCreateHotEventRequested(
    CreateHotEventRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _createHotEventUseCase(event.createHotEventParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (hotEvent) => emit(CreateHotEventSuccess(hotEvent: hotEvent)),
    );
  }

  Future<void> _onSubscribeExpertExecutiveRequested(
    SubscribeExpertExecutiveRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Subscribe expert executive request');

    emit(JobsRequestInProgress());
    final result = await _subscribeExpertExecutiveUseCase(
      event.subscribeExpertExecutiveParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (subscribeExpertExecutive) => emit(
        SubscribeExpertExecutiveSuccess(
          expertExecutive: subscribeExpertExecutive,
        ),
      ),
    );
  }

  Future<void> _onCreateTrainingCenterRequested(
    CreateTrainingCenterRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Create training center request');

    emit(JobsRequestInProgress());
    final result = await _createTrainingCenterUseCase(
      event.createtrainingCenterParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenter) =>
          emit(JobsCreateTrainingCenterSuccess(trainingCenter: trainingCenter)),
    );
  }

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

  Future<void> _onGetTrainingCenterViewDomainRequested(
    GetTrainingCenterViewDomainRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center view Domain request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterViewDomainUseCase(event.params);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterViewDomain) => emit(
        GetTrainingCenterViewDomainSuccess(
          trainingCenterViewDomain: trainingCenterViewDomain,
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
    _currentViewAllHotEventPage = event.queryPageParams.page;
    _currentViewAllHotEventQuery = event.queryPageParams.query;
    _cachedViewAllHotEvents = [];
    _hasMoreViewAllHotEvents = true;
    _isLoadMoreViewAllHotEventsInProgress = false;
    AppDebug.showPrint('Bloc Jobs - View all hot events request');

    emit(JobsRequestInProgress());
    final result = await _viewAllHotEventUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (hotEvents) {
        _cachedViewAllHotEvents = hotEvents;
        _hasMoreViewAllHotEvents = hotEvents.length >= _viewAllPageSize;
        emit(
          ViewAllHotEventsSuccess(
            hotEvents: hotEvents,
            query: _currentViewAllHotEventQuery,
            hasMore: _hasMoreViewAllHotEvents,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreHotEventsRequested(
    LoadMoreHotEventsRequested event,
    Emitter<JobsState> emit,
  ) async {
    if (!_hasMoreViewAllHotEvents || _isLoadMoreViewAllHotEventsInProgress) {
      return;
    }

    _isLoadMoreViewAllHotEventsInProgress = true;
    emit(
      ViewAllHotEventsSuccess(
        hotEvents: _cachedViewAllHotEvents,
        query: _currentViewAllHotEventQuery,
        hasMore: _hasMoreViewAllHotEvents,
        isLoadMore: true,
      ),
    );

    _currentViewAllHotEventPage++;
    final result = await _viewAllHotEventUseCase(
      QueryPageParams(
        query: _currentViewAllHotEventQuery,
        page: _currentViewAllHotEventPage,
      ),
    );
    result.fold(
      (failure) {
        _currentViewAllHotEventPage--;
        _isLoadMoreViewAllHotEventsInProgress = false;
        emit(JobsRequestFailure(message: failure.message));
      },
      (hotEvents) {
        _cachedViewAllHotEvents = [..._cachedViewAllHotEvents, ...hotEvents];
        _hasMoreViewAllHotEvents = hotEvents.length >= _viewAllPageSize;
        _isLoadMoreViewAllHotEventsInProgress = false;
        emit(
          ViewAllHotEventsSuccess(
            hotEvents: _cachedViewAllHotEvents,
            query: _currentViewAllHotEventQuery,
            hasMore: _hasMoreViewAllHotEvents,
          ),
        );
      },
    );
  }

  Future<void> _onViewAllTrainingCentersRequested(
    ViewAllTrainingCentersRequested event,
    Emitter<JobsState> emit,
  ) async {
    _currentViewAllTrainingCenterPage = event.queryPageParams.page;
    _currentViewAllTrainingCenterQuery = event.queryPageParams.query;
    _cachedViewAllTrainingCenters = [];
    _hasMoreViewAllTrainingCenters = true;
    _isLoadMoreViewAllTrainingCentersInProgress = false;
    AppDebug.showPrint('Bloc Jobs - View all training centers request');

    emit(JobsRequestInProgress());
    final result = await _viewAllTrainingCenterUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenters) {
        _cachedViewAllTrainingCenters = trainingCenters;
        _hasMoreViewAllTrainingCenters =
            trainingCenters.length >= _viewAllPageSize;
        emit(
          ViewAllTrainingCentersSuccess(
            trainingCenters: trainingCenters,
            query: _currentViewAllTrainingCenterQuery,
            hasMore: _hasMoreViewAllTrainingCenters,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreTrainingCentersRequested(
    LoadMoreTrainingCenterRequested event,
    Emitter<JobsState> emit,
  ) async {
    if (!_hasMoreViewAllTrainingCenters ||
        _isLoadMoreViewAllTrainingCentersInProgress) {
      return;
    }

    _isLoadMoreViewAllTrainingCentersInProgress = true;
    emit(
      ViewAllTrainingCentersSuccess(
        trainingCenters: _cachedViewAllTrainingCenters,
        query: _currentViewAllTrainingCenterQuery,
        hasMore: _hasMoreViewAllTrainingCenters,
        isLoadMore: true,
      ),
    );

    _currentViewAllTrainingCenterPage++;
    final result = await _viewAllTrainingCenterUseCase(
      QueryPageParams(
        query: _currentViewAllTrainingCenterQuery,
        page: _currentViewAllTrainingCenterPage,
      ),
    );
    result.fold(
      (failure) {
        _currentViewAllTrainingCenterPage--;
        _isLoadMoreViewAllTrainingCentersInProgress = false;
        emit(JobsRequestFailure(message: failure.message));
      },
      (trainingCenters) {
        _cachedViewAllTrainingCenters = [
          ..._cachedViewAllTrainingCenters,
          ...trainingCenters,
        ];
        _hasMoreViewAllTrainingCenters =
            trainingCenters.length >= _viewAllPageSize;
        _isLoadMoreViewAllTrainingCentersInProgress = false;
        emit(
          ViewAllTrainingCentersSuccess(
            trainingCenters: _cachedViewAllTrainingCenters,
            query: _currentViewAllTrainingCenterQuery,
            hasMore: _hasMoreViewAllTrainingCenters,
          ),
        );
      },
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

  Future<void> _onGetTrainingCenterDomainsRequested(
    GetTrainingCenterDomainsRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Training center domains request');

    emit(JobsRequestInProgress());
    final result = await _getTrainingCenterDomainsUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (trainingCenterDomains) => emit(
        GetTrainingCenterDomainsSuccess(
          trainingCenterDomains: trainingCenterDomains,
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

  Future<void> _onJobOfferFilteringFetchRequested(
    JobOfferFilteringFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Job offer filters request');

    emit(JobsRequestInProgress());
    final result = await _getJobOfferFilteringUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFiltering) => emit(
        JobOfferFilteringFetchSuccess(jobOfferFiltering: jobOfferFiltering),
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
    _currentViewAllPage = event.queryPageParams.page;
    _currentViewAllQuery = event.queryPageParams.query;
    _cachedViewAllJobOffers = [];
    _hasMoreViewAll = true;
    _isLoadMoreViewAllInProgress = false;

    emit(JobsRequestInProgress());
    final result = await _viewAllJobOffersUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffers) {
        _cachedViewAllJobOffers = jobOffers;
        _hasMoreViewAll = jobOffers.length >= _viewAllPageSize;
        emit(
          JobsViewAllFetchSuccess(
            jobOffers: _cachedViewAllJobOffers,
            query: _currentViewAllQuery,
            hasMore: _hasMoreViewAll,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreViewAllRequested(
    JobsLoadMoreViewAllRequested event,
    Emitter<JobsState> emit,
  ) async {
    if (!_hasMoreViewAll || _isLoadMoreViewAllInProgress) {
      return;
    }

    _isLoadMoreViewAllInProgress = true;
    emit(
      JobsViewAllFetchSuccess(
        jobOffers: _cachedViewAllJobOffers,
        query: _currentViewAllQuery,
        hasMore: _hasMoreViewAll,
        isLoadMore: true,
      ),
    );

    _currentViewAllPage++;
    final result = await _viewAllJobOffersUseCase(
      QueryPageParams(query: _currentViewAllQuery, page: _currentViewAllPage),
    );
    result.fold(
      (failure) {
        _currentViewAllPage--;
        _isLoadMoreViewAllInProgress = false;
        emit(JobsRequestFailure(message: failure.message));
      },
      (jobOffers) {
        _cachedViewAllJobOffers = [..._cachedViewAllJobOffers, ...jobOffers];
        _hasMoreViewAll = jobOffers.length >= _viewAllPageSize;
        _isLoadMoreViewAllInProgress = false;
        emit(
          JobsViewAllFetchSuccess(
            jobOffers: _cachedViewAllJobOffers,
            query: _currentViewAllQuery,
            hasMore: _hasMoreViewAll,
          ),
        );
      },
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

  Future<void> _onJobsGetPricePlanRequested(
    JobsGetPricePlanRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getPricePlanUsecase(event.getPricePlanParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (pricePlans) => emit(JobsGetPricePlanSuccess(pricePlans: pricePlans)),
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
    _currentViewAllJobApplicantPage = event.queryPageParams.page;
    _currentViewAllJobApplicantQuery = event.queryPageParams.query;
    _cachedViewAllJobApplicants = [];
    _hasMoreViewAllJobApplicants = true;
    _isLoadMoreViewAllJobApplicantsInProgress = false;

    emit(JobsRequestInProgress());
    final result = await _viewAllJobApplicantsUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicants) {
        _cachedViewAllJobApplicants = jobApplicants;
        _hasMoreViewAllJobApplicants = jobApplicants.length >= _viewAllPageSize;
        emit(
          JobApplicantsViewAllFetchSuccess(
            jobApplicants: _cachedViewAllJobApplicants,
            query: _currentViewAllJobApplicantQuery,
            hasMore: _hasMoreViewAllJobApplicants,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreJopApplicantViewAllRequested(
    JobApplicantLoadMoreViewAllRequested event,
    Emitter<JobsState> emit,
  ) async {
    if (!_hasMoreViewAllJobApplicants ||
        _isLoadMoreViewAllJobApplicantsInProgress) {
      return;
    }

    _isLoadMoreViewAllJobApplicantsInProgress = true;
    emit(
      JobApplicantsViewAllFetchSuccess(
        jobApplicants: _cachedViewAllJobApplicants,
        query: _currentViewAllJobApplicantQuery,
        hasMore: _hasMoreViewAllJobApplicants,
        isLoadMore: true,
      ),
    );

    _currentViewAllJobApplicantPage++;
    final result = await _viewAllJobApplicantsUseCase(
      QueryPageParams(
        query: _currentViewAllJobApplicantQuery,
        page: _currentViewAllJobApplicantPage,
      ),
    );
    result.fold(
      (failure) {
        _currentViewAllJobApplicantPage--;
        _isLoadMoreViewAllJobApplicantsInProgress = false;
        emit(JobsRequestFailure(message: failure.message));
      },
      (jobApplicants) {
        _cachedViewAllJobApplicants = [
          ..._cachedViewAllJobApplicants,
          ...jobApplicants,
        ];
        _hasMoreViewAllJobApplicants = jobApplicants.length >= _viewAllPageSize;
        _isLoadMoreViewAllJobApplicantsInProgress = false;
        emit(
          JobApplicantsViewAllFetchSuccess(
            jobApplicants: _cachedViewAllJobApplicants,
            query: _currentViewAllJobApplicantQuery,
            hasMore: _hasMoreViewAllJobApplicants,
          ),
        );
      },
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

  Future<void> _onUploadMultipleImagesRequested(
    JobsUploadMultipleImagesRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final List<JobImage> uploadedImages = [];

    for (final file in event.files) {
      final result = await _uploadImageUseCase(UploadImageParams(file: file));

      // If one fails, we can either stop or continue. Stopping is safer to avoid incomplete submissions.
      if (result.isLeft()) {
        final failure = result.fold((l) => l, (r) => throw Exception());
        emit(JobsRequestFailure(message: failure.message));
        return;
      }

      final jobImage = result.fold((l) => throw Exception(), (r) => r);
      uploadedImages.add(jobImage);
    }

    emit(JobsUploadMultipleImagesSuccess(jobImages: uploadedImages));
  }

  Future<void> _onCreateJobOfferRequested(
    JobsCreateJobOfferRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _createJobOfferUseCase(event.createJobOfferParams);
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

  Future<void> _onJobsViewUserProfileRequested(
    JobsViewUserProfileRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _viewUserProfileUseCase(event.viewUserProfileParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (user) => emit(JobsViewUserProfileSuccess(user: user)),
    );
  }

  Future<void> _onJobsBlockUserRequested(
    JobsBlockUserRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _blockUserUseCase(event.blockUserParams);
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (_) => emit(
        const JobsBlockUserSuccess(message: 'User blocked successfully'),
      ),
    );
  }
}
