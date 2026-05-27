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

class AccountUpdateUserInfoSuccess extends AccountState {
  const AccountUpdateUserInfoSuccess({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class AccountWalletHistorySuccess extends AccountState {
  const AccountWalletHistorySuccess({
    required this.history,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<KaraHistory> history;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [history, hasMore, isLoadMore];
}

class AccountCguSuccess extends AccountState {
  const AccountCguSuccess({required this.cgu});
  final String cgu;

  @override
  List<Object> get props => [cgu];
}

class AccountRequestFailure extends AccountState {
  const AccountRequestFailure({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
