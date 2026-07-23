import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_events_usecase.dart';

part 'saved_events_list_event.dart';
part 'saved_events_list_state.dart';
part 'saved_events_list_bloc.freezed.dart';

class SavedEventsListBloc
    extends Bloc<SavedEventsListEvent, SavedEventsListState> {
  SavedEventsListBloc({required this._getAllSavedEventsUseCase})
    : super(const _Initial()) {
    on<SavedEventsListLoaded>(_onSavedEventsListLoaded);
    on<SavedEventsListLoadMore>(_onSavedEventsListLoadMore);
  }
  final GetAllSavedEventsUseCase _getAllSavedEventsUseCase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  List<HotEvent> _cachedEvents = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;

  Future<void> _onSavedEventsListLoaded(
    SavedEventsListLoaded event,
    Emitter<SavedEventsListState> emit,
  ) async {
    _currentPage = event.queryPageParams.page;
    _cachedEvents = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(SavedEventsListLoadInProgress());
    final result = await _getAllSavedEventsUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(SavedEventsListLoadFailure(error: failure.message)),
      (events) {
        _cachedEvents = events;
        _hasMore = events.length >= _pageSize;
        emit(
          SavedEventsListLoadSuccess(
            events: _cachedEvents,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onSavedEventsListLoadMore(
    SavedEventsListLoadMore event,
    Emitter<SavedEventsListState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      SavedEventsListLoadSuccess(
        events: _cachedEvents,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentPage++;
    final result = await _getAllSavedEventsUseCase(
      QueryPageParams(page: _currentPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(SavedEventsListLoadFailure(error: failure.message));
      },
      (events) {
        _cachedEvents = [..._cachedEvents, ...events];
        _hasMore = events.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          SavedEventsListLoadSuccess(
            events: _cachedEvents,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }
}
