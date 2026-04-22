class JobOffer {
  const JobOffer({
    required this.id,
    required this.userId,
    required this.userFirstName,
    required this.userLastName,
    required this.userPhoto,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.categories,
    required this.location,
    required this.gender,
    required this.actor,
    required this.limitDate,
    required this.createdAt,
  });

  const JobOffer.empty({
    this.id = -1,
    this.userId = -1,
    this.userFirstName = '',
    this.userLastName = '',
    this.userPhoto = '',
    this.title = '',
    this.description = '',
    this.createdAt = '',
    this.gender = '',
    this.location = '',
    this.actor = '',
    this.limitDate = '',
    this.categories = const [],
    this.imageUrl = '',
  });

  final int id;
  final int userId;
  final String userFirstName;
  final String userLastName;
  final String userPhoto;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> categories;
  final String location;
  final String gender;
  final String actor;
  final String limitDate;
  final String createdAt;
}
