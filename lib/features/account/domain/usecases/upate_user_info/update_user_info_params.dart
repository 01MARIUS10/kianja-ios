class UpdateUserInfoParams {
  const UpdateUserInfoParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.pseudo,
    required this.residence,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String photo;
  final String pseudo;
  final String residence;
}
