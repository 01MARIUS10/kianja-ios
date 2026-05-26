import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_expert_executive/delete_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_expert_executive/delete_expert_executive_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_applicant/delete_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_job_offer/delete_job_offer_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_params.dart';
import 'package:kianja/features/my_post/domain/usecases/delete/delete_training_center/delete_training_center_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/get_all/get_all_job_offers_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_expert_executive/update_expert_executive_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_usecase.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_usecase.dart';

part 'my_post_event.dart';
part 'my_post_state.dart';

class MyPostBloc extends Bloc<MyPostEvent, MyPostState> {
  MyPostBloc({
    // UPDATE USECASE ---------------------------------------------------------
    required UpdateJobOfferUseCase updateJobOfferUseCase,
    required UpdateJobApplicantUseCase updateJobApplicantUseCase,
    required UpdateTrainingCenterUseCase updateTrainingCenterUseCase,
    required UpdateExpertExecutiveUseCase updateExpertExecutiveUseCase,
    // --------------------------------------------------------- UPDATE USECASE

    // DELETE USECASE ---------------------------------------------------------
    required DeleteJobOfferUseCase deleteJobOfferUseCase,
    required DeleteJobApplicantUseCase deleteJobApplicantUseCase,
    required DeleteTrainingCenterUseCase deleteTrainingCenterUseCase,
    required DeleteExpertExecutiveUseCase deleteExpertExecutiveUseCase,
    // --------------------------------------------------------- DELETE USECASE

    // GET ALL USECASE ---------------------------------------------------------
    required GetAllJobOffersUseCase getAllJobOffersUseCase,
    // --------------------------------------------------------- GET ALL USECASE
  }) : // UPDATE USECASE ------------------------------------------------------
       _updateJobOfferUseCase = updateJobOfferUseCase,
       _updateJobApplicantUseCase = updateJobApplicantUseCase,
       _updateTrainingCenterUseCase = updateTrainingCenterUseCase,
       _updateExpertExecutiveUseCase = updateExpertExecutiveUseCase,
       // ------------------------------------------------------ UPDATE USECASE

       // DELETE USECASE ------------------------------------------------------
       _deleteJobOfferUseCase = deleteJobOfferUseCase,
       _deleteJobApplicantUseCase = deleteJobApplicantUseCase,
       _deleteTrainingCenterUseCase = deleteTrainingCenterUseCase,
       _deleteExpertExecutiveUseCase = deleteExpertExecutiveUseCase,
       // ------------------------------------------------------ DELETE USECASE

       // GET ALL USECASE ------------------------------------------------------
       _getAllJobOffersUseCase = getAllJobOffersUseCase,
       // ------------------------------------------------------ GET ALL USECASE
       super(MyPostInitial()) {
    // UPDATE EVENT HANDLER -------------------------------------------------
    on<MyPostUpdateJobOfferRequested>(_onUpdateJobOfferRequested);
    on<MyPostUpdateJobApplicantRequested>(_onUpdateJobApplicantRequested);
    on<MyPostUpdateTrainingCenterRequested>(_onUpdateTrainingCenterRequested);
    on<MyPostUpdateExpertExecutiveRequested>(_onUpdateExpertExecutiveRequested);
    // -------------------------------------------------- UPDATE EVENT HANDLER

    // DELETE EVENT HANDLER ---------------------------------------------------
    on<MyPostDeleteJobOfferRequested>(_onDeleteJobOfferRequested);
    on<MyPostDeleteJobApplicantRequested>(_onDeleteJobApplicantRequested);
    on<MyPostDeleteTrainingCenterRequested>(_onDeleteTrainingCenterRequested);
    on<MyPostDeleteExpertExecutiveRequested>(_onDeleteExpertExecutiveRequested);
    // --------------------------------------------------- DELETE EVENT HANDLER

    // GET ALL EVENT HANDLER ---------------------------------------------------
    on<MyPostGetAllJobOffersRequested>(_onGetAllJobOffersRequested);
    // --------------------------------------------------- GET ALL EVENT HANDLER
  }

