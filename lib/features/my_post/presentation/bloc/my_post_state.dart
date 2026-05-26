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
// ----------------------------------------------------------------- UPDATE

// DELETE -----------------------------------------------------------------
class MyPostDeleteJobOfferSuccess extends MyPostState {}

class MyPostDeleteJobApplicantSuccess extends MyPostState {}

class MyPostDeleteTrainingCenterSuccess extends MyPostState {}

class MyPostDeleteExpertExecutiveSuccess extends MyPostState {}
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
// ---------------------------------------------------------------- GET ALL

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
