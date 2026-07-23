import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/data/models/partner/partner_model.dart';
import 'package:kianja/core/shared/app_feature/data/models/sponsor/sponsor_model.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/sponsor_and_partner.dart';

part 'sponsor_and_partner_model.freezed.dart';
part 'sponsor_and_partner_model.g.dart';

@freezed
abstract class SponsorAndPartnerModel
    with _$SponsorAndPartnerModel
    implements SponsorAndPartner {
  const factory SponsorAndPartnerModel({
    @JsonKey(name: 'sponsor') SponsorModel? sponsor,
    @JsonKey(name: 'partenaire') PartnerModel? partner,
  }) = _SponsorAndPartnerModel;

  const SponsorAndPartnerModel._();

  factory SponsorAndPartnerModel.fromJson(Map<String, dynamic> json) =>
      _$SponsorAndPartnerModelFromJson(json);
}
