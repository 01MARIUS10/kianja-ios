class User {
  const User.empty()
    : this(
        id: -1, // This mean that the user is empty
        firstName: '',
        lastName: '',
        photoUrl: '',
        email: '',
        phone: '',
        residence: '',
      );
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.photoUrl,
    required this.email,
    required this.phone,
    required this.residence,
  });
  final int id;
  final String firstName;
  final String lastName;
  final String photoUrl;
  final String email;
  final String phone;
  final String residence;
}
