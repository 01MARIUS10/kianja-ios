abstract class Job {
  const Job.empty()
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
  final int id;
  final int userId;
  final String firstName;
  final String lastName;
  final String photo;
  final String title;
  final String description;
  final String createdAt;
}
