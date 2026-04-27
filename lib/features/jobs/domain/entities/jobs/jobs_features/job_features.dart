import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_abonnement_duration.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_abonnement_type.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_actor.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_gender.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

class JobFeatures {
  const JobFeatures({
    required this.categories,
    required this.locations,
    required this.genders,
    required this.actors,
    required this.abonnementTypes,
    required this.abonnementDurations,
  });

  const JobFeatures.empty({
    this.categories = const [],
    this.locations = const [],
    this.genders = const [],
    this.actors = const [],
    this.abonnementTypes = const [],
    this.abonnementDurations = const [],
  });

  final List<JobCategory> categories;
  final List<JobLocation> locations;
  final List<JobGender> genders;
  final List<JobActor> actors;
  final List<JobAbonnementType> abonnementTypes;
  final List<JobAbonnementDuration> abonnementDurations;
}
