import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/sponsor.dart';

part 'sponsor_model.freezed.dart';
part 'sponsor_model.g.dart';

@freezed
abstract class SponsorModel with _$SponsorModel implements Sponsor {
  const factory SponsorModel({
    @JsonKey(name: 'titre', defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(name: 'url', defaultValue: '') required String pageUrl,
  }) = _SponsorModel;

  const SponsorModel._();

  factory SponsorModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorModelFromJson(json);
}
