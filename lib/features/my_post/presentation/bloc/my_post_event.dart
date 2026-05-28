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

class MyPostUpdateHotEventRequested extends MyPostEvent {
  const MyPostUpdateHotEventRequested({required this.updateHotEventParams});
  final UpdateHotEventParams updateHotEventParams;

  @override
  List<Object> get props => [updateHotEventParams];
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

class MyPostDeleteHotEventRequested extends MyPostEvent {
  const MyPostDeleteHotEventRequested({required this.deleteHotEventParams});
  final DeleteHotEventParams deleteHotEventParams;

  @override
  List<Object> get props => [deleteHotEventParams];
}

// ----------------------------------------------------------- DELETE EVENT

// GET ALL EVENT -----------------------------------------------------------
class MyPostGetAllJobOffersRequested extends MyPostEvent {
  const MyPostGetAllJobOffersRequested({required this.queryPageParams});
  final QueryPageParams queryPageParams;

  @override
  List<Object> get props => [queryPageParams];
}

class MyPostGetAllJobApplicantsRequested extends MyPostEvent {
  const MyPostGetAllJobApplicantsRequested({required this.queryPageParams});
  final QueryPageParams queryPageParams;

  @override
  List<Object> get props => [queryPageParams];
}

class MyPostGetAllTrainingCentersRequested extends MyPostEvent {
  const MyPostGetAllTrainingCentersRequested({required this.queryPageParams});
  final QueryPageParams queryPageParams;

  @override
  List<Object> get props => [queryPageParams];
}

class MyPostGetAllHotsRequested extends MyPostEvent {
  const MyPostGetAllHotsRequested({required this.queryPageParams});
  final QueryPageParams queryPageParams;

  @override
  List<Object> get props => [queryPageParams];
}

class MyPostGetAllEventsRequested extends MyPostEvent {
  const MyPostGetAllEventsRequested({required this.queryPageParams});
  final QueryPageParams queryPageParams;

  @override
  List<Object> get props => [queryPageParams];
}
// ----------------------------------------------------------- GET ALL EVENT

// LOAD MORE ITEM EVENT ----------------------------------------------------
class MyPostLoadMoreJobOffersRequested extends MyPostEvent {
  const MyPostLoadMoreJobOffersRequested();
}

class MyPostLoadMoreJobApplicantsRequested extends MyPostEvent {
  const MyPostLoadMoreJobApplicantsRequested();
}

class MyPostLoadMoreTrainingCentersRequested extends MyPostEvent {
  const MyPostLoadMoreTrainingCentersRequested();
}

class MyPostLoadMoreHotsRequested extends MyPostEvent {
  const MyPostLoadMoreHotsRequested();
}

class MyPostLoadMoreEventsRequested extends MyPostEvent {
  const MyPostLoadMoreEventsRequested();
}

// ---------------------------------------------------- LOAD MORE ITEM EVENT
