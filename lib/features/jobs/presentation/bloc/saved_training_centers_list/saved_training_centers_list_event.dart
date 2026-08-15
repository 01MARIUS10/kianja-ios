part of 'saved_training_centers_list_bloc.dart';

@freezed
class SavedTrainingCentersListEvent with _$SavedTrainingCentersListEvent {
  const factory SavedTrainingCentersListEvent.started() = _Started;
}

class SavedTrainingCentersListLoaded implements SavedTrainingCentersListEvent {
  const SavedTrainingCentersListLoaded({required this.queryPageParams});
  final QueryPageParams queryPageParams;
}

class SavedTrainingCentersListLoadMore
    implements SavedTrainingCentersListEvent {
  const SavedTrainingCentersListLoadMore();
}
