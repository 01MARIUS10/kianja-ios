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
  const AccountChangePasswordRequested({required this.changePasswordParams});
  final ChangePasswordParams changePasswordParams;

  @override
  List<Object> get props => [changePasswordParams];
}

class AccountUpdateUserInfoRequested extends AccountEvent {
  const AccountUpdateUserInfoRequested({required this.updateUserInfoParams});
  final UpdateUserInfoParams updateUserInfoParams;

  @override
  List<Object> get props => [updateUserInfoParams];
}
