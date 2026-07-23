import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/spons_partner.dart';

part 'spons_partner_model.freezed.dart';
part 'spons_partner_model.g.dart';

@freezed
abstract class SponsPartnerModel
    with _$SponsPartnerModel
    implements SponsPartner {
  const factory SponsPartnerModel({
    @JsonKey(name: 'titre', defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(name: 'url', defaultValue: '') required String pageUrl,
  }) = _SponsPartnerModel;

  const SponsPartnerModel._();

  factory SponsPartnerModel.fromJson(Map<String, dynamic> json) =>
      _$SponsPartnerModelFromJson(json);
}
