part of 'saved_events_list_bloc.dart';

@freezed
class SavedEventsListState with _$SavedEventsListState {
  const factory SavedEventsListState.initial() = _Initial;
}

class SavedEventsListLoadInProgress implements SavedEventsListState {}

class SavedEventsListLoadSuccess implements SavedEventsListState {
  const SavedEventsListLoadSuccess({
    required this.events,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<HotEvent> events;
  final bool hasMore;
  final bool isLoadMore;
}

class SavedEventsListLoadFailure implements SavedEventsListState {
  const SavedEventsListLoadFailure({required this.error});
  final String error;
}
