import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';

part 'training_center_filter_model.freezed.dart';
part 'training_center_filter_model.g.dart';

@freezed
abstract class TrainingCenterFilterModel
    with _$TrainingCenterFilterModel
    implements TrainingCenterFilter {
  const factory TrainingCenterFilterModel({
    @JsonKey(defaultValue: '') required String query,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(name: 'data', defaultValue: [])
    required List<TrainingCenterModel> trainingCenters,
  }) = _TrainingCenterFilterModel;

  const TrainingCenterFilterModel._();

  factory TrainingCenterFilterModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingCenterFilterModelFromJson(json);
}
