import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_duration/job_duration_model.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_type/job_type_model.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';

part 'price_plan_model.freezed.dart';
part 'price_plan_model.g.dart';

@freezed
abstract class PricePlanModel with _$PricePlanModel implements PricePlan {
  const factory PricePlanModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(defaultValue: 0) required int price,
    required JobTypeModel type,
    required JobDurationModel duration,
  }) = _PricePlanModel;

  const PricePlanModel._();

  factory PricePlanModel.fromJson(Map<String, dynamic> json) =>
      _$PricePlanModelFromJson(json);
}
