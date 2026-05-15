import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';

part 'hot_event_model.freezed.dart';
part 'hot_event_model.g.dart';

@freezed
abstract class HotEventModel with _$HotEventModel implements HotEvent {
  const factory HotEventModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'start_date', defaultValue: '') required String startDate,
    @JsonKey(name: 'end_date', defaultValue: '') required String endDate,
    @JsonKey(defaultValue: '') required String type,
    @JsonKey(name: 'image', defaultValue: '') required String imageUrl,
    @JsonKey(name: 'training_center') required TrainingCenterModel center,
  }) = _HotEventModel;

  const HotEventModel._();

  factory HotEventModel.fromJson(Map<String, dynamic> json) =>
      _$HotEventModelFromJson(json);
}
