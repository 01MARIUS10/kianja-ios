import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_duration.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_type.dart';

class JobApplicantPlan {
  const JobApplicantPlan({
    required this.id,
    required this.price,
    required this.type,
    required this.duration,
  });

  const JobApplicantPlan.empty({
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
