import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';

part 'job_domain_model.freezed.dart';
part 'job_domain_model.g.dart';

@freezed
abstract class JobDomainModel with _$JobDomainModel implements JobDomain {
  const factory JobDomainModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
    required String icon,
  }) = _JobDomainModel;

  const JobDomainModel._();

  factory JobDomainModel.fromJson(Map<String, dynamic> json) =>
      _$JobDomainModelFromJson(json);
}
