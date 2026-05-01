import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_abonnement_duration/job_abonnement_duration_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_abonnement_type/job_abonnement_type_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_actor/job_actor_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_category/job_category_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_domain/job_domain_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_gender/job_gender_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_location/job_location_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';

part 'job_features_model.freezed.dart';
part 'job_features_model.g.dart';

@freezed
abstract class JobFeaturesModel with _$JobFeaturesModel implements JobFeatures {
  const factory JobFeaturesModel({
    @JsonKey(name: 'Category', defaultValue: [])
    required List<JobCategoryModel> categories,
    @JsonKey(name: 'Domain', defaultValue: [])
    required List<JobDomainModel> domains,
    @JsonKey(name: 'Location', defaultValue: [])
    required List<JobLocationModel> locations,
    @JsonKey(name: 'Gender', defaultValue: [])
    required List<JobGenderModel> genders,
    @JsonKey(name: 'Actor', defaultValue: [])
    required List<JobActorModel> actors,
    @JsonKey(name: 'AbonnementType', defaultValue: [])
    required List<JobAbonnementTypeModel> abonnementTypes,
    @JsonKey(name: 'AbonnementDuration', defaultValue: [])
    required List<JobAbonnementDurationModel> abonnementDurations,
  }) = _JobFeaturesModel;

  const JobFeaturesModel._();

  factory JobFeaturesModel.fromJson(Map<String, dynamic> json) =>
      _$JobFeaturesModelFromJson(json);
}
