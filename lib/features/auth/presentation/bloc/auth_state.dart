part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthRequestInProgress extends AuthState {
  const AuthRequestInProgress();

  @override
  List<Object> get props => [];
}

class AuthSignInSuccess extends AuthState {
  const AuthSignInSuccess({required this.token});
  final String token;

  @override
  List<Object> get props => [token];
}

class AuthSignUpSuccess extends AuthState {
  const AuthSignUpSuccess({required this.token});
  final String token;

  @override
  List<Object> get props => [token];
}

class AuthGetUserSuccess extends AuthState {
  const AuthGetUserSuccess({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class AuthRequestFailure extends AuthState {
  const AuthRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
