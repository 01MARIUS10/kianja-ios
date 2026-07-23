import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_hots_usecase.dart';

part 'saved_hots_list_event.dart';
part 'saved_hots_list_state.dart';
part 'saved_hots_list_bloc.freezed.dart';

class SavedHotsListBloc extends Bloc<SavedHotsListEvent, SavedHotsListState> {
  SavedHotsListBloc({required this._getAllSavedHotsUseCase})
    : super(const _Initial()) {
    on<SavedHotsListLoaded>(_onSavedHotsListLoaded);
    on<SavedHotsListLoadMore>(_onSavedHotsListLoadMore);
  }
  final GetAllSavedHotsUseCase _getAllSavedHotsUseCase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  List<HotEvent> _cachedHots = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;

  Future<void> _onSavedHotsListLoaded(
    SavedHotsListLoaded event,
    Emitter<SavedHotsListState> emit,
  ) async {
    _currentPage = event.queryPageParams.page;
    _cachedHots = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(SavedHotsListLoadInProgress());
    final result = await _getAllSavedHotsUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(SavedHotsListLoadFailure(error: failure.message)),
      (hots) {
        _cachedHots = hots;
        _hasMore = hots.length >= _pageSize;
        emit(
          SavedHotsListLoadSuccess(
            hots: _cachedHots,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onSavedHotsListLoadMore(
    SavedHotsListLoadMore event,
    Emitter<SavedHotsListState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      SavedHotsListLoadSuccess(
        hots: _cachedHots,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentPage++;
    final result = await _getAllSavedHotsUseCase(
      QueryPageParams(page: _currentPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(SavedHotsListLoadFailure(error: failure.message));
      },
      (hots) {
        _cachedHots = [..._cachedHots, ...hots];
        _hasMore = hots.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          SavedHotsListLoadSuccess(
            hots: _cachedHots,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }
}
