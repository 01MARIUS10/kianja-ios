import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_training_center_input_model.freezed.dart';
part 'create_training_center_input_model.g.dart';

@freezed
abstract class CreateTrainingCenterInputModel
    with _$CreateTrainingCenterInputModel {
  const factory CreateTrainingCenterInputModel({
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(defaultValue: -1) required int locationId,
    @JsonKey(name: 'image_ids') List<int>? imageIds,
    @JsonKey(defaultValue: []) required List<int> domainIds,
    @JsonKey(defaultValue: -1) required int actorId,
    @JsonKey(defaultValue: -1) required int typeId,
    @JsonKey(defaultValue: -1) required int tagId,
    @JsonKey(defaultValue: -1) required int durationId,
    @JsonKey(defaultValue: 'published') required String status,
  }) = _CreateTrainingCenterInputModel;

  const CreateTrainingCenterInputModel._();

  factory CreateTrainingCenterInputModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTrainingCenterInputModelFromJson(json);
}
