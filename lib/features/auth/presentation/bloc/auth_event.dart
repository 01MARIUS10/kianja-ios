part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested({required this.signInParams});
  final SignInParams signInParams;

  @override
  List<Object> get props => [signInParams];
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested({required this.signUpParams});
  final SignUpParams signUpParams;

  @override
  List<Object> get props => [signUpParams];
}

class AuthGetUserRequested extends AuthEvent {
  const AuthGetUserRequested();

  @override
  List<Object> get props => [];
}
