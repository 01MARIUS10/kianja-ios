import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_gender.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

class JobApplicant {
  const JobApplicant({
    required this.id,
    required this.title,
    required this.motivation,
    // required this.location,
    required this.locations,
    required this.categories,
    this.gender,
    this.photoUrl,
    this.pdfUrl,
    required this.createdAt,
    required this.user,
    // this.category,
    required this.isFavorite,
  });

  const JobApplicant.empty({
    this.id = -1,
    this.title = '',
    this.motivation = '',
    this.categories = const [],
    this.locations = const [],
    // this.location = const JobLocation.empty(),
    this.gender,
    this.photoUrl,
    this.pdfUrl,
    this.createdAt = '',
    this.user = const User.empty(),
    // this.category,
    this.isFavorite = false,
  });

  final int id;
  final String title;
  final String motivation;
  final List<JobCategory> categories;
  final List<JobLocation> locations;
  // final JobLocation location;
  final JobGender? gender;
  final String? photoUrl;
  final String? pdfUrl;
  final String createdAt;
  final User user;
  // final JobCategory? category;
  final bool isFavorite;
}
