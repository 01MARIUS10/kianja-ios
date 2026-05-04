class SignUpParams {
  const SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.genre,
    required this.phone,
    required this.birthDate,
    required this.residence,
    required this.email,
    required this.password,
  });
  final String firstName;
  final String lastName;
  final String genre;
  final String phone;
  final int birthDate;
  final String residence;
  final String email;
  final String password;
}
