import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_type.dart';

part 'job_type_model.freezed.dart';
part 'job_type_model.g.dart';

@freezed
abstract class JobTypeModel with _$JobTypeModel implements JobType {
  const factory JobTypeModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobTypeModel;

  const JobTypeModel._();

  factory JobTypeModel.fromJson(Map<String, dynamic> json) =>
      _$JobTypeModelFromJson(json);
}
