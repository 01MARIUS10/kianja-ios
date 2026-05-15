import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

class TrainingCenterViewCategory {
  const TrainingCenterViewCategory({
    required this.vip,
    required this.premium,
    required this.normal,
  });

  const TrainingCenterViewCategory.empty({
    this.vip = const [],
    this.premium = const [],
    this.normal = const [],
  });

  final List<TrainingCenter> vip;
  final List<TrainingCenter> premium;
  final List<TrainingCenter> normal;
}
