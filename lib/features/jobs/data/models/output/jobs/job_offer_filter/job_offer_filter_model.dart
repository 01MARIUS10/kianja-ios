import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/job_offer/job_offer_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';

part 'job_offer_filter_model.freezed.dart';
part 'job_offer_filter_model.g.dart';

@freezed
abstract class JobOfferFilterModel
    with _$JobOfferFilterModel
    implements JobOfferFilter {
  const factory JobOfferFilterModel({
    @JsonKey(defaultValue: '') required String query,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(name: 'data', defaultValue: [])
    required List<JobOfferModel> jobOffers,
  }) = _JobOfferFilterModel;

  const JobOfferFilterModel._();

  factory JobOfferFilterModel.fromJson(Map<String, dynamic> json) =>
      _$JobOfferFilterModelFromJson(json);
}
