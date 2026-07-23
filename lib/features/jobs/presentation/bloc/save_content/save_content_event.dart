part of 'save_content_bloc.dart';

@freezed
class SaveContentEvent with _$SaveContentEvent {
  const factory SaveContentEvent.started() = _Started;
}

class SaveContentSaved implements SaveContentEvent {
  const SaveContentSaved({required this.saveContentParams});
  final SaveContentParams saveContentParams;
}
