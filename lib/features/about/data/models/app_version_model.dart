import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/features/about/domain/entities/app_version.dart';

part 'app_version_model.freezed.dart';
part 'app_version_model.g.dart';

@freezed
abstract class AppVersionModel with _$AppVersionModel implements AppVersion {
  const factory AppVersionModel({
    @JsonKey(defaultValue: '') required String version,
    @JsonKey(defaultValue: '') required String filename,
  }) = _AppVersionModel;

  const AppVersionModel._();

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      _$AppVersionModelFromJson(json);
}
