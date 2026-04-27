import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_actor.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_gender.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

class JobOffer {
  const JobOffer({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.categories,
    this.location,
    this.gender,
    this.actor,
    required this.dateLimit,
    required this.status,
    required this.user,
    required this.createdAt,
  });

  const JobOffer.empty({
    this.id = -1,
    this.title = '',
    this.imageUrl = '',
    this.description = '',
    this.categories = const [],
    this.location,
    this.gender,
    this.actor,
    this.dateLimit = '',
    this.status = '',
    this.user = const User.empty(),
    this.createdAt = '',
  });

  final int id;
  final String title;
  final String imageUrl;
  final String description;
  final List<JobCategory> categories;
  final JobLocation? location;
  final JobGender? gender;
  final JobActor? actor;
  final String dateLimit;
  final String status;
  final User user;
  final String createdAt;
}
