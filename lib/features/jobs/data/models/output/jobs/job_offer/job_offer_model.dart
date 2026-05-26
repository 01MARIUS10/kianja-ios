import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/data/models/user/user_model.dart';
import 'package:kianja/features/jobs/data/models/output/files/job_image/job_image_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_actor/job_actor_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_category/job_category_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_gender/job_gender_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_location/job_location_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';

part 'job_offer_model.freezed.dart';
part 'job_offer_model.g.dart';

@freezed
abstract class JobOfferModel with _$JobOfferModel implements JobOffer {
  const factory JobOfferModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(name: 'categories', defaultValue: <JobCategoryModel>[])
    required List<JobCategoryModel> categories,
    JobImageModel? image,
    JobLocationModel? location,
    JobGenderModel? gender,
    JobActorModel? actor,
    @JsonKey(name: 'date_limit', defaultValue: '') required String dateLimit,
    @JsonKey(name: 'status', defaultValue: '') required String status,
    @JsonKey(name: 'user') required UserModel user,
    @JsonKey(name: 'created_at', defaultValue: '') required String createdAt,
  }) = _JobOfferModel;

  const JobOfferModel._();

  factory JobOfferModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferModelFromJson(json);
}
