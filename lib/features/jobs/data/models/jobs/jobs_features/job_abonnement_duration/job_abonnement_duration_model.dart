import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_abonnement_duration.dart';

part 'job_abonnement_duration_model.freezed.dart';
part 'job_abonnement_duration_model.g.dart';

@freezed
abstract class JobAbonnementDurationModel
    with _$JobAbonnementDurationModel
    implements JobAbonnementDuration {
  const factory JobAbonnementDurationModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobAbonnementDurationModel;

  const JobAbonnementDurationModel._();

  factory JobAbonnementDurationModel.fromJson(Map<String, dynamic> json) =>
      _$JobAbonnementDurationModelFromJson(json);
}
