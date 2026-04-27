import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_actor.dart';

part 'job_actor_model.freezed.dart';
part 'job_actor_model.g.dart';

@freezed
abstract class JobActorModel with _$JobActorModel implements JobActor {
  const factory JobActorModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(name: 'nom', defaultValue: '') required String name,
  }) = _JobActorModel;

  const JobActorModel._();

  factory JobActorModel.fromJson(Map<String, dynamic> json) =>
      _$JobActorModelFromJson(json);
}
