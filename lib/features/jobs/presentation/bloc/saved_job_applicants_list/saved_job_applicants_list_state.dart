part of 'saved_job_applicants_list_bloc.dart';

@freezed
class SavedJobApplicantsListState with _$SavedJobApplicantsListState {
  const factory SavedJobApplicantsListState.initial() = _Initial;
}

class SavedJobApplicantsListLoadInProgress
    implements SavedJobApplicantsListState {}

class SavedJobApplicantsListLoadSuccess implements SavedJobApplicantsListState {
  const SavedJobApplicantsListLoadSuccess({
    required this.jobApplicants,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<JobApplicant> jobApplicants;
  final bool hasMore;
  final bool isLoadMore;
}

class SavedJobApplicantsListLoadFailure implements SavedJobApplicantsListState {
  const SavedJobApplicantsListLoadFailure({required this.error});
  final String error;
}
