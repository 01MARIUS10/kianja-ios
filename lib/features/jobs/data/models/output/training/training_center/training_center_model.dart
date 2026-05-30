import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/features/jobs/data/models/output/files/job_image/job_image_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_actor/job_actor_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_domain/job_domain_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_location/job_location_model.dart';
import 'package:kianja/features/jobs/domain/entities/training/enum/training_center_badge.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

part 'training_center_model.freezed.dart';
part 'training_center_model.g.dart';

@freezed
abstract class TrainingCenterModel
    with _$TrainingCenterModel
    implements TrainingCenter {
  const factory TrainingCenterModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(name: 'image_path', defaultValue: '') String? imageUrl,
    @JsonKey(name: 'images', defaultValue: [])
    required List<JobImageModel> images,
    @JsonKey(defaultValue: '') required String description,
    required List<JobDomainModel> domains,
    JobActorModel? actor,
    JobLocationModel? location,
    TrainingCenterBadge? badge,
    @JsonKey(name: 'user') required UserModel user,
    @JsonKey(name: 'created_at', defaultValue: '') required String createdAt,
  }) = _TrainingCenterModel;

  const TrainingCenterModel._();

  factory TrainingCenterModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingCenterModelFromJson(json);
}
