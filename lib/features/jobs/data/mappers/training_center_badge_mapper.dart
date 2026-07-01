import 'package:kianja/features/jobs/domain/entities/training/enum/training_center_badge.dart';

class TrainingCenterBadgeMapper {
  static TrainingCenterBadge fromString(String? type) {
    switch (type) {
      case 'vip':
        return TrainingCenterBadge.vip;
      case 'premium':
        return TrainingCenterBadge.premium;
      default:
        return TrainingCenterBadge.normal;
    }
  }

  static String toJson(TrainingCenterBadge type) {
    switch (type) {
      case TrainingCenterBadge.vip:
        return 'vip';
      case TrainingCenterBadge.premium:
        return 'premium';
      case TrainingCenterBadge.normal:
        return 'normal';
    }
  }
}
