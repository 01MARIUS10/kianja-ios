part of 'saved_job_applicants_list_bloc.dart';

@freezed
class SavedJobApplicantsListEvent with _$SavedJobApplicantsListEvent {
  const factory SavedJobApplicantsListEvent.started() = _Started;
}

class SavedJobApplicantsListLoaded implements SavedJobApplicantsListEvent {
  const SavedJobApplicantsListLoaded({required this.queryPageParams});
  final QueryPageParams queryPageParams;
}

class SavedJobApplicantsListLoadMore implements SavedJobApplicantsListEvent {
  const SavedJobApplicantsListLoadMore();
}
