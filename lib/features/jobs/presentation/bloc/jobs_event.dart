part of 'jobs_bloc.dart';

abstract class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

/// Fetch job features.
class JobFeaturesFetchRequested extends JobsEvent {
  const JobFeaturesFetchRequested();

  @override
  List<Object> get props => [];
}

/// Fetch job applicant professions.
class JobApplicantProfessionsFetchRequested extends JobsEvent {
  const JobApplicantProfessionsFetchRequested();

  @override
  List<Object> get props => [];
}

/// Fetch job applicant filters.
class JobApplicantFiltersFetchRequested extends JobsEvent {
  const JobApplicantFiltersFetchRequested();

  @override
  List<Object> get props => [];
}

/// Fetch job offers grouped by [query] (e.g. category, actor type…).
class JobsGroupByTypeFetchRequested extends JobsEvent {
  const JobsGroupByTypeFetchRequested({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

/// Fetch job offers grouped by [query] (e.g. category, actor type…).
class JobsGroupByDateFetchRequested extends JobsEvent {
  const JobsGroupByDateFetchRequested({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

/// Fetch job offers grouped by [query] (e.g. category, actor type…).
class JobsGroupByZoneFetchRequested extends JobsEvent {
  const JobsGroupByZoneFetchRequested({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

/// Fetch the flat list of all job offers matching [query].
class JobsViewAllFetchRequested extends JobsEvent {
  const JobsViewAllFetchRequested({required this.query});
  final String query;

  @override
  List<Object> get props => [query];
}

/// Fetch job applicants by zone.
class JobApplicantsZoneFetchRequested extends JobsEvent {
  const JobApplicantsZoneFetchRequested({required this.getJobApplicantParams});
  final GetJobApplicantParams getJobApplicantParams;

  @override
  List<Object> get props => [getJobApplicantParams];
}

/// Fetch the flat list of all job applicants matching [query].
class JobApplicantsViewAllFetchRequested extends JobsEvent {
  const JobApplicantsViewAllFetchRequested({
    required this.viewAllJobApplicantsParams,
  });
  final ViewAllJobApplicantsParams viewAllJobApplicantsParams;

  @override
  List<Object> get props => [viewAllJobApplicantsParams];
}

/// Upload a PDF file.
class JobsUploadPdfRequested extends JobsEvent {
  const JobsUploadPdfRequested({required this.file});
  final PlatformFile file;

  @override
  List<Object> get props => [file];
}

/// Upload an image file.
class JobsUploadImageRequested extends JobsEvent {
  const JobsUploadImageRequested({required this.file});
  final XFile file;

  @override
  List<Object> get props => [file];
}

/// Create a Job Offer.
class JobsCreateJobOfferRequested extends JobsEvent {
  const JobsCreateJobOfferRequested({
    required this.title,
    required this.imageId,
    required this.description,
    required this.categories,
    required this.location,
    required this.gender,
    required this.actor,
    required this.limitDate,
    required this.status,
  });
  final String title;
  final int imageId;
  final String description;
  final List<int> categories;
  final int location;
  final int gender;
  final int actor;
  final String limitDate;
  final String status;

  @override
  List<Object> get props => [
    title,
    imageId,
    description,
    categories,
    location,
    gender,
    actor,
    limitDate,
    status,
  ];
}

/// Get a job offer detail.
class JobsGetJobOfferDetailRequested extends JobsEvent {
  const JobsGetJobOfferDetailRequested({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

/// Get a job applicant detail.
class JobsGetJobApplicantDetailRequested extends JobsEvent {
  const JobsGetJobApplicantDetailRequested({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}
