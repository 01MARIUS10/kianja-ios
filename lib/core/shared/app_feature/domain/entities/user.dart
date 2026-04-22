class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.email,
    required this.phone,
    required this.genre,
    required this.pseudo,
    required this.residence,
  });
  const User.empty({
    this.id = -1,
    this.firstName = '',
    this.lastName = '',
    this.photoUrl = '',
    this.email = '',
    this.phone = '',
    this.genre = '',
    this.pseudo = '',
    this.residence = '',
  });
  final int id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String email;
  final String phone;
  final String genre;
  final String pseudo;
  final String residence;
}
