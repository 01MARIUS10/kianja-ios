import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';

part 'job_category_model.freezed.dart';
part 'job_category_model.g.dart';

@freezed
abstract class JobCategoryModel with _$JobCategoryModel implements JobCategory {
  const factory JobCategoryModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobCategoryModel;

  const JobCategoryModel._();

  factory JobCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$JobCategoryModelFromJson(json);
}
