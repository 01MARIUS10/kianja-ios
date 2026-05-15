import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_actor.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

class TrainingCenter {
  const TrainingCenter({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.description,
    this.category,
    this.actor,
    this.location,
    required this.user,
    required this.createdAt,
  });

  const TrainingCenter.empty({
    this.id = -1,
    this.name = '',
    this.imageUrl,
    this.description = '',
    this.category,
    this.actor,
    this.location,
    this.user = const User.empty(),
    this.createdAt = '',
  });

  final int id;
  final String name;
  final String? imageUrl;
  final String description;
  final JobCategory? category;
  final JobActor? actor;
  final JobLocation? location;
  final User user;
  final String createdAt;
}
