part of 'saved_hots_list_bloc.dart';

@freezed
class SavedHotsListEvent with _$SavedHotsListEvent {
  const factory SavedHotsListEvent.started() = _Started;
}

class SavedHotsListLoaded implements SavedHotsListEvent {
  const SavedHotsListLoaded({required this.queryPageParams});
  final QueryPageParams queryPageParams;
}

class SavedHotsListLoadMore implements SavedHotsListEvent {
  const SavedHotsListLoadMore();
}
