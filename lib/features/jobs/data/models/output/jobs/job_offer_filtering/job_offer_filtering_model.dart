import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_category/job_category_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_location/job_location_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filtering.dart';

part 'job_offer_filtering_model.freezed.dart';
part 'job_offer_filtering_model.g.dart';

@freezed
abstract class JobOfferFilteringModel
    with _$JobOfferFilteringModel
    implements JobOfferFiltering {
  const factory JobOfferFilteringModel({
    @JsonKey(defaultValue: []) required List<JobCategoryModel> categories,
    @JsonKey(defaultValue: []) required List<JobLocationModel> locations,
  }) = _JobOfferFilteringModel;

  const JobOfferFilteringModel._();

  factory JobOfferFilteringModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferFilteringModelFromJson(json);
}
