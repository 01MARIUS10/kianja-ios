import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@freezed
abstract class JobModel with _$JobModel implements Job {
  const factory JobModel({
    required int id,
    required int userId,
    required String firstName,
    required String lastName,
    required String photo,
    required String title,
    required String description,
    required String createdAt,
  }) = _JobModel;

  const JobModel._();

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
}
