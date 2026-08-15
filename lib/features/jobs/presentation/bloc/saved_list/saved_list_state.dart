part of 'saved_list_bloc.dart';

@freezed
class SavedListState with _$SavedListState {
  const factory SavedListState.initial() = _Initial;
}

class SavedListLoadJobOffersInProgress implements SavedListState {}

class SavedListLoadJobOffersSuccess implements SavedListState {
  const SavedListLoadJobOffersSuccess({
    required this.jobOffers,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<JobOffer> jobOffers;
  final bool hasMore;
  final bool isLoadMore;
}

class SavedListLoadJobOffersFailure implements SavedListState {
  const SavedListLoadJobOffersFailure({required this.error});
  final String error;
}
