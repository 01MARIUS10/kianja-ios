import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';

part 'job_image_model.freezed.dart';
part 'job_image_model.g.dart';

@freezed
abstract class JobImageModel with _$JobImageModel implements JobImage {
  const factory JobImageModel({
    @JsonKey(name: 'id', defaultValue: -1) required int id,
    @JsonKey(defaultValue: '') required String name,
    @JsonKey(defaultValue: '') required String url,
    @JsonKey(name: 'url_min', defaultValue: '') required String urlMin,
  }) = _JobImageModel;

  const JobImageModel._();

  factory JobImageModel.fromJson(Map<String, dynamic> json) =>
      _$JobImageModelFromJson(json);
}
