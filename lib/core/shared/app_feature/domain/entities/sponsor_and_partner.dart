import 'package:kianja/core/shared/app_feature/domain/entities/partner.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/sponsor.dart';

class SponsorAndPartner {
  const SponsorAndPartner({this.sponsor, this.partner});
  const SponsorAndPartner.empty({this.sponsor, this.partner});
  final Sponsor? sponsor;
  final Partner? partner;
}
