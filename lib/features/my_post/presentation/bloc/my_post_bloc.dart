import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_expert_executive/delete_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_expert_executive/delete_expert_executive_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_hot_event/delete_hot_event_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_events_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_hots_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_job_applicants_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_job_offers_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_training_centers_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidate_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidates/get_candidates_params.dart';
import 'package:kianja/features/my_post/domain/usecases/get_candidates/get_candidates_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/prolonger/prolonger_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/prolonger/prolonger_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_usecase.dart';

part 'my_post_event.dart';
part 'my_post_state.dart';

class MyPostBloc extends Bloc<MyPostEvent, MyPostState> {
  MyPostBloc({
    // UPDATE USECASE ---------------------------------------------------------
    required this._updateJobOfferUseCase,
    required this._updateJobApplicantUseCase,
    required this._updateTrainingCenterUseCase,
    required this._updateExpertExecutiveUseCase,
    required this._updateHotEventUseCase,
    // --------------------------------------------------------- UPDATE USECASE

    // DELETE USECASE ---------------------------------------------------------
    required this._deleteJobOfferUseCase,
    required this._deleteJobApplicantUseCase,
    required this._deleteTrainingCenterUseCase,
    required this._deleteExpertExecutiveUseCase,
    required this._deleteHotEventUseCase,
    // --------------------------------------------------------- DELETE USECASE

    // GET ALL USECASE ---------------------------------------------------------
    required this._getAllJobOffersUseCase,
    required this._getAllJobApplicantsUseCase,
    required this._getAllTrainingCentersUseCase,
    required this._getAllHotsUseCase,
    required this._getAllEventsUseCase,
    // --------------------------------------------------------- GET ALL USECASE

    // GET CANDIDATES USECASE --------------------------------------------------
    required this._getCandidatesUseCase,
    required this._getCandidateUseCase,
    required this._prolongerJobApplicantUseCase,
    // -------------------------------------------------- GET CANDIDATES USECASE
  }) : // UPDATE USECASE ------------------------------------------------------
       super(MyPostInitial()) {
    // UPDATE EVENT HANDLER -------------------------------------------------
    on<MyPostUpdateJobOfferRequested>(_onUpdateJobOfferRequested);
    on<MyPostUpdateJobApplicantRequested>(_onUpdateJobApplicantRequested);
    on<MyPostUpdateTrainingCenterRequested>(_onUpdateTrainingCenterRequested);
    on<MyPostUpdateExpertExecutiveRequested>(_onUpdateExpertExecutiveRequested);
    on<MyPostUpdateHotEventRequested>(_onUpdateHotEventRequested);
    // -------------------------------------------------- UPDATE EVENT HANDLER

    // DELETE EVENT HANDLER ---------------------------------------------------
    on<MyPostDeleteJobOfferRequested>(_onDeleteJobOfferRequested);
    on<MyPostDeleteJobApplicantRequested>(_onDeleteJobApplicantRequested);
    on<MyPostDeleteTrainingCenterRequested>(_onDeleteTrainingCenterRequested);
    on<MyPostDeleteExpertExecutiveRequested>(_onDeleteExpertExecutiveRequested);
    on<MyPostDeleteHotEventRequested>(_onDeleteHotEventRequested);
    // --------------------------------------------------- DELETE EVENT HANDLER

    // GET ALL EVENT HANDLER ---------------------------------------------------
    on<MyPostGetAllJobOffersRequested>(_onGetAllJobOffersRequested);
    on<MyPostGetAllJobApplicantsRequested>(_onGetAllJobApplicantsRequested);
    on<MyPostGetAllTrainingCentersRequested>(_onGetAllTrainingCentersRequested);
    on<MyPostGetAllHotsRequested>(_onGetAllHotsRequested);
    on<MyPostGetAllEventsRequested>(_onGetAllEventsRequested);
    on<MyPostGetAllCandidatesRequested>(_onGetAllCandidatesRequested);
    // --------------------------------------------------- GET ALL EVENT HANDLER

    // LOAD MORE ITEM EVENT HANDLER --------------------------------------------
    on<MyPostLoadMoreJobOffersRequested>(_onLoadMoreJobOffersRequested);
    on<MyPostLoadMoreJobApplicantsRequested>(_onLoadMoreJobApplicantsRequested);
    on<MyPostLoadMoreTrainingCentersRequested>(
      _onLoadMoreTrainingCentersRequested,
    );
    on<MyPostLoadMoreHotsRequested>(_onLoadMoreHotsRequested);
    on<MyPostLoadMoreEventsRequested>(_onLoadMoreEventsRequested);
    on<MyPostLoadMoreCandidatesRequested>(_onLoadMoreCandidatesRequested);
    // -------------------------------------------- LOAD MORE ITEM EVENT HANDLER

    on<MyPostGetCandidateRequested>(_onGetCandidateRequested);
    on<MyPostProlongerJobApplicantRequested>(_onProlongerJobApplicantRequested);
  }

