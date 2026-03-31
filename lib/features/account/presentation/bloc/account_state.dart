part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class AccountRequestInProgress extends AccountState {}

class AccountLogoutSuccess extends AccountState {
  const AccountLogoutSuccess();
}

class AccountChangePasswordSuccess extends AccountState {
  const AccountChangePasswordSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class AccountRequestFailure extends AccountState {
  const AccountRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
