import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_preference.dart';

part 'job_preference_model.freezed.dart';
part 'job_preference_model.g.dart';

@freezed
abstract class JobPreferenceModel
    with _$JobPreferenceModel
    implements JobPreference {
  const factory JobPreferenceModel({
    @JsonKey(name: 'showButton', defaultValue: false)
    required bool showPostButton,
  }) = _JobPreferenceModel;

  const JobPreferenceModel._();

  factory JobPreferenceModel.fromJson(Map<String, dynamic> json) =>
      _$JobPreferenceModelFromJson(json);
}
