part of 'saved_training_centers_list_bloc.dart';

@freezed
class SavedTrainingCentersListState with _$SavedTrainingCentersListState {
  const factory SavedTrainingCentersListState.initial() = _Initial;
}

class SavedTrainingCentersListLoadInProgress
    implements SavedTrainingCentersListState {}

class SavedTrainingCentersListLoadSuccess
    implements SavedTrainingCentersListState {
  const SavedTrainingCentersListLoadSuccess({
    required this.trainingCenters,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<TrainingCenter> trainingCenters;
  final bool hasMore;
  final bool isLoadMore;
}

class SavedTrainingCentersListLoadFailure
    implements SavedTrainingCentersListState {
  const SavedTrainingCentersListLoadFailure({required this.error});
  final String error;
}
