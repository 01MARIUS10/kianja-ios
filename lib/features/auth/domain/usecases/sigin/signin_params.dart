class SignInParams {
  const SignInParams({
    required this.phone,
    required this.password,
    required this.stayLogged,
  });
  final String phone;
  final String password;
  final bool stayLogged;
}
