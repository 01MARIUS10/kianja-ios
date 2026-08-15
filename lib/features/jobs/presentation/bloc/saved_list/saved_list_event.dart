part of 'saved_list_bloc.dart';

@freezed
class SavedListEvent with _$SavedListEvent {
  const factory SavedListEvent.started() = _Started;
}

class SavedListJobOffersLoaded implements SavedListEvent {
  const SavedListJobOffersLoaded({required this.queryPageParams});
  final QueryPageParams queryPageParams;
}

class SavedListLoadMoreJobOffers implements SavedListEvent {
  const SavedListLoadMoreJobOffers();
}
