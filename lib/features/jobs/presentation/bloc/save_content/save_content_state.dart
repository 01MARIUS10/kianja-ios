part of 'save_content_bloc.dart';

@freezed
class SaveContentState with _$SaveContentState {
  const factory SaveContentState.initial() = _Initial;
}

class SaveContentInProgress implements SaveContentState {}

class SaveContentSuccess implements SaveContentState {
  const SaveContentSuccess({required this.id, required this.message});
  final int id;
  final String message;
}

class SaveContentFailure implements SaveContentState {
  const SaveContentFailure({required this.error});
  final String error;
}
