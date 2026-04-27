import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_abonnement_type.dart';

part 'job_abonnement_type_model.freezed.dart';
part 'job_abonnement_type_model.g.dart';

@freezed
abstract class JobAbonnementTypeModel
    with _$JobAbonnementTypeModel
    implements JobAbonnementType {
  const factory JobAbonnementTypeModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobAbonnementTypeModel;

  const JobAbonnementTypeModel._();

  factory JobAbonnementTypeModel.fromJson(Map<String, dynamic> json) =>
      _$JobAbonnementTypeModelFromJson(json);
}
