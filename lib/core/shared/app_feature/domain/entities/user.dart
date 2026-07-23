class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.cvUrl,
    required this.phone,
    required this.email,
    required this.residence,
    required this.dateCandidature,
    required this.createdAt,
  });
  const User.empty({
    this.id = -1,
    this.firstName = '',
    this.lastName = '',
    this.photoUrl = '',
    this.cvUrl = '',
    this.phone = '',
    this.email = '',
    this.residence = '',
    this.dateCandidature = '',
    this.createdAt = '',
  });
  final int id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String cvUrl;
  final String phone;
  final String email;
  final String residence;
  final String dateCandidature;
  final String createdAt;
}
