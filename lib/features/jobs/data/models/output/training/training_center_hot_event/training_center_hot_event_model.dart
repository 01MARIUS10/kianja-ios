import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/training/hot_event/hot_event_model.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';

part 'training_center_hot_event_model.freezed.dart';
part 'training_center_hot_event_model.g.dart';

@freezed
abstract class TrainingCenterHotEventModel
    with _$TrainingCenterHotEventModel
    implements TrainingCenterHotEvent {
  const factory TrainingCenterHotEventModel({
    @JsonKey(defaultValue: '') required String query,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(name: 'data', defaultValue: [])
    required List<HotEventModel> hotEvents,
  }) = _TrainingCenterHotEventModel;

  const TrainingCenterHotEventModel._();

  factory TrainingCenterHotEventModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingCenterHotEventModelFromJson(json);
}
