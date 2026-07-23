import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_job_offers_usecase.dart';

part 'saved_list_event.dart';
part 'saved_list_state.dart';
part 'saved_list_bloc.freezed.dart';

class SavedListBloc extends Bloc<SavedListEvent, SavedListState> {
  SavedListBloc({required this._getAllSavedJobOffersUseCase})
    : super(const _Initial()) {
    on<SavedListJobOffersLoaded>(_onSavedListJobOffersLoaded);
    on<SavedListLoadMoreJobOffers>(_onSavedListLoadMoreJobOffers);
  }
  final GetAllSavedJobOffersUseCase _getAllSavedJobOffersUseCase;

  static const int _pageSize = 15;
  int _currentJobPage = 1;
  List<JobOffer> _cachedJobOffers = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;

  Future<void> _onSavedListJobOffersLoaded(
    SavedListJobOffersLoaded event,
    Emitter<SavedListState> emit,
  ) async {
    // Reset pagination for a fresh load
    _currentJobPage = event.queryPageParams.page;
    _cachedJobOffers = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(SavedListLoadJobOffersInProgress());
    final result = await _getAllSavedJobOffersUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(SavedListLoadJobOffersFailure(error: failure.message)),
      (jobOffers) {
        _cachedJobOffers = jobOffers;
        _hasMore = jobOffers.length >= _pageSize;
        emit(
          SavedListLoadJobOffersSuccess(
            jobOffers: _cachedJobOffers,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onSavedListLoadMoreJobOffers(
    SavedListLoadMoreJobOffers event,
    Emitter<SavedListState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      SavedListLoadJobOffersSuccess(
        jobOffers: _cachedJobOffers,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentJobPage++;
    final result = await _getAllSavedJobOffersUseCase(
      QueryPageParams(page: _currentJobPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(SavedListLoadJobOffersFailure(error: failure.message));
      },
      (jobOffers) {
        _cachedJobOffers = [..._cachedJobOffers, ...jobOffers];
        _hasMore = jobOffers.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          SavedListLoadJobOffersSuccess(
            jobOffers: _cachedJobOffers,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }
}
