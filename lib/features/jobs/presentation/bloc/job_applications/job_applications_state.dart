part of 'job_applications_bloc.dart';

@freezed
class JobApplicationsState with _$JobApplicationsState {
  const factory JobApplicationsState.initial() = _Initial;
}

class JobApplicationsLoadJobOffersInProgress implements JobApplicationsState {}

class JobApplicationsLoadJobOffersSuccess implements JobApplicationsState {
  const JobApplicationsLoadJobOffersSuccess({
    required this.jobOffers,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<JobOffer> jobOffers;
  final bool hasMore;
  final bool isLoadMore;
}

class JobApplicationsLoadJobOffersFailure implements JobApplicationsState {
  const JobApplicationsLoadJobOffersFailure({required this.error});
  final String error;
}
