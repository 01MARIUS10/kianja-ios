class JobApplicant {
  const JobApplicant({
    required this.id,
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userPhoto,
    required this.title,
    required this.motivation,
    required this.categories,
    required this.location,
    required this.gender,
    required this.pdfUrl,
    required this.createdAt,
  });

  const JobApplicant.empty({
    this.id = -1,
    this.userId = -1,
    this.userFirstName = '',
    this.userLastName = '',
    this.userPhoto = '',
    this.title = '',
    this.motivation = '',
    this.gender = '',
    this.location = '',
    this.pdfUrl = '',
    this.createdAt = '',
    this.categories = const [],
  });

  final int id;
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String userPhoto;
  final String title;
  final String motivation;
  final List<String> categories;
  final String location;
  final String gender;
  final String pdfUrl;
  final String createdAt;
}
