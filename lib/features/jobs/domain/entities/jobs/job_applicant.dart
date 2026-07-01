import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_gender.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

class JobApplicant {
  const JobApplicant({
    required this.id,
    required this.title,
    required this.motivation,
    required this.location,
    this.gender,
    this.pdfUrl,
    required this.createdAt,
    required this.user,
    this.category,
  });

  const JobApplicant.empty({
    this.id = -1,
    this.title = '',
    this.motivation = '',
    this.location = const JobLocation.empty(),
    this.gender,
    this.pdfUrl,
    this.createdAt = '',
    this.user = const User.empty(),
    this.category,
  });

  final int id;
  final String title;
  final String motivation;
  final JobLocation location;
  final JobGender? gender;
  final String? pdfUrl;
  final String createdAt;
  final User user;
  final JobCategory? category;
}
