import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_params.dart';
import 'package:kianja/features/jobs/domain/usecases/save_content/save_content_usecase.dart';

part 'save_content_event.dart';
part 'save_content_state.dart';
part 'save_content_bloc.freezed.dart';

class SaveContentBloc extends Bloc<SaveContentEvent, SaveContentState> {
  SaveContentBloc({required this._saveContentUseCase})
    : super(const _Initial()) {
    on<SaveContentSaved>(_onSaveContentSaved);
  }
  final SaveContentUseCase _saveContentUseCase;

  void _onSaveContentSaved(
    SaveContentSaved event,
    Emitter<SaveContentState> emit,
  ) async {
    emit(SaveContentInProgress());
    final result = await _saveContentUseCase(event.saveContentParams);
    result.fold(
      (failure) => emit(SaveContentFailure(error: failure.message)),
      (message) => emit(
        SaveContentSuccess(id: event.saveContentParams.id, message: message),
      ),
    );
  }
}
