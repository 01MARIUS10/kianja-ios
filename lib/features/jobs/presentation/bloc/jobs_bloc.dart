import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_pdf.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_features_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offer_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_offers_group_by_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_image_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/upload_pdf_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_applicants/view_all_job_applicants_usecase.dart';
import 'package:kianja/features/jobs/domain/usecases/view_all_job_offers_usecase.dart';

part 'jobs_event.dart';
part 'jobs_state.dart';

class JobsBloc extends Bloc<JobsEvent, JobsState> {
  JobsBloc({
    required GetJobOffersGroupByUseCase getJobOffersGroupByUseCase,
    required ViewAllJobOffersUseCase viewAllJobOffersUseCase,
    required UploadPdfUseCase uploadPdfUseCase,
    required UploadImageUseCase uploadImageUseCase,
    required CreateJobOfferUseCase createJobOfferUseCase,
    required GetJobOfferDetailUseCase getJobOfferDetailUseCase,
    required GetJobApplicantDetailUseCase getJobApplicantDetailUseCase,
    required GetJobFeaturesUseCase getJobFeaturesUseCase,
    required GetJobApplicantZoneUseCase getJobApplicantZoneUseCase,
    required ViewAllJobApplicantsUseCase viewAllJobApplicantsUseCase,
  }) : _getJobOffersGroupByUseCase = getJobOffersGroupByUseCase,
       _viewAllJobOffersUseCase = viewAllJobOffersUseCase,
       _uploadPdfUseCase = uploadPdfUseCase,
       _uploadImageUseCase = uploadImageUseCase,
       _createJobOfferUseCase = createJobOfferUseCase,
       _getJobOfferDetailUseCase = getJobOfferDetailUseCase,
       _getJobApplicantDetailUseCase = getJobApplicantDetailUseCase,
       _getJobFeaturesUseCase = getJobFeaturesUseCase,
       _getJobApplicantZoneUseCase = getJobApplicantZoneUseCase,
       _viewAllJobApplicantsUseCase = viewAllJobApplicantsUseCase,
       super(JobsInitial()) {
    on<JobsGroupByTypeFetchRequested>(_onGroupByTypeFetchRequested);
    on<JobsGroupByDateFetchRequested>(_onGroupByDateFetchRequested);
    on<JobsGroupByZoneFetchRequested>(_onGroupByZoneFetchRequested);
    on<JobsViewAllFetchRequested>(_onViewAllFetchRequested);
    on<JobsUploadPdfRequested>(_onUploadPdfRequested);
    on<JobsUploadImageRequested>(_onUploadImageRequested);
    on<JobsCreateJobOfferRequested>(_onCreateJobOfferRequested);
    on<JobsGetJobOfferDetailRequested>(_onGetJobOfferDetailRequested);
    on<JobsGetJobApplicantDetailRequested>(_onGetJobApplicantDetailRequested);
    on<JobFeaturesFetchRequested>(_onJobFeaturesFetchRequested);
    on<JobApplicantsViewAllFetchRequested>(
      _onJobApplicantsViewAllFetchRequested,
    );
    on<JobApplicantsZoneFetchRequested>(_onJobApplicantsZoneFetchRequested);
  }

  final GetJobOffersGroupByUseCase _getJobOffersGroupByUseCase;
  final ViewAllJobOffersUseCase _viewAllJobOffersUseCase;
  final UploadPdfUseCase _uploadPdfUseCase;
  final UploadImageUseCase _uploadImageUseCase;
  final CreateJobOfferUseCase _createJobOfferUseCase;
  final GetJobOfferDetailUseCase _getJobOfferDetailUseCase;
  final GetJobApplicantDetailUseCase _getJobApplicantDetailUseCase;
  final GetJobFeaturesUseCase _getJobFeaturesUseCase;
  final GetJobApplicantZoneUseCase _getJobApplicantZoneUseCase;
  final ViewAllJobApplicantsUseCase _viewAllJobApplicantsUseCase;

