import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';

class JobOfferFilter {
  const JobOfferFilter({
    required this.query,
    required this.name,
    required this.jobOffers,
  });

  const JobOfferFilter.empty({
    this.query = '',
    this.name = '',
    this.jobOffers = const [],
  });

  final String query;
  final String name;
  final List<JobOffer> jobOffers;
}
