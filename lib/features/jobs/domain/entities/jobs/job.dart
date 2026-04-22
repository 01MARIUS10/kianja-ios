abstract class Job {
  const Job({
    required this.id,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.title,
    required this.description,
    required this.createdAt,
  });
  const Job.empty({
    this.id = -1,
    this.userId = -1,
    this.firstName = '',
    this.lastName = '',
    this.photo = '',
    this.title = '',
    this.description = '',
    this.createdAt = '',
  });
  final int id;
  final int userId;
  final String firstName;
  final String lastName;
  final String photo;
  final String title;
  final String description;
  final String createdAt;
}
