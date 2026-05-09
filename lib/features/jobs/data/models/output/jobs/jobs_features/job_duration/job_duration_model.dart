import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_duration.dart';

part 'job_duration_model.freezed.dart';
part 'job_duration_model.g.dart';

@freezed
abstract class JobDurationModel with _$JobDurationModel implements JobDuration {
  const factory JobDurationModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String duration,
  }) = _JobDurationModel;

  const JobDurationModel._();

  factory JobDurationModel.fromJson(Map<String, dynamic> json) =>
      _$JobDurationModelFromJson(json);
}