  Future<void> _onJobFeaturesFetchRequested(
    JobFeaturesFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Job features request');

    emit(JobsRequestInProgress());
    final result = await _getJobFeaturesUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobFeatures) => emit(JobFeaturesFetchSuccess(jobFeatures: jobFeatures)),
    );
  }

  Future<void> _onGroupByTypeFetchRequested(
    JobsGroupByTypeFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Group by request : ${event.query}');

    emit(JobsRequestInProgress());
    final result = await _getJobOffersGroupByUseCase(
      GetJobOffersGroupByParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFilters) {
        final jobOfferFilterList = jobOfferFilters
            .where((jobOfferFilter) => jobOfferFilter.jobOffers.isNotEmpty)
            .toList();
        emit(JobsGroupByTypeFetchSuccess(jobOffersType: jobOfferFilterList));
      },
    );
  }

  Future<void> _onGroupByDateFetchRequested(
    JobsGroupByDateFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Group by request : ${event.query}');

    emit(JobsRequestInProgress());
    final result = await _getJobOffersGroupByUseCase(
      GetJobOffersGroupByParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFilters) {
        final jobOfferFilterList = jobOfferFilters
            .where((jobOfferFilter) => jobOfferFilter.jobOffers.isNotEmpty)
            .toList();
        emit(JobsGroupByDateFetchSuccess(jobOffersDate: jobOfferFilterList));
      },
    );
  }

  Future<void> _onGroupByZoneFetchRequested(
    JobsGroupByZoneFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    AppDebug.showPrint('Bloc Jobs - Group by request : ${event.query}');

    emit(JobsRequestInProgress());
    final result = await _getJobOffersGroupByUseCase(
      GetJobOffersGroupByParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOfferFilters) {
        final jobOfferFilterList = jobOfferFilters
            .where((jobOfferFilter) => jobOfferFilter.jobOffers.isNotEmpty)
            .toList();
        emit(JobsGroupByZoneFetchSuccess(jobOffersZone: jobOfferFilterList));
      },
    );
  }

  Future<void> _onViewAllFetchRequested(
    JobsViewAllFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _viewAllJobOffersUseCase(
      ViewAllJobOffersParams(query: event.query),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffers) => emit(
        JobsViewAllFetchSuccess(jobOffers: jobOffers, query: event.query),
      ),
    );
  }

  Future<void> _onJobApplicantsZoneFetchRequested(
    JobApplicantsZoneFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobApplicantZoneUseCase(NoParams());
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicantsZone) {
        final jobApplicantsZoneList = jobApplicantsZone
            .where(
              (jobApplicantsZone) => jobApplicantsZone.jobApplicants.isNotEmpty,
            )
            .toList();
        emit(
          JobApplicantsZoneFetchSuccess(
            jobApplicantsZone: jobApplicantsZoneList,
          ),
        );
      },
    );
  }

  Future<void> _onJobApplicantsViewAllFetchRequested(
    JobApplicantsViewAllFetchRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _viewAllJobApplicantsUseCase(
      event.viewAllJobApplicantsParams,
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicants) =>
          emit(JobApplicantsViewAllFetchSuccess(jobApplicants: jobApplicants)),
    );
  }

  Future<void> _onUploadPdfRequested(
    JobsUploadPdfRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _uploadPdfUseCase(UploadPdfParams(file: event.file));
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobPdf) => emit(JobsUploadPdfSuccess(jobPdf: jobPdf)),
    );
  }

  Future<void> _onUploadImageRequested(
    JobsUploadImageRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _uploadImageUseCase(
      UploadImageParams(file: event.file),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobImage) => emit(JobsUploadImageSuccess(jobImage: jobImage)),
    );
  }

  Future<void> _onCreateJobOfferRequested(
    JobsCreateJobOfferRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _createJobOfferUseCase(
      CreateJobOfferParams(
        title: event.title,
        imageId: event.imageId,
        description: event.description,
        categories: event.categories,
        location: event.location,
        gender: event.gender,
        actor: event.actor,
        limitDate: event.limitDate,
        status: event.status,
      ),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffer) => emit(JobsCreateJobOfferSuccess(jobOffer: jobOffer)),
    );
  }

  Future<void> _onGetJobOfferDetailRequested(
    JobsGetJobOfferDetailRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobOfferDetailUseCase(
      GetJobOfferDetailParams(id: event.id),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobOffer) => emit(JobsGetJobOfferDetailSuccess(jobOffer: jobOffer)),
    );
  }

  Future<void> _onGetJobApplicantDetailRequested(
    JobsGetJobApplicantDetailRequested event,
    Emitter<JobsState> emit,
  ) async {
    emit(JobsRequestInProgress());
    final result = await _getJobApplicantDetailUseCase(
      GetJobApplicantDetailParams(id: event.id),
    );
    result.fold(
      (failure) => emit(JobsRequestFailure(message: failure.message)),
      (jobApplicant) =>
          emit(JobsGetJobApplicantDetailSuccess(jobApplicant: jobApplicant)),
    );
  }
}
