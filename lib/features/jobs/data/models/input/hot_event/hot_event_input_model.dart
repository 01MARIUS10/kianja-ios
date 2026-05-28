import 'package:freezed_annotation/freezed_annotation.dart';

part 'hot_event_input_model.freezed.dart';
part 'hot_event_input_model.g.dart';

@freezed
abstract class HotEventInputModel with _$HotEventInputModel {
  const factory HotEventInputModel({
    @JsonKey(name: 'training_center_id', defaultValue: -1)
    required int trainingCenterId,
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String type,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'image_id') int? imageId,
    @JsonKey(name: 'start_date', defaultValue: '') required String startDate,
    @JsonKey(name: 'end_date', defaultValue: '') required String endDate,
  }) = _HotEventInputModel;

  const HotEventInputModel._();

  factory HotEventInputModel.fromJson(Map<String, dynamic> json) =>
      _$HotEventInputModelFromJson(json);
}
