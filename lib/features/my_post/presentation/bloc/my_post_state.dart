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

// --------------------------------------------------------- SUCCESS STATE
//
//
//
//
//
//
// FAILURE STATE ---------------------------------------------------------

class MyPostRequestFailure extends MyPostState {
  const MyPostRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

// --------------------------------------------------------- FAILURE STATE
