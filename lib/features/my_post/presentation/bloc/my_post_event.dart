part of 'my_post_bloc.dart';

abstract class MyPostEvent extends Equatable {
  const MyPostEvent();

  @override
  List<Object> get props => [];
}

// UPDATE EVENT -----------------------------------------------------------
class MyPostUpdateJobOfferRequested extends MyPostEvent {
  const MyPostUpdateJobOfferRequested({required this.updateJobOfferParams});
  final UpdateJobOfferParams updateJobOfferParams;

  @override
  List<Object> get props => [updateJobOfferParams];
}

class MyPostUpdateJobApplicantRequested extends MyPostEvent {
  const MyPostUpdateJobApplicantRequested({
    required this.updateJobApplicantParams,
  });
  final UpdateJobApplicantParams updateJobApplicantParams;

  @override
  List<Object> get props => [updateJobApplicantParams];
}

class MyPostUpdateTrainingCenterRequested extends MyPostEvent {
  const MyPostUpdateTrainingCenterRequested({
    required this.updateTrainingCenterParams,
  });
  final UpdateTrainingCenterParams updateTrainingCenterParams;

  @override
  List<Object> get props => [updateTrainingCenterParams];
}

class MyPostUpdateExpertExecutiveRequested extends MyPostEvent {
  const MyPostUpdateExpertExecutiveRequested({
    required this.updateExpertExecutiveParams,
  });
  final UpdateExpertExecutiveParams updateExpertExecutiveParams;

  @override
  List<Object> get props => [updateExpertExecutiveParams];
}

// ----------------------------------------------------------- UPDATE EVENT
//
//
//
//
//
//
// DELETE EVENT -----------------------------------------------------------
class MyPostDeleteJobOfferRequested extends MyPostEvent {
  const MyPostDeleteJobOfferRequested({required this.deleteJobOfferParams});
  final DeleteJobOfferParams deleteJobOfferParams;

  @override
  List<Object> get props => [deleteJobOfferParams];
}

class MyPostDeleteJobApplicantRequested extends MyPostEvent {
  const MyPostDeleteJobApplicantRequested({
    required this.deleteJobApplicantParams,
  });
  final DeleteJobApplicantParams deleteJobApplicantParams;

  @override
  List<Object> get props => [deleteJobApplicantParams];
}

class MyPostDeleteTrainingCenterRequested extends MyPostEvent {
  const MyPostDeleteTrainingCenterRequested({
    required this.deleteTrainingCenterParams,
  });
  final DeleteTrainingCenterParams deleteTrainingCenterParams;

  @override
  List<Object> get props => [deleteTrainingCenterParams];
}

class MyPostDeleteExpertExecutiveRequested extends MyPostEvent {
  const MyPostDeleteExpertExecutiveRequested({
    required this.deleteExpertExecutiveParams,
  });
  final DeleteExpertExecutiveParams deleteExpertExecutiveParams;

  @override
  List<Object> get props => [deleteExpertExecutiveParams];
}

// ----------------------------------------------------------- DELETE EVENT

// GET ALL EVENT -----------------------------------------------------------
class MyPostGetAllJobOffersRequested extends MyPostEvent {
  const MyPostGetAllJobOffersRequested({required this.queryPageParams});
  final QueryPageParams queryPageParams;

  @override
  List<Object> get props => [queryPageParams];
}
// ----------------------------------------------------------- GET ALL EVENT

// LOAD MORE ITEM EVENT ----------------------------------------------------
class MyPostLoadMoreJobOffersRequested extends MyPostEvent {
  const MyPostLoadMoreJobOffersRequested();
}
// ---------------------------------------------------- LOAD MORE ITEM EVENT