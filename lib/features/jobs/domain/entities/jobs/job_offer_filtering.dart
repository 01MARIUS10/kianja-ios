import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_location.dart';

class JobOfferFiltering {
  const JobOfferFiltering({required this.categories, required this.locations});

  const JobOfferFiltering.empty({
    this.categories = const [],
    this.locations = const [],
  });

  final List<JobCategory> categories;
  final List<JobLocation> locations;
}
