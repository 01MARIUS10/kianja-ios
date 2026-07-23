import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_training_centers_usecase.dart';

part 'saved_training_centers_list_event.dart';
part 'saved_training_centers_list_state.dart';
part 'saved_training_centers_list_bloc.freezed.dart';

class SavedTrainingCentersListBloc
    extends Bloc<SavedTrainingCentersListEvent, SavedTrainingCentersListState> {
  SavedTrainingCentersListBloc({required this._getAllSavedTrainingCentersUseCase})
    : super(const _Initial()) {
    on<SavedTrainingCentersListLoaded>(_onSavedTrainingCentersListLoaded);
    on<SavedTrainingCentersListLoadMore>(_onSavedTrainingCentersListLoadMore);
  }
  final GetAllSavedTrainingCentersUseCase _getAllSavedTrainingCentersUseCase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  List<TrainingCenter> _cachedTrainingCenters = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;

  Future<void> _onSavedTrainingCentersListLoaded(
    SavedTrainingCentersListLoaded event,
    Emitter<SavedTrainingCentersListState> emit,
  ) async {
    _currentPage = event.queryPageParams.page;
    _cachedTrainingCenters = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(SavedTrainingCentersListLoadInProgress());
    final result = await _getAllSavedTrainingCentersUseCase(
      event.queryPageParams,
    );
    result.fold(
      (failure) => emit(
        SavedTrainingCentersListLoadFailure(error: failure.message),
      ),
      (trainingCenters) {
        _cachedTrainingCenters = trainingCenters;
        _hasMore = trainingCenters.length >= _pageSize;
        emit(
          SavedTrainingCentersListLoadSuccess(
            trainingCenters: _cachedTrainingCenters,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onSavedTrainingCentersListLoadMore(
    SavedTrainingCentersListLoadMore event,
    Emitter<SavedTrainingCentersListState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      SavedTrainingCentersListLoadSuccess(
        trainingCenters: _cachedTrainingCenters,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentPage++;
    final result = await _getAllSavedTrainingCentersUseCase(
      QueryPageParams(page: _currentPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(SavedTrainingCentersListLoadFailure(error: failure.message));
      },
      (trainingCenters) {
        _cachedTrainingCenters = [..._cachedTrainingCenters, ...trainingCenters];
        _hasMore = trainingCenters.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          SavedTrainingCentersListLoadSuccess(
            trainingCenters: _cachedTrainingCenters,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }
}
