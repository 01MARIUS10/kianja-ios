part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountLogoutRequested extends AccountEvent {
  const AccountLogoutRequested();
}

class AccountChangePasswordRequested extends AccountEvent {
  const AccountChangePasswordRequested({
    required this.oldPassword,
    required this.newPassword,
  });

  final String oldPassword;
  final String newPassword;

  @override
  List<Object> get props => [oldPassword, newPassword];
}

class AccountUpdateUserInfoRequested extends AccountEvent {
  const AccountUpdateUserInfoRequested({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.genre,
    required this.pseudo,
    required this.residence,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String photo;
  final String genre;
  final String pseudo;
  final String residence;

  @override
  List<Object> get props => [
    firstName,
    lastName,
    email,
    photo,
    genre,
    pseudo,
    residence,
  ];
}
