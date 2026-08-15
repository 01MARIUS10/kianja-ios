part of 'saved_hots_list_bloc.dart';

@freezed
class SavedHotsListState with _$SavedHotsListState {
  const factory SavedHotsListState.initial() = _Initial;
}

class SavedHotsListLoadInProgress implements SavedHotsListState {}

class SavedHotsListLoadSuccess implements SavedHotsListState {
  const SavedHotsListLoadSuccess({
    required this.hots,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<HotEvent> hots;
  final bool hasMore;
  final bool isLoadMore;
}

class SavedHotsListLoadFailure implements SavedHotsListState {
  const SavedHotsListLoadFailure({required this.error});
  final String error;
}
