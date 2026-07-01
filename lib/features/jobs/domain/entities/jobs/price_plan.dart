import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_duration.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_type.dart';

class PricePlan {
  const PricePlan({
    required this.id,
    required this.price,
    required this.type,
    required this.duration,
  });

  const PricePlan.empty({
    this.id = -1,
    this.price = 0,
    this.type = const JobType.empty(),
    this.duration = const JobDuration.empty(),
  });

  final int id;
  final int price;
  final JobType type;
  final JobDuration duration;
}
