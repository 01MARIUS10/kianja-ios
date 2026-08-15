import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/partner.dart';

part 'partner_model.freezed.dart';
part 'partner_model.g.dart';

@freezed
abstract class PartnerModel with _$PartnerModel implements Partner {
  const factory PartnerModel({
    @JsonKey(name: 'titre', defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String image,
    @JsonKey(name: 'url', defaultValue: '') required String pageUrl,
  }) = _PartnerModel;

  const PartnerModel._();

  factory PartnerModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerModelFromJson(json);
}
