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
  const JobApplicantsViewAllFetchSuccess({
    required this.jobApplicants,
    required this.query,
    required this.hasMore,
    this.isLoadMore = false,
  });
  final List<JobApplicant> jobApplicants;
  final String query;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [jobApplicants, query, hasMore, isLoadMore];
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

/// [GetJobOfferFilteringUseCase] succeeded.
class JobOfferFilteringFetchSuccess extends JobsState {
  const JobOfferFilteringFetchSuccess({required this.jobOfferFiltering});
  final JobOfferFiltering jobOfferFiltering;

  @override
  List<Object> get props => [jobOfferFiltering];
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
  const JobsViewAllFetchSuccess({
    required this.jobOffers,
    required this.query,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<JobOffer> jobOffers;
  final String query;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [jobOffers, query, hasMore, isLoadMore];
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

/// [UploadImageUseCase] succeeded for multiple images.
class JobsUploadMultipleImagesSuccess extends JobsState {
  const JobsUploadMultipleImagesSuccess({required this.jobImages});
  final List<JobImage> jobImages;

  @override
  List<Object> get props => [jobImages];
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

/// [ApplyToOfferUseCase] succeeded.
class JobsApplyInProgress extends JobsState {
  const JobsApplyInProgress();

  @override
  List<Object> get props => [];
}

class JobsApplyToOfferSuccess extends JobsState {
  const JobsApplyToOfferSuccess({required this.applyMessage});
  final String applyMessage;

  @override
  List<Object> get props => [applyMessage];
}

class JobsApplyRequestFailure extends JobsState {
  const JobsApplyRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

/// [GetTrainingCenterDomainsUseCase] succeeded.
class GetTrainingCenterDomainsSuccess extends JobsState {
  const GetTrainingCenterDomainsSuccess({required this.trainingCenterDomains});
  final List<JobDomain> trainingCenterDomains;

  @override
  List<Object> get props => [trainingCenterDomains];
}

/// [GetPricePlanUsecase] succeeded.
class JobsGetPricePlanSuccess extends JobsState {
  const JobsGetPricePlanSuccess({required this.pricePlans});
  final List<PricePlan> pricePlans;

  @override
  List<Object> get props => [pricePlans];
}

/// [CreateJobApplicantUseCase] succeeded.
class JobsCreateJobApplicantSuccess extends JobsState {
  const JobsCreateJobApplicantSuccess({required this.jobApplicant});
  final JobApplicant jobApplicant;

  @override
  List<Object> get props => [jobApplicant];
}

/// [GetJobApplicantDetailUseCase] succeeded.
class JobsGetJobApplicantDetailSuccess extends JobsState {
  const JobsGetJobApplicantDetailSuccess({required this.jobApplicant});
  final JobApplicant jobApplicant;

  @override
  List<Object> get props => [jobApplicant];
}

/// [CreateTrainingCenterUseCase] succeeded.
class JobsCreateTrainingCenterSuccess extends JobsState {
  const JobsCreateTrainingCenterSuccess({required this.trainingCenter});
  final TrainingCenter trainingCenter;

  @override
  List<Object> get props => [trainingCenter];
}

class CreateHotEventSuccess extends JobsState {
  const CreateHotEventSuccess({required this.hotEvent});
  final HotEvent hotEvent;

  @override
  List<Object> get props => [hotEvent];
}

/// [GetTrainingCenterHotEventUseCase] succeeded.
class GetTrainingCenterHotEventSuccess extends JobsState {
  const GetTrainingCenterHotEventSuccess({
    required this.trainingCenterHotEvents,
  });
  final List<TrainingCenterHotEvent> trainingCenterHotEvents;

  @override
  List<Object> get props => [trainingCenterHotEvents];
}

/// [GetTrainingCenterFilterUseCase] succeeded.
class GetTrainingCenterFilterSuccess extends JobsState {
  const GetTrainingCenterFilterSuccess({required this.trainingCenterFilter});
  final TrainingCenterFilter trainingCenterFilter;

  @override
  List<Object> get props => [trainingCenterFilter];
}

/// [ViewAllHotEventUseCase] succeeded.
class ViewAllHotEventsSuccess extends JobsState {
  const ViewAllHotEventsSuccess({
    required this.hotEvents,
    required this.query,
    required this.hasMore,
    this.isLoadMore = false,
  });
  final List<HotEvent> hotEvents;
  final String query;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [hotEvents, query, hasMore, isLoadMore];
}

/// [ViewAllTrainingCenterUseCase] succeeded.
class ViewAllTrainingCentersSuccess extends JobsState {
  const ViewAllTrainingCentersSuccess({
    required this.trainingCenters,
    required this.query,
    required this.hasMore,
    this.isLoadMore = false,
  });
  final List<TrainingCenter> trainingCenters;
  final String query;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [trainingCenters, query, hasMore, isLoadMore];
}

/// [GetHotEventDetailUseCase] succeeded.
class GetHotEventDetailSuccess extends JobsState {
  const GetHotEventDetailSuccess({required this.hotEvent});
  final HotEvent hotEvent;

  @override
  List<Object> get props => [hotEvent];
}

/// [GetTrainingCenterDetailUsecase] succeeded.
class GetTrainingCenterDetailSuccess extends JobsState {
  const GetTrainingCenterDetailSuccess({required this.trainingCenter});
  final TrainingCenter trainingCenter;

  @override
  List<Object> get props => [trainingCenter];
}

/// [SubscribeExpertExecutiveUseCase] succeeded.
class SubscribeExpertExecutiveSuccess extends JobsState {
  const SubscribeExpertExecutiveSuccess({required this.expertExecutive});
  final ExpertExecutive expertExecutive;

  @override
  List<Object> get props => [expertExecutive];
}

/// [GetTrainingCenterViewDomainUseCase] succeeded.
class GetTrainingCenterViewDomainSuccess extends JobsState {
  const GetTrainingCenterViewDomainSuccess({
    required this.trainingCenterViewDomain,
  });
  final TrainingCenterViewDomain trainingCenterViewDomain;

  @override
  List<Object> get props => [trainingCenterViewDomain];
}

class JobsViewUserProfileSuccess extends JobsState {
  const JobsViewUserProfileSuccess({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class JobsBlockUserSuccess extends JobsState {
  const JobsBlockUserSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

/// Any request failed.
class JobsRequestFailure extends JobsState {
  const JobsRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