  // UPDATE USECASE -----------------------------------------------------------
  final UpdateJobOfferUseCase _updateJobOfferUseCase;
  final UpdateJobApplicantUseCase _updateJobApplicantUseCase;
  final UpdateTrainingCenterUseCase _updateTrainingCenterUseCase;
  final UpdateExpertExecutiveUseCase _updateExpertExecutiveUseCase;
  final UpdateHotEventUseCase _updateHotEventUseCase;
  // ----------------------------------------------------------- UPDATE USECASE

  // DELETE USECASE -----------------------------------------------------------
  final DeleteJobOfferUseCase _deleteJobOfferUseCase;
  final DeleteJobApplicantUseCase _deleteJobApplicantUseCase;
  final DeleteTrainingCenterUseCase _deleteTrainingCenterUseCase;
  final DeleteExpertExecutiveUseCase _deleteExpertExecutiveUseCase;
  final DeleteHotEventUseCase _deleteHotEventUseCase;
  // ----------------------------------------------------------- DELETE USECASE

  // GET ALL USECASE -----------------------------------------------------------
  final GetAllJobOffersUseCase _getAllJobOffersUseCase;
  final GetAllJobApplicantsUseCase _getAllJobApplicantsUseCase;
  final GetAllTrainingCentersUseCase _getAllTrainingCentersUseCase;
  final GetAllHotsUseCase _getAllHotsUseCase;
  final GetAllEventsUseCase _getAllEventsUseCase;
  // ----------------------------------------------------------- GET ALL USECASE

  // GET CANDIDATES USECASE ----------------------------------------------------
  final GetCandidatesUseCase _getCandidatesUseCase;
  final GetCandidateUseCase _getCandidateUseCase;
  final ProlongerJobApplicantUseCase _prolongerJobApplicantUseCase;
  // ---------------------------------------------------- GET CANDIDATES USECASE

  // PAGINATION STATE ----------------------------------------------------------
  static const int _pageSize = 15;
  int _currentJobPage = 1;
  List<JobOffer> _cachedJobOffers = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;
  // ---------------------------------------------------------- PAGINATION STATE

  int _currentApplicantsPage = 1;
  List<JobApplicant> _cachedJobApplicants = [];
  bool _hasMoreApplicants = true;
  bool _isLoadMoreApplicantsInProgress = false;
  // ---------------------------------------------------------- PAGINATION STATE

  int _currentTrainingCentersPage = 1;
  List<TrainingCenter> _cachedTrainingCenters = [];
  bool _hasMoreTrainingCenters = true;
  bool _isLoadMoreTrainingCentersInProgress = false;
  // ---------------------------------------------------------- PAGINATION STATE

  int _currentHotsPage = 1;
  List<HotEvent> _cachedHots = [];
  bool _hasMoreHots = true;
  bool _isLoadMoreHotsInProgress = false;
  // ---------------------------------------------------------- PAGINATION STATE

