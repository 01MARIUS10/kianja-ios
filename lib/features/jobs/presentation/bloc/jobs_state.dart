part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object> get props => [];
}

/// Initial state — nothing has been requested yet.
class JobsInitial extends JobsState {}

/// A request is in flight.
class JobsRequestInProgress extends JobsState {}

/// [ViewAllJobApplicantsUseCase] succeeded.
class JobApplicantsViewAllFetchSuccess extends JobsState {
  const JobApplicantsViewAllFetchSuccess({required this.jobApplicants});
  final List<JobApplicant> jobApplicants;

  @override
  List<Object> get props => [jobApplicants];
}

/// [GetJobApplicantsZoneUseCase] succeeded.
class JobApplicantsZoneFetchSuccess extends JobsState {
  const JobApplicantsZoneFetchSuccess({required this.jobApplicantsZone});
  final List<JobApplicantZone> jobApplicantsZone;

  @override
  List<Object> get props => [jobApplicantsZone];
}

/// [GetJobFeaturesUseCase] succeeded.
class JobFeaturesFetchSuccess extends JobsState {
  const JobFeaturesFetchSuccess({required this.jobFeatures});
  final JobFeatures jobFeatures;

  @override
  List<Object> get props => [jobFeatures];
}

/// [GetJobApplicantProfessionsUseCase] succeeded.
class JobApplicantProfessionsFetchSuccess extends JobsState {
  const JobApplicantProfessionsFetchSuccess({required this.jobCategories});
  final List<JobCategory> jobCategories;

  @override
  List<Object> get props => [jobCategories];
}

/// [GetJobApplicantFiltersUseCase] succeeded.
class JobApplicantFiltersFetchSuccess extends JobsState {
  const JobApplicantFiltersFetchSuccess({required this.jobApplicantFilter});
  final JobApplicantFilter jobApplicantFilter;

  @override
  List<Object> get props => [jobApplicantFilter];
}

/// [GetJobOffersGroupByUseCase] succeeded.
class JobsGroupByTypeFetchSuccess extends JobsState {
  const JobsGroupByTypeFetchSuccess({required this.jobOffersType});
  final List<JobOfferFilter> jobOffersType;

  @override
  List<Object> get props => [jobOffersType];
}

/// [GetJobOffersGroupByUseCase] succeeded.
class JobsGroupByDateFetchSuccess extends JobsState {
  const JobsGroupByDateFetchSuccess({required this.jobOffersDate});
  final List<JobOfferFilter> jobOffersDate;

  @override
  List<Object> get props => [jobOffersDate];
}

/// [GetJobOffersGroupByUseCase] succeeded.
class JobsGroupByZoneFetchSuccess extends JobsState {
  const JobsGroupByZoneFetchSuccess({required this.jobOffersZone});
  final List<JobOfferFilter> jobOffersZone;

  @override
  List<Object> get props => [jobOffersZone];
}

/// [ViewAllJobOffersUseCase] succeeded.
/// [query] is kept so the UI knows which category/filter was active.
class JobsViewAllFetchSuccess extends JobsState {
  const JobsViewAllFetchSuccess({required this.jobOffers, required this.query});
  final List<JobOffer> jobOffers;
  final String query;

  @override
  List<Object> get props => [jobOffers, query];
}

/// [UploadPdfUseCase] succeeded.
class JobsUploadPdfSuccess extends JobsState {
  const JobsUploadPdfSuccess({required this.jobPdf});
  final JobPdf jobPdf;

  @override
  List<Object> get props => [jobPdf];
}

/// [UploadImageUseCase] succeeded.
class JobsUploadImageSuccess extends JobsState {
  const JobsUploadImageSuccess({required this.jobImage});
  final JobImage jobImage;

  @override
  List<Object> get props => [jobImage];
}

/// [CreateJobOfferUseCase] succeeded.
class JobsCreateJobOfferSuccess extends JobsState {
  const JobsCreateJobOfferSuccess({required this.jobOffer});
  final JobOffer jobOffer;

  @override
  List<Object> get props => [jobOffer];
}

/// [GetJobOfferDetailUseCase] succeeded.
class JobsGetJobOfferDetailSuccess extends JobsState {
  const JobsGetJobOfferDetailSuccess({required this.jobOffer});
  final JobOffer jobOffer;

  @override
  List<Object> get props => [jobOffer];
}

/// [GetJobApplicantDetailUseCase] succeeded.
class JobsGetJobApplicantDetailSuccess extends JobsState {
  const JobsGetJobApplicantDetailSuccess({required this.jobApplicant});
  final JobApplicant jobApplicant;

  @override
  List<Object> get props => [jobApplicant];
}

/// Any request failed.
class JobsRequestFailure extends JobsState {
  const JobsRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
