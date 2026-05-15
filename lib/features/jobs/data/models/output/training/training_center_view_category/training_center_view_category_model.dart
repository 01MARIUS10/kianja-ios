import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/training/training_center/training_center_model.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_view_all_category.dart';

part 'training_center_view_category_model.freezed.dart';
part 'training_center_view_category_model.g.dart';

@freezed
abstract class TrainingCenterViewCategoryModel
    with _$TrainingCenterViewCategoryModel
    implements TrainingCenterViewCategory {
  const factory TrainingCenterViewCategoryModel({
    @JsonKey(name: 'Vip', defaultValue: [])
    required List<TrainingCenterModel> vip,
    @JsonKey(name: 'Premium', defaultValue: [])
    required List<TrainingCenterModel> premium,
    @JsonKey(name: 'Normal', defaultValue: [])
    required List<TrainingCenterModel> normal,
  }) = _TrainingCenterViewCategoryModel;

  const TrainingCenterViewCategoryModel._();

  factory TrainingCenterViewCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingCenterViewCategoryModelFromJson(json);
}
