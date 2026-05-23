import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/data/models/output/jobs/jobs_features/job_domain/job_domain_model.dart';
import 'package:kianja/features/jobs/domain/entities/expert_executive/expert_executive.dart';

part 'expert_executive_model.freezed.dart';
part 'expert_executive_model.g.dart';

@freezed
abstract class ExpertExecutiveModel
    with _$ExpertExecutiveModel
    implements ExpertExecutive {
  const factory ExpertExecutiveModel({
    @JsonKey(defaultValue: -1) required int id,
    @JsonKey(name: 'firstname', defaultValue: '') required String firstName,
    @JsonKey(name: 'lastname', defaultValue: '') required String lastName,
    @JsonKey(name: 'date_of_birth', defaultValue: '')
    required String dateOfBirth,
    @JsonKey(defaultValue: '') required String email,
    @JsonKey(name: 'phone_number', defaultValue: '')
    required String phoneNumber,
    @JsonKey(defaultValue: '') required String address,
    @JsonKey(defaultValue: '') required String biography,
    required JobDomainModel domain,
    @JsonKey(name: 'cv_pdf_url', defaultValue: '') required String pdfUrl,
  }) = _ExpertExecutiveModel;

  const ExpertExecutiveModel._();

  factory ExpertExecutiveModel.fromJson(Map<String, dynamic> json) =>
      _$ExpertExecutiveModelFromJson(json);
}
