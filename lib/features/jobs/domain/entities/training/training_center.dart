import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_actor.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';
import 'package:kianja/features/jobs/domain/entities/training/enum/training_center_badge.dart';

class TrainingCenter {
  const TrainingCenter({
    required this.id,
    required this.name,
    this.imageUrl,
    this.images,
    required this.description,
    required this.domains,
    this.actor,
    this.location,
    this.badge,
    required this.user,
    required this.createdAt,
  });

  const TrainingCenter.empty({
    this.id = -1,
    this.name = '',
    this.imageUrl,
    this.images = const [],
    this.description = '',
    this.domains = const [],
    this.actor,
    this.location,
    this.badge,
    this.user = const User.empty(),
    this.createdAt = '',
  });

  final int id;
  final String name;
  final String? imageUrl;
  final List<JobImage>? images;
  final String description;
  final List<JobDomain> domains;
  final JobActor? actor;
  final JobLocation? location;
  final TrainingCenterBadge? badge;
  final User user;
  final String createdAt;
}