  int _currentEventsPage = 1;
  List<HotEvent> _cachedEvents = [];
  bool _hasMoreEvents = true;
  bool _isLoadMoreEventsInProgress = false;
  // ---------------------------------------------------------- PAGINATION STATE

  int _currentUsersPage = 1;
  List<User> _cachedUsers = [];
  bool _hasMoreUsers = true;
  bool _isLoadMoreUsersInProgress = false;
  // ---------------------------------------------------------- PAGINATION STATE

  Future<void> _onProlongerJobApplicantRequested(
    MyPostProlongerJobApplicantRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _prolongerJobApplicantUseCase(
      event.prolongerJobApplicantParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobApplicant) =>
          emit(MyPostProlongerJobApplicantSuccess(jobApplicant: jobApplicant)),
    );
  }

  // UPDATE EVENT HANDLER ---------------------------------------------------
  Future<void> _onUpdateJobOfferRequested(
    MyPostUpdateJobOfferRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateJobOfferUseCase(event.updateJobOfferParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobOffer) => emit(MyPostUpdateJobOfferSuccess(jobOffer: jobOffer)),
    );
  }

  Future<void> _onUpdateJobApplicantRequested(
    MyPostUpdateJobApplicantRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateJobApplicantUseCase(
      event.updateJobApplicantParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobApplicant) =>
          emit(MyPostUpdateJobApplicantSuccess(jobApplicant: jobApplicant)),
    );
  }

  Future<void> _onUpdateTrainingCenterRequested(
    MyPostUpdateTrainingCenterRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateTrainingCenterUseCase(
      event.updateTrainingCenterParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (trainingCenter) => emit(
        MyPostUpdateTrainingCenterSuccess(trainingCenter: trainingCenter),
      ),
    );
  }

  Future<void> _onUpdateExpertExecutiveRequested(
    MyPostUpdateExpertExecutiveRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateExpertExecutiveUseCase(
      event.updateExpertExecutiveParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (expertExecutive) => emit(
        MyPostUpdateExpertExecutiveSuccess(expertExecutive: expertExecutive),
      ),
    );
  }

  Future<void> _onUpdateHotEventRequested(
    MyPostUpdateHotEventRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateHotEventUseCase(event.updateHotEventParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (hotEvent) => emit(MyPostUpdateHotEventSuccess(hotEvent: hotEvent)),
    );
  }

  // --------------------------------------------------- UPDATE EVENT HANDLER
  //
  //
  //
  //
  //
  //
  // DELETE EVENT HANDLER ---------------------------------------------------
  Future<void> _onDeleteJobOfferRequested(
    MyPostDeleteJobOfferRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteJobOfferUseCase(event.deleteJobOfferParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(
        MyPostDeleteJobOfferSuccess(
          deletedJobOfferId: event.deleteJobOfferParams.id,
        ),
      ),
    );
  }

  Future<void> _onDeleteJobApplicantRequested(
    MyPostDeleteJobApplicantRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteJobApplicantUseCase(
      event.deleteJobApplicantParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(
        MyPostDeleteJobApplicantSuccess(
          deletedJobApplicantId: event.deleteJobApplicantParams.id,
        ),
      ),
    );
  }

  Future<void> _onDeleteTrainingCenterRequested(
    MyPostDeleteTrainingCenterRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteTrainingCenterUseCase(
      event.deleteTrainingCenterParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(
        MyPostDeleteTrainingCenterSuccess(
          deletedTrainingCenterId: event.deleteTrainingCenterParams.id,
        ),
      ),
    );
  }

  Future<void> _onDeleteExpertExecutiveRequested(
    MyPostDeleteExpertExecutiveRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteExpertExecutiveUseCase(
      event.deleteExpertExecutiveParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(MyPostDeleteExpertExecutiveSuccess()),
    );
  }

  Future<void> _onDeleteHotEventRequested(
    MyPostDeleteHotEventRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteHotEventUseCase(event.deleteHotEventParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(
        MyPostDeleteHotEventSuccess(
          deletedHotEventId: event.deleteHotEventParams.id,
        ),
      ),
    );
  }

  // --------------------------------------------------- DELETE EVENT HANDLER
  //
  //
  //
  //
  //
  //
  //
  // GET ALL EVENT HANDLER ---------------------------------------------------
  Future<void> _onGetAllJobOffersRequested(
    MyPostGetAllJobOffersRequested event,
    Emitter<MyPostState> emit,
  ) async {
    // Reset pagination for a fresh load
    _currentJobPage = event.queryPageParams.page;
    _cachedJobOffers = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(MyPostRequestInProgress());
    final result = await _getAllJobOffersUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobOffers) {
        _cachedJobOffers = jobOffers;
        _hasMore = jobOffers.length >= _pageSize;
        emit(
          MyPostGetAllJobOffersSuccess(
            jobOffers: _cachedJobOffers,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  // --------------------------------------------------- GET ALL EVENT HANDLER
  //
  //
  //
  //
  //
  //
  //
  // LOAD MORE ITEM EVENT HANDLER --------------------------------------------
  Future<void> _onLoadMoreJobOffersRequested(
    MyPostLoadMoreJobOffersRequested event,
    Emitter<MyPostState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      MyPostGetAllJobOffersSuccess(
        jobOffers: _cachedJobOffers,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentJobPage++;
    final result = await _getAllJobOffersUseCase(
      QueryPageParams(page: _currentJobPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(MyPostRequestFailure(message: failure.message));
      },
      (jobOffers) {
        _cachedJobOffers = [..._cachedJobOffers, ...jobOffers];
        _hasMore = jobOffers.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          MyPostGetAllJobOffersSuccess(
            jobOffers: _cachedJobOffers,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  // --------------------------------------------------- GET ALL JOB APPLICANTS
  Future<void> _onGetAllJobApplicantsRequested(
    MyPostGetAllJobApplicantsRequested event,
    Emitter<MyPostState> emit,
  ) async {
    _currentApplicantsPage = event.queryPageParams.page;
    _cachedJobApplicants = [];
    _hasMoreApplicants = true;
    _isLoadMoreApplicantsInProgress = false;

    emit(MyPostRequestInProgress());
    final result = await _getAllJobApplicantsUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobApplicants) {
        _cachedJobApplicants = jobApplicants;
        _hasMoreApplicants = jobApplicants.length >= _pageSize;
        emit(
          MyPostGetAllJobApplicantsSuccess(
            jobApplicants: _cachedJobApplicants,
            hasMore: _hasMoreApplicants,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreJobApplicantsRequested(
    MyPostLoadMoreJobApplicantsRequested event,
    Emitter<MyPostState> emit,
  ) async {
    if (!_hasMoreApplicants || _isLoadMoreApplicantsInProgress) {
      return;
    }

    _isLoadMoreApplicantsInProgress = true;
    emit(
      MyPostGetAllJobApplicantsSuccess(
        jobApplicants: _cachedJobApplicants,
        hasMore: _hasMoreApplicants,
        isLoadMore: true,
      ),
    );

    _currentApplicantsPage++;
    final result = await _getAllJobApplicantsUseCase(
      QueryPageParams(page: _currentApplicantsPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreApplicantsInProgress = false;
        emit(MyPostRequestFailure(message: failure.message));
      },
      (jobApplicants) {
        _cachedJobApplicants = [..._cachedJobApplicants, ...jobApplicants];
        _hasMoreApplicants = jobApplicants.length >= _pageSize;
        _isLoadMoreApplicantsInProgress = false;
        emit(
          MyPostGetAllJobApplicantsSuccess(
            jobApplicants: _cachedJobApplicants,
            hasMore: _hasMoreApplicants,
          ),
        );
      },
    );
  }

  // --------------------------------------------------- GET ALL TRAINING CENTERS
  Future<void> _onGetAllTrainingCentersRequested(
    MyPostGetAllTrainingCentersRequested event,
    Emitter<MyPostState> emit,
  ) async {
    _currentTrainingCentersPage = event.queryPageParams.page;
    _cachedTrainingCenters = [];
    _hasMoreTrainingCenters = true;
    _isLoadMoreTrainingCentersInProgress = false;

    emit(MyPostRequestInProgress());
    final result = await _getAllTrainingCentersUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (trainingCenters) {
        _cachedTrainingCenters = trainingCenters;
        _hasMoreTrainingCenters = trainingCenters.length >= _pageSize;
        emit(
          MyPostGetAllTrainingCentersSuccess(
            trainingCenters: _cachedTrainingCenters,
            hasMore: _hasMoreTrainingCenters,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreTrainingCentersRequested(
    MyPostLoadMoreTrainingCentersRequested event,
    Emitter<MyPostState> emit,
  ) async {
    if (!_hasMoreTrainingCenters || _isLoadMoreTrainingCentersInProgress) {
      return;
    }

    _isLoadMoreTrainingCentersInProgress = true;
    emit(
      MyPostGetAllTrainingCentersSuccess(
        trainingCenters: _cachedTrainingCenters,
        hasMore: _hasMoreTrainingCenters,
        isLoadMore: true,
      ),
    );

    _currentTrainingCentersPage++;
    final result = await _getAllTrainingCentersUseCase(
      QueryPageParams(page: _currentTrainingCentersPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreTrainingCentersInProgress = false;
        emit(MyPostRequestFailure(message: failure.message));
      },
      (trainingCenters) {
        _cachedTrainingCenters = [
          ..._cachedTrainingCenters,
          ...trainingCenters,
        ];
        _hasMoreTrainingCenters = trainingCenters.length >= _pageSize;
        _isLoadMoreTrainingCentersInProgress = false;
        emit(
          MyPostGetAllTrainingCentersSuccess(
            trainingCenters: _cachedTrainingCenters,
            hasMore: _hasMoreTrainingCenters,
          ),
        );
      },
    );
  }

  // --------------------------------------------------- GET ALL HOTS
  Future<void> _onGetAllHotsRequested(
    MyPostGetAllHotsRequested event,
    Emitter<MyPostState> emit,
  ) async {
    _currentHotsPage = event.queryPageParams.page;
    _cachedHots = [];
    _hasMoreHots = true;
    _isLoadMoreHotsInProgress = false;

    emit(MyPostRequestInProgress());
    final result = await _getAllHotsUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (hots) {
        _cachedHots = hots;
        _hasMoreHots = hots.length >= _pageSize;
        emit(MyPostGetAllHotsSuccess(hots: _cachedHots, hasMore: _hasMoreHots));
      },
    );
  }

  Future<void> _onLoadMoreHotsRequested(
    MyPostLoadMoreHotsRequested event,
    Emitter<MyPostState> emit,
  ) async {
    if (!_hasMoreHots || _isLoadMoreHotsInProgress) {
      return;
    }

    _isLoadMoreHotsInProgress = true;
    emit(
      MyPostGetAllHotsSuccess(
        hots: _cachedHots,
        hasMore: _hasMoreHots,
        isLoadMore: true,
      ),
    );

    _currentHotsPage++;
    final result = await _getAllHotsUseCase(
      QueryPageParams(page: _currentHotsPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreHotsInProgress = false;
        emit(MyPostRequestFailure(message: failure.message));
      },
      (hots) {
        _cachedHots = [..._cachedHots, ...hots];
        _hasMoreHots = hots.length >= _pageSize;
        _isLoadMoreHotsInProgress = false;
        emit(MyPostGetAllHotsSuccess(hots: _cachedHots, hasMore: _hasMoreHots));
      },
    );
  }

  // --------------------------------------------------- GET ALL EVENTS
  Future<void> _onGetAllEventsRequested(
    MyPostGetAllEventsRequested event,
    Emitter<MyPostState> emit,
  ) async {
    _currentEventsPage = event.queryPageParams.page;
    _cachedEvents = [];
    _hasMoreEvents = true;
    _isLoadMoreEventsInProgress = false;

    emit(MyPostRequestInProgress());
    final result = await _getAllEventsUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (events) {
        _cachedEvents = events;
        _hasMoreEvents = events.length >= _pageSize;
        emit(
          MyPostGetAllEventsSuccess(
            events: _cachedEvents,
            hasMore: _hasMoreEvents,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreEventsRequested(
    MyPostLoadMoreEventsRequested event,
    Emitter<MyPostState> emit,
  ) async {
    if (!_hasMoreEvents || _isLoadMoreEventsInProgress) {
      return;
    }

    _isLoadMoreEventsInProgress = true;
    emit(
      MyPostGetAllEventsSuccess(
        events: _cachedEvents,
        hasMore: _hasMoreEvents,
        isLoadMore: true,
      ),
    );

    _currentEventsPage++;
    final result = await _getAllEventsUseCase(
      QueryPageParams(page: _currentEventsPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreEventsInProgress = false;
        emit(MyPostRequestFailure(message: failure.message));
      },
      (events) {
        _cachedEvents = [..._cachedEvents, ...events];
        _hasMoreEvents = events.length >= _pageSize;
        _isLoadMoreEventsInProgress = false;
        emit(
          MyPostGetAllEventsSuccess(
            events: _cachedEvents,
            hasMore: _hasMoreEvents,
          ),
        );
      },
    );
  }

  // ----------------------------------------------- GET ALL CANDIDATES
  Future<void> _onGetCandidateRequested(
    MyPostGetCandidateRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _getCandidateUseCase(event.getCandidateParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (user) {
        emit(MyPostGetCandidateSuccess(user: user));
      },
    );
  }

  Future<void> _onGetAllCandidatesRequested(
    MyPostGetAllCandidatesRequested event,
    Emitter<MyPostState> emit,
  ) async {
    _currentUsersPage = event.getCandidatesParams.page;
    _cachedUsers = [];
    _hasMoreUsers = true;
    _isLoadMoreUsersInProgress = false;

    emit(MyPostRequestInProgress());
    final result = await _getCandidatesUseCase(event.getCandidatesParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (users) {
        _cachedUsers = users;
        _hasMoreUsers = users.length >= _pageSize;
        emit(
          MyPostGetCandidatesSuccess(
            users: _cachedUsers,
            hasMore: _hasMoreUsers,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMoreCandidatesRequested(
    MyPostLoadMoreCandidatesRequested event,
    Emitter<MyPostState> emit,
  ) async {
    if (!_hasMoreUsers || _isLoadMoreUsersInProgress) {
      return;
    }

    _isLoadMoreUsersInProgress = true;
    emit(
      MyPostGetCandidatesSuccess(
        users: _cachedUsers,
        hasMore: _hasMoreUsers,
        isLoadMore: true,
      ),
    );

    _currentUsersPage++;
    final result = await _getCandidatesUseCase(
      GetCandidatesParams(
        jobId: event
            .getCandidatesParams
            .jobId, // You might want to pass the actual jobId here
        page: _currentUsersPage,
      ),
    );
    result.fold(
      (failure) {
        _isLoadMoreUsersInProgress = false;
        emit(MyPostRequestFailure(message: failure.message));
      },
      (users) {
        _cachedUsers = [..._cachedUsers, ...users];
        _hasMoreUsers = users.length >= _pageSize;
        _isLoadMoreUsersInProgress = false;
        emit(
          MyPostGetCandidatesSuccess(
            users: _cachedUsers,
            hasMore: _hasMoreUsers,
          ),
        );
      },
    );
  }

  // -------------------------------------------- LOAD MORE ITEM EVENT HANDLER
}
