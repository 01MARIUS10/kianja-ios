part of 'saved_events_list_bloc.dart';

@freezed
class SavedEventsListEvent with _$SavedEventsListEvent {
  const factory SavedEventsListEvent.started() = _Started;
}

class SavedEventsListLoaded implements SavedEventsListEvent {
  const SavedEventsListLoaded({required this.queryPageParams});
  final QueryPageParams queryPageParams;
}

class SavedEventsListLoadMore implements SavedEventsListEvent {
  const SavedEventsListLoadMore();
}
