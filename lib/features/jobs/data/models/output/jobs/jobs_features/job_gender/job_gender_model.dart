import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_gender.dart';

part 'job_gender_model.freezed.dart';
part 'job_gender_model.g.dart';

@freezed
abstract class JobGenderModel with _$JobGenderModel implements JobGender {
  const factory JobGenderModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobGenderModel;

  const JobGenderModel._();

  factory JobGenderModel.fromJson(Map<String, dynamic> json) =>
      _$JobGenderModelFromJson(json);
}
