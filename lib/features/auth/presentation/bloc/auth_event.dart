part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInRequested extends AuthEvent {
  const AuthSignInRequested({
    required this.phone,
    required this.password,
    required this.stayLogged,
  });
  final String phone;
  final String password;
  final bool stayLogged;

  @override
  List<Object> get props => [phone, password, stayLogged];
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested({
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

  @override
  List<Object> get props => [
    firstName,
    lastName,
    genre,
    phone,
    birthDate,
    residence,
    email,
    password,
  ];
}

class AuthGetUserRequested extends AuthEvent {
  const AuthGetUserRequested();

  @override
  List<Object> get props => [];
}
