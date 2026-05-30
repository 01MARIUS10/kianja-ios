import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';

class TrainingCenterViewDomain {
  const TrainingCenterViewDomain({
    required this.vip,
    required this.premium,
    required this.normal,
  });

  const TrainingCenterViewDomain.empty({
    this.vip = const [],
    this.premium = const [],
    this.normal = const [],
  });

  final List<TrainingCenter> vip;
  final List<TrainingCenter> premium;
  final List<TrainingCenter> normal;
}
