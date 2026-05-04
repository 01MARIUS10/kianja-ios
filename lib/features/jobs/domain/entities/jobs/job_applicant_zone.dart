import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';

class JobApplicantZone {
  const JobApplicantZone({
    required this.query,
    required this.name,
    required this.jobApplicants,
  });

  const JobApplicantZone.empty({
    this.query = '',
    this.name = '',
    this.jobApplicants = const [],
  });

  final String query;
  final String name;
  final List<JobApplicant> jobApplicants;
}
