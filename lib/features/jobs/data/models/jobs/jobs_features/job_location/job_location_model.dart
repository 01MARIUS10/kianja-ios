import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

part 'job_location_model.freezed.dart';
part 'job_location_model.g.dart';

@freezed
abstract class JobLocationModel with _$JobLocationModel implements JobLocation {
  const factory JobLocationModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobLocationModel;

  const JobLocationModel._();

  factory JobLocationModel.fromJson(Map<String, dynamic> json) =>
      _$JobLocationModelFromJson(json);
}
