import 'package:kianja/features/auth/data/models/input/signin/signin_input_model.dart';
import 'package:kianja/features/auth/data/models/input/signup/signup_input_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signIn({required SignInInputModel signInInputModel});
  Future<String> signUp({required SignUpInputModel signUpInputModel});
}
