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

class AccountProfilPhotoRequestInProgress extends AccountState {}

class AccountProfilPhotoUploadSuccess extends AccountState {
  const AccountProfilPhotoUploadSuccess();
}

class AccountProfilPhotoDeleteSuccess extends AccountState {
  const AccountProfilPhotoDeleteSuccess();
}

class AccountProfilCVRequestInProgress extends AccountState {}

class AccountProfilCVUploadSuccess extends AccountState {
  const AccountProfilCVUploadSuccess();
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

class AccountBlockedUsersSuccess extends AccountState {
  const AccountBlockedUsersSuccess({
    required this.users,
    required this.hasMore,
    this.isLoadMore = false,
  });

  final List<User> users;
  final bool hasMore;
  final bool isLoadMore;

  @override
  List<Object> get props => [users, hasMore, isLoadMore];
}

class AccountUnblockUserSuccess extends AccountState {
  const AccountUnblockUserSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class AccountSendComplaintsSuggestionsSuccess extends AccountState {
  const AccountSendComplaintsSuggestionsSuccess({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

class AccountCguSuccess extends AccountState {
  const AccountCguSuccess({required this.cgu});
  final String cgu;

  @override
  List<Object> get props => [cgu];
}

class AccountPrivacySuccess extends AccountState {
  const AccountPrivacySuccess({required this.privacy});
  final String privacy;

  @override
  List<Object> get props => [privacy];
}

class AccountKaraRequestInProgress extends AccountState {}

class AccountKaraSuccess extends AccountState {
  const AccountKaraSuccess({required this.kara});
  final int kara;

  @override
  List<Object> get props => [kara];
}

class AccountKaraFailure extends AccountState {
  const AccountKaraFailure({required this.message});
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
