import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applications_usecase.dart';

part 'job_applications_event.dart';
part 'job_applications_state.dart';
part 'job_applications_bloc.freezed.dart';

class JobApplicationsBloc
    extends Bloc<JobApplicationsEvent, JobApplicationsState> {
  JobApplicationsBloc({required this._getJobApplicationsUseCase})
    : super(const _Initial()) {
    on<JobApplicationsJobOffersLoaded>(_onJobApplicationsJobOffersLoaded);
    on<JobApplicationsLoadMoreJobOffers>(_onJobApplicationsLoadMoreJobOffers);
  }
  final GetJobApplicationsUseCase _getJobApplicationsUseCase;

  static const int _pageSize = 15;
  int _currentJobPage = 1;
  List<JobOffer> _cachedJobOffers = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;

  Future<void> _onJobApplicationsJobOffersLoaded(
    JobApplicationsJobOffersLoaded event,
    Emitter<JobApplicationsState> emit,
  ) async {
    // Reset pagination for a fresh load
    _currentJobPage = event.queryPageParams.page;
    _cachedJobOffers = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(JobApplicationsLoadJobOffersInProgress());
    final result = await _getJobApplicationsUseCase(event.queryPageParams);
    result.fold(
      (failure) =>
          emit(JobApplicationsLoadJobOffersFailure(error: failure.message)),
      (jobOffers) {
        _cachedJobOffers = jobOffers;
        _hasMore = jobOffers.length >= _pageSize;
        emit(
          JobApplicationsLoadJobOffersSuccess(
            jobOffers: _cachedJobOffers,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onJobApplicationsLoadMoreJobOffers(
    JobApplicationsLoadMoreJobOffers event,
    Emitter<JobApplicationsState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      JobApplicationsLoadJobOffersSuccess(
        jobOffers: _cachedJobOffers,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentJobPage++;
    final result = await _getJobApplicationsUseCase(
      QueryPageParams(page: _currentJobPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(JobApplicationsLoadJobOffersFailure(error: failure.message));
      },
      (jobOffers) {
        _cachedJobOffers = [..._cachedJobOffers, ...jobOffers];
        _hasMore = jobOffers.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          JobApplicationsLoadJobOffersSuccess(
            jobOffers: _cachedJobOffers,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }
}
