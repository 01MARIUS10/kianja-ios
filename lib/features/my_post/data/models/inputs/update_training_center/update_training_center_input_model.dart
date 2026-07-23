import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_training_center_input_model.freezed.dart';
part 'update_training_center_input_model.g.dart';

@freezed
abstract class UpdateTrainingCenterInputModel
    with _$UpdateTrainingCenterInputModel {
  const factory UpdateTrainingCenterInputModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(defaultValue: -1) required int locationId,
    @JsonKey(defaultValue: -1) required int domainId,
    @JsonKey(name: 'image_ids') List<int>? imageIds,
    @JsonKey(defaultValue: -1) required int typeId,
    @JsonKey(defaultValue: -1) required int tagId,
    @JsonKey(defaultValue: -1) required int durationId,
    @JsonKey(defaultValue: 'published') required String status,
  }) = _UpdateTrainingCenterInputModel;

  const UpdateTrainingCenterInputModel._();

  factory UpdateTrainingCenterInputModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateTrainingCenterInputModelFromJson(json);
}
