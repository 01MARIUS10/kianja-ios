import 'package:kianja/features/jobs/domain/entities/jobs/job.dart';

class JobOffer extends Job {
  const JobOffer({
    required super.id,
    required super.userId,
    required super.firstName,
    required super.lastName,
    required super.photo,
    required super.title,
    required super.description,
    required super.createdAt,
  });
  const JobOffer.empty()
    : this(
        id: -1,
        userId: -1,
        firstName: '',
        lastName: '',
        photo: '',
        title: '',
        description: '',
        createdAt: '',
      );
}
