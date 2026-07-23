import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/usecases/get_all_saved_job_applicants_usecase.dart';

part 'saved_job_applicants_list_event.dart';
part 'saved_job_applicants_list_state.dart';
part 'saved_job_applicants_list_bloc.freezed.dart';

class SavedJobApplicantsListBloc
    extends Bloc<SavedJobApplicantsListEvent, SavedJobApplicantsListState> {
  SavedJobApplicantsListBloc({required this._getAllSavedJobApplicantsUseCase})
    : super(const _Initial()) {
    on<SavedJobApplicantsListLoaded>(_onSavedJobApplicantsListLoaded);
    on<SavedJobApplicantsListLoadMore>(_onSavedJobApplicantsListLoadMore);
  }
  final GetAllSavedJobApplicantsUseCase _getAllSavedJobApplicantsUseCase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  List<JobApplicant> _cachedJobApplicants = [];
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;

  Future<void> _onSavedJobApplicantsListLoaded(
    SavedJobApplicantsListLoaded event,
    Emitter<SavedJobApplicantsListState> emit,
  ) async {
    _currentPage = event.queryPageParams.page;
    _cachedJobApplicants = [];
    _hasMore = true;
    _isLoadMoreInProgress = false;

    emit(SavedJobApplicantsListLoadInProgress());
    final result = await _getAllSavedJobApplicantsUseCase(
      event.queryPageParams,
    );
    result.fold(
      (failure) => emit(
        SavedJobApplicantsListLoadFailure(error: failure.message),
      ),
      (jobApplicants) {
        _cachedJobApplicants = jobApplicants;
        _hasMore = jobApplicants.length >= _pageSize;
        emit(
          SavedJobApplicantsListLoadSuccess(
            jobApplicants: _cachedJobApplicants,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onSavedJobApplicantsListLoadMore(
    SavedJobApplicantsListLoadMore event,
    Emitter<SavedJobApplicantsListState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) {
      return;
    }

    _isLoadMoreInProgress = true;
    emit(
      SavedJobApplicantsListLoadSuccess(
        jobApplicants: _cachedJobApplicants,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentPage++;
    final result = await _getAllSavedJobApplicantsUseCase(
      QueryPageParams(page: _currentPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        emit(SavedJobApplicantsListLoadFailure(error: failure.message));
      },
      (jobApplicants) {
        _cachedJobApplicants = [..._cachedJobApplicants, ...jobApplicants];
        _hasMore = jobApplicants.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          SavedJobApplicantsListLoadSuccess(
            jobApplicants: _cachedJobApplicants,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }
}
