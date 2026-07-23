import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/features/jobs/domain/entities/files/job_image.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_actor.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_gender.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_preference.dart';

class JobOffer {
  const JobOffer({
    required this.id,
    required this.title,
    required this.description,
    required this.categories,
    required this.locations,
    this.image,
    this.images,
    // this.location,
    this.gender,
    this.actor,
    this.preference,
    required this.dateLimit,
    required this.candidatsCount,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.isFavorite,
    required this.alreadyPostuler,
  });

  const JobOffer.empty({
    this.id = -1,
    this.title = '',
    this.description = '',
    this.categories = const [],
    this.locations = const [],
    this.images = const [],
    this.image,
    // this.location,
    this.gender,
    this.actor,
    this.preference,
    this.dateLimit = '',
    this.candidatsCount = 0,
    this.status = '',
    this.user = const User.empty(),
    this.createdAt = '',
    this.isFavorite = false,
    this.alreadyPostuler = false,
  });

  final int id;
  final String title;
  final String description;
  final List<JobCategory> categories;
  final List<JobLocation> locations;
  final List<JobImage>? images;
  final JobImage? image;
  // final JobLocation? location;
  final JobGender? gender;
  final JobActor? actor;
  final JobPreference? preference;
  final String dateLimit;
  final int candidatsCount;
  final String status;
  final User user;
  final String createdAt;
  final bool isFavorite;
  final bool alreadyPostuler;
}
