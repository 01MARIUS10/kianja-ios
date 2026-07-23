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

/// Fetch job offer filters.
class JobOfferFilteringFetchRequested extends JobsEvent {
  const JobOfferFilteringFetchRequested();

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

/// Upload multiple image files.
class JobsUploadMultipleImagesRequested extends JobsEvent {
  const JobsUploadMultipleImagesRequested({required this.files});
  final List<XFile> files;

  @override
  List<Object> get props => [files];
}

/// Create a Job Offer.
class JobsCreateJobOfferRequested extends JobsEvent {
  const JobsCreateJobOfferRequested({required this.createJobOfferParams});
  final CreateJobOfferParams createJobOfferParams;

  @override
  List<Object> get props => [createJobOfferParams];
}

/// Get a job offer detail.
class JobsGetJobOfferDetailRequested extends JobsEvent {
  const JobsGetJobOfferDetailRequested({required this.id});
  final int id;

  @override
  List<Object> get props => [id];
}

/// Apply to a job offer.
class JobsApplyToOfferRequested extends JobsEvent {
  const JobsApplyToOfferRequested({required this.id});
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

/// Get a job applicant plan.
class JobsGetPricePlanRequested extends JobsEvent {
  const JobsGetPricePlanRequested({required this.getPricePlanParams});
  final GetPricePlanParams getPricePlanParams;

  @override
  List<Object> get props => [];
}

/// Create Job applicant
class JobCreateJobApplicantRequested extends JobsEvent {
  const JobCreateJobApplicantRequested({
    required this.createJobApplicantParams,
  });
  final CreateJobApplicantParams createJobApplicantParams;

  @override
  List<Object> get props => [createJobApplicantParams];
}

/// Fetch training center hot events.
class ViewAllHotEventsRequested extends JobsEvent {
  const ViewAllHotEventsRequested({required this.viewAllHotEventParams});
  final ViewAllHotEventParams viewAllHotEventParams;

  @override
  List<Object> get props => [viewAllHotEventParams];
}

/// Fetch training center filters.
class ViewAllTrainingCentersRequested extends JobsEvent {
  const ViewAllTrainingCentersRequested({
    required this.viewAllTrainingCentersParams,
  });
  final ViewAllTrainingCentersParams viewAllTrainingCentersParams;

  @override
  List<Object> get props => [viewAllTrainingCentersParams];
}

/// Fetch training center hot events.
class GetTrainingCenterHotEventRequested extends JobsEvent {
  const GetTrainingCenterHotEventRequested();

  @override
  List<Object> get props => [];
}

/// Fetch training center filters.
class GetTrainingCenterFilterRequested extends JobsEvent {
  const GetTrainingCenterFilterRequested();

  @override
  List<Object> get props => [];
}

class GetTrainingCenterDomainsRequested extends JobsEvent {
  const GetTrainingCenterDomainsRequested();

  @override
  List<Object> get props => [];
}

class GetHotEventDetailRequested extends JobsEvent {
  const GetHotEventDetailRequested({required this.getHotEventDetailParams});
  final GetHotEventDetailParams getHotEventDetailParams;

  @override
  List<Object> get props => [getHotEventDetailParams];
}

class CreateTrainingCenterRequested extends JobsEvent {
  const CreateTrainingCenterRequested({
    required this.createtrainingCenterParams,
  });
  final CreateTrainingCenterParams createtrainingCenterParams;

  @override
  List<Object> get props => [createtrainingCenterParams];
}

class SubscribeExpertExecutiveRequested extends JobsEvent {
  const SubscribeExpertExecutiveRequested({
    required this.subscribeExpertExecutiveParams,
  });
  final SubscribeExpertExecutiveParams subscribeExpertExecutiveParams;

  @override
  List<Object> get props => [subscribeExpertExecutiveParams];
}

class GetTrainingCenterDetailRequested extends JobsEvent {
  const GetTrainingCenterDetailRequested({
    required this.trainingCenterDetailParams,
  });
  final TrainingCenterDetailParams trainingCenterDetailParams;

  @override
  List<Object> get props => [trainingCenterDetailParams];
}

class GetTrainingCenterViewDomainRequested extends JobsEvent {
  const GetTrainingCenterViewDomainRequested({required this.params});
  final GetTrainingCenterViewDomainParams params;

  @override
  List<Object> get props => [params];
}

class CreateHotEventRequested extends JobsEvent {
  const CreateHotEventRequested({required this.createHotEventParams});
  final CreateHotEventParams createHotEventParams;

  @override
  List<Object> get props => [createHotEventParams];
}
