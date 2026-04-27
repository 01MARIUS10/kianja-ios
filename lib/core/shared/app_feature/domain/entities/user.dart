class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.phone,
    required this.email,
    required this.residence,
    required this.createdAt,
  });
  const User.empty({
    this.id = -1,
    this.firstName = '',
    this.lastName = '',
    this.photoUrl = '',
    this.phone = '',
    this.email = '',
    this.residence = '',
    this.createdAt = '',
  });
  final int id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String phone;
  final String email;
  final String residence;
  final String createdAt;
}
