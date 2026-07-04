import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/features/about/domain/entities/app_version.dart';
import 'package:kianja/features/about/domain/usecases/get_all_versions_usecase.dart';
import 'package:kianja/features/about/domain/usecases/get_update_version_usecase.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc({
    required this._getAllVersionsUseCase,
    required this._getUpdateVersionUseCase,
  }) : super(AboutInitial()) {
    on<AboutGetAllVersionsRequested>(_onGetAllVersionsRequested);
    on<AboutGetUpdateVersionRequested>(_onGetUpdateVersionRequested);
  }

  final GetAllVersionsUseCase _getAllVersionsUseCase;
  final GetUpdateVersionUseCase _getUpdateVersionUseCase;

  Future<void> _onGetAllVersionsRequested(
    AboutGetAllVersionsRequested event,
    Emitter<AboutState> emit,
  ) async {
    emit(AboutRequestInProgress());
    final result = await _getAllVersionsUseCase(NoParams());
    result.fold(
      (failure) => emit(AboutRequestFailure(message: failure.message)),
      (versions) => emit(AboutGetAllVersionsSuccess(appVersions: versions)),
    );
  }

  Future<void> _onGetUpdateVersionRequested(
    AboutGetUpdateVersionRequested event,
    Emitter<AboutState> emit,
  ) async {
    emit(AboutRequestInProgress());
    final result = await _getUpdateVersionUseCase(NoParams());
    result.fold(
      (failure) => emit(AboutRequestFailure(message: failure.message)),
      (version) => emit(AboutGetUpdateVersionSuccess(appVersion: version)),
    );
  }
}