  // UPDATE USECASE -----------------------------------------------------------
  final UpdateJobOfferUseCase _updateJobOfferUseCase;
  final UpdateJobApplicantUseCase _updateJobApplicantUseCase;
  final UpdateTrainingCenterUseCase _updateTrainingCenterUseCase;
  final UpdateExpertExecutiveUseCase _updateExpertExecutiveUseCase;
  // ----------------------------------------------------------- UPDATE USECASE

  // DELETE USECASE -----------------------------------------------------------
  final DeleteJobOfferUseCase _deleteJobOfferUseCase;
  final DeleteJobApplicantUseCase _deleteJobApplicantUseCase;
  final DeleteTrainingCenterUseCase _deleteTrainingCenterUseCase;
  final DeleteExpertExecutiveUseCase _deleteExpertExecutiveUseCase;
  // ----------------------------------------------------------- DELETE USECASE

  // GET ALL USECASE -----------------------------------------------------------
  final GetAllJobOffersUseCase _getAllJobOffersUseCase;
  // ----------------------------------------------------------- GET ALL USECASE

  // UPDATE EVENT HANDLER ---------------------------------------------------
  Future<void> _onUpdateJobOfferRequested(
    MyPostUpdateJobOfferRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateJobOfferUseCase(event.updateJobOfferParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobOffer) => emit(MyPostUpdateJobOfferSuccess(jobOffer: jobOffer)),
    );
  }

  Future<void> _onUpdateJobApplicantRequested(
    MyPostUpdateJobApplicantRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateJobApplicantUseCase(
      event.updateJobApplicantParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobApplicant) =>
          emit(MyPostUpdateJobApplicantSuccess(jobApplicant: jobApplicant)),
    );
  }

  Future<void> _onUpdateTrainingCenterRequested(
    MyPostUpdateTrainingCenterRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateTrainingCenterUseCase(
      event.updateTrainingCenterParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (trainingCenter) => emit(
        MyPostUpdateTrainingCenterSuccess(trainingCenter: trainingCenter),
      ),
    );
  }

  Future<void> _onUpdateExpertExecutiveRequested(
    MyPostUpdateExpertExecutiveRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _updateExpertExecutiveUseCase(
      event.updateExpertExecutiveParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (expertExecutive) => emit(
        MyPostUpdateExpertExecutiveSuccess(expertExecutive: expertExecutive),
      ),
    );
  }

  // --------------------------------------------------- UPDATE EVENT HANDLER
  //
  //
  //
  //
  //
  //
  // DELETE EVENT HANDLER ---------------------------------------------------
  Future<void> _onDeleteJobOfferRequested(
    MyPostDeleteJobOfferRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteJobOfferUseCase(event.deleteJobOfferParams);
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(MyPostDeleteJobOfferSuccess()),
    );
  }

  Future<void> _onDeleteJobApplicantRequested(
    MyPostDeleteJobApplicantRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteJobApplicantUseCase(
      event.deleteJobApplicantParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(MyPostDeleteJobApplicantSuccess()),
    );
  }

  Future<void> _onDeleteTrainingCenterRequested(
    MyPostDeleteTrainingCenterRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteTrainingCenterUseCase(
      event.deleteTrainingCenterParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(MyPostDeleteTrainingCenterSuccess()),
    );
  }

  Future<void> _onDeleteExpertExecutiveRequested(
    MyPostDeleteExpertExecutiveRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _deleteExpertExecutiveUseCase(
      event.deleteExpertExecutiveParams,
    );
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (_) => emit(MyPostDeleteExpertExecutiveSuccess()),
    );
  }

  // --------------------------------------------------- DELETE EVENT HANDLER
  //
  //
  //
  //
  //
  //
  //
  // GET ALL EVENT HANDLER ---------------------------------------------------
  Future<void> _onGetAllJobOffersRequested(
    MyPostGetAllJobOffersRequested event,
    Emitter<MyPostState> emit,
  ) async {
    emit(MyPostRequestInProgress());
    final result = await _getAllJobOffersUseCase(NoParams());
    result.fold(
      (failure) => emit(MyPostRequestFailure(message: failure.message)),
      (jobOffers) => emit(MyPostGetAllJobOffersSuccess(jobOffers: jobOffers)),
    );
  }

  // --------------------------------------------------- GET ALL EVENT HANDLER
}
