import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_tag.dart';

part 'training_tag_model.freezed.dart';
part 'training_tag_model.g.dart';

@freezed
abstract class TrainingTagModel with _$TrainingTagModel implements TrainingTag {
  const factory TrainingTagModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String tag,
  }) = _TrainingTagModel;

  const TrainingTagModel._();

  factory TrainingTagModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingTagModelFromJson(json);
}
