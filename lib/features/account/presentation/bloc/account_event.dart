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
