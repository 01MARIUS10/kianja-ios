part of 'my_post_bloc.dart';

abstract class MyPostState extends Equatable {
  const MyPostState();

  @override
  List<Object> get props => [];
}

// INITIAL STATE ---------------------------------------------------------

class MyPostInitial extends MyPostState {}

// --------------------------------------------------------- INITIAL STATE
//
//
//
//
//
//
// LOADING STATE ---------------------------------------------------------
class MyPostRequestInProgress extends MyPostState {}

// --------------------------------------------------------- LOADING STATE
//
//
//
//
//
//
// SUCCESS STATE ---------------------------------------------------------

// UPDATE ----------------------------------------------------------------
class MyPostUpdateJobOfferSuccess extends MyPostState {
  const MyPostUpdateJobOfferSuccess({required this.jobOffer});
  final JobOffer jobOffer;

  @override
  List<Object> get props => [jobOffer];
}

class MyPostUpdateJobApplicantSuccess extends MyPostState {
  const MyPostUpdateJobApplicantSuccess({required this.jobApplicant});
  final JobApplicant jobApplicant;

  @override
  List<Object> get props => [jobApplicant];
}

class MyPostUpdateTrainingCenterSuccess extends MyPostState {
  const MyPostUpdateTrainingCenterSuccess({required this.trainingCenter});
  final TrainingCenter trainingCenter;

  @override
  List<Object> get props => [trainingCenter];
}

class MyPostUpdateExpertExecutiveSuccess extends MyPostState {
  const MyPostUpdateExpertExecutiveSuccess({required this.expertExecutive});
  final ExpertExecutive expertExecutive;

  @override
  List<Object> get props => [expertExecutive];
}

class MyPostUpdateHotEventSuccess extends MyPostState {
  const MyPostUpdateHotEventSuccess({required this.hotEvent});
  final HotEvent hotEvent;

  @override
  List<Object> get props => [hotEvent];
}
// ----------------------------------------------------------------- UPDATE

// DELETE -----------------------------------------------------------------
class MyPostDeleteJobOfferSuccess extends MyPostState {
  const MyPostDeleteJobOfferSuccess({required this.deletedJobOfferId});
  final int deletedJobOfferId;

  @override
  List<Object> get props => [deletedJobOfferId];
}

class MyPostDeleteJobApplicantSuccess extends MyPostState {
  const MyPostDeleteJobApplicantSuccess({required this.deletedJobApplicantId});
  final int deletedJobApplicantId;

  @override
  List<Object> get props => [deletedJobApplicantId];
}

class MyPostDeleteTrainingCenterSuccess extends MyPostState {
  const MyPostDeleteTrainingCenterSuccess({
    required this.deletedTrainingCenterId,
  });
  final int deletedTrainingCenterId;

  @override
  List<Object> get props => [deletedTrainingCenterId];
}

class MyPostDeleteExpertExecutiveSuccess extends MyPostState {}

class MyPostDeleteHotEventSuccess extends MyPostState {
  const MyPostDeleteHotEventSuccess({required this.deletedHotEventId});
  final int deletedHotEventId;

  @override
  List<Object> get props => [deletedHotEventId];
}
// ----------------------------------------------------------------- DELETE

// GET ALL ----------------------------------------------------------------
class MyPostGetAllJobOffersSuccess extends MyPostState {
  const MyPostGetAllJobOffersSuccess({
    required this.jobOffers,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<JobOffer> jobOffers;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [jobOffers, hasMore, isLoadMore];
}

class MyPostGetAllJobApplicantsSuccess extends MyPostState {
  const MyPostGetAllJobApplicantsSuccess({
    required this.jobApplicants,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<JobApplicant> jobApplicants;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [jobApplicants, hasMore, isLoadMore];
}

class MyPostGetAllTrainingCentersSuccess extends MyPostState {
  const MyPostGetAllTrainingCentersSuccess({
    required this.trainingCenters,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<TrainingCenter> trainingCenters;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [trainingCenters, hasMore, isLoadMore];
}

class MyPostGetAllHotsSuccess extends MyPostState {
  const MyPostGetAllHotsSuccess({
    required this.hots,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<HotEvent> hots;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [hots, hasMore, isLoadMore];
}

class MyPostGetAllEventsSuccess extends MyPostState {
  const MyPostGetAllEventsSuccess({
    required this.events,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<HotEvent> events;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [events, hasMore, isLoadMore];
}
// ---------------------------------------------------------------- GET ALL

// GET CANDIDATES ---------------------------------------------------------
class MyPostGetCandidatesSuccess extends MyPostState {
  const MyPostGetCandidatesSuccess({
    required this.users,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<User> users;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [users, hasMore, isLoadMore];
}

class MyPostGetCandidateSuccess extends MyPostState {
  const MyPostGetCandidateSuccess({required this.user});

  final User user;

  @override
  List<Object> get props => [user];
}

class MyPostProlongerJobApplicantSuccess extends MyPostState {
  const MyPostProlongerJobApplicantSuccess({required this.jobApplicant});
  final JobApplicant jobApplicant;

  @override
  List<Object> get props => [jobApplicant];
}
// --------------------------------------------------------- GET CANDIDATES

// ---------------------------------------------------------- SUCCESS STATE
//
//
//
//
//
//
// FAILURE STATE ----------------------------------------------------------

class MyPostRequestFailure extends MyPostState {
  const MyPostRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

// ---------------------------------------------------------- FAILURE STATE
