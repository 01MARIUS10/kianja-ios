part of 'job_applications_bloc.dart';

@freezed
class JobApplicationsEvent with _$JobApplicationsEvent {
  const factory JobApplicationsEvent.started() = _Started;
}

class JobApplicationsJobOffersLoaded implements JobApplicationsEvent {
  const JobApplicationsJobOffersLoaded({required this.queryPageParams});
  final QueryPageParams queryPageParams;
}

class JobApplicationsLoadMoreJobOffers implements JobApplicationsEvent {
  const JobApplicationsLoadMoreJobOffers();
}
