import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_name.dart';

part 'training_name_model.freezed.dart';
part 'training_name_model.g.dart';

@freezed
abstract class TrainingNameModel
    with _$TrainingNameModel
    implements TrainingName {
  const factory TrainingNameModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String name,
  }) = _TrainingNameModel;

  const TrainingNameModel._();

  factory TrainingNameModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingNameModelFromJson(json);
}
