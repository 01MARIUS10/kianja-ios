import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';

class ExpertExecutive {
  const ExpertExecutive({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.biography,
    required this.domain,
    required this.pdfUrl,
  });

  const ExpertExecutive.empty({
    this.id = -1,
    this.firstName = '',
    this.lastName = '',
    this.dateOfBirth = '',
    this.email = '',
    this.phoneNumber = '',
    this.address = '',
    this.biography = '',
    this.domain = const JobDomain.empty(),
    this.pdfUrl = '',
  });

  final int id;
  final String firstName;
  final String lastName;
  final String dateOfBirth;
  final String email;
  final String phoneNumber;
  final String address;
  final String biography;
  final JobDomain domain;
  final String pdfUrl;
}
