import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';

class JobApplicant {
  const JobApplicant({
    required this.id,
    required this.title,
    required this.motivation,
    required this.location,
    required this.gender,
    required this.pdfUrl,
    required this.createdAt,
    required this.user,
    required this.categories,
  });

  const JobApplicant.empty({
    this.id = -1,
    this.title = '',
    this.motivation = '',
    this.location = '',
    this.gender = '',
    this.pdfUrl = '',
    this.createdAt = '',
    this.user = const User.empty(),
    this.categories = const [],
  });

  final int id;
  final String title;
  final String motivation;
  final String location;
  final String gender;
  final String pdfUrl;
  final String createdAt;
  final User user;
  final List<String> categories;
}
