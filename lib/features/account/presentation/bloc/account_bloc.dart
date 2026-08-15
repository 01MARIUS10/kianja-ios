import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/domain/usecases/blocked_users/blocked_users_usecase.dart';
import 'package:kianja/features/account/domain/usecases/cgu_usecase.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_usecase.dart';
import 'package:kianja/features/account/domain/usecases/complaints_suggestions/complaints_suggestions_params.dart';
import 'package:kianja/features/account/domain/usecases/complaints_suggestions/complaints_suggestions_usecase.dart';
import 'package:kianja/features/account/domain/usecases/delete_profil_photo_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_all_kara_history_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_kara_usecase.dart';
import 'package:kianja/features/account/domain/usecases/logout_usecase.dart';
import 'package:kianja/features/account/domain/usecases/privacy_usecase.dart';
import 'package:kianja/features/account/domain/usecases/unblock_user/unblock_user_params.dart';
import 'package:kianja/features/account/domain/usecases/unblock_user/unblock_user_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_cv/upload_profil_cv_params.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_cv/upload_profil_cv_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_photo/upload_profil_photo_params.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_photo/upload_profil_photo_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({
    required this._appSharedPrefs,
    required this._logoutUseCase,
    required this._changePasswordUseCase,
    required this._updateUserInfoUseCase,
    required this._cguUseCase,
    required this._privacyUseCase,
    required this._getAllKaraHistoryUsecase,
    required this._getKaraUseCase,
    required this._uploadProfilPhotoUseCase,
    required this._deleteProfilPhotoUseCase,
    required this._uploadProfilCVUseCase,
    required this._complaintsSuggestionsUseCase,
    required this._blockedUsersUseCase,
    required this._unblockUserUseCase,
  }) : super(AccountInitial()) {
    on<AccountLogoutRequested>(_onLogoutRequested);
    on<AccountChangePasswordRequested>(_onChangePasswordRequested);
    on<AccountUpdateUserInfoRequested>(_onUpdateUserInfoRequested);
    on<AccountCguRequested>(_onCguRequested);
    on<AccountPrivacyRequested>(_onPrivacyRequested);
    on<AccountWalletHistoryRequested>(_onAccountWalletHistoryRequested);
    on<AccountWalletLoadMoreRequested>(_onAccountWalletLoadMoreRequested);
    on<AccountKaraRequested>(_onAccountKaraRequested);
    on<AccountProfilPhotoUploadRequested>(_onProfilPhotoUploadRequested);
    on<AccountProfilPhotoDeleteRequested>(_onProfilPhotoDeleteRequested);
    on<AccountProfilCvUploadRequested>(_onProfilCvUploadRequested);
    on<AccountSendComplaintsSuggestionsRequested>(
      _onSendComplaintsSuggestionsRequested,
    );
    on<AccountBlockedUsersRequested>(_onBlockedUsersRequested);
    on<AccountBlockedUsersLoadMoreRequested>(_onBlockedUsersLoadMoreRequested);
    on<AccountUnblockUserRequested>(_onUnblockUserRequested);
  }

  final AppSharedPrefs _appSharedPrefs;
  final LogoutUseCase _logoutUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateUserInfoUseCase _updateUserInfoUseCase;
  final CguUsecase _cguUseCase;
  final PrivacyUseCase _privacyUseCase;
  final GetAllKaraHistoryUsecase _getAllKaraHistoryUsecase;
  final GetKaraUseCase _getKaraUseCase;
  final UploadProfilPhotoUseCase _uploadProfilPhotoUseCase;
  final DeleteProfilPhotoUseCase _deleteProfilPhotoUseCase;
  final UploadProfilCVUseCase _uploadProfilCVUseCase;
  final ComplaintsSuggestionsUseCase _complaintsSuggestionsUseCase;
  final BlockedUsersUseCase _blockedUsersUseCase;
  final UnblockUserUseCase _unblockUserUseCase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;
  List<KaraHistory> _cachedHistory = [];

  int _currentBlockedUsersPage = 1;
  bool _hasMoreBlockedUsers = true;
  bool _isLoadMoreBlockedUsersInProgress = false;
  List<User> _cachedBlockedUsers = [];

  Future<void> _onAccountWalletHistoryRequested(
    AccountWalletHistoryRequested event,
    Emitter<AccountState> emit,
  ) async {
    _currentPage = event.queryPageParams.page;
    _hasMore = true;
    _isLoadMoreInProgress = false;
    _cachedHistory = [];

    emit(AccountRequestInProgress());
    final result = await _getAllKaraHistoryUsecase(event.queryPageParams);
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (history) {
        AppDebug.showPrint('Kara history: $history');
        _cachedHistory = history;
        _hasMore = history.length >= _pageSize;
        emit(
          AccountWalletHistorySuccess(
            history: _cachedHistory,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onAccountWalletLoadMoreRequested(
    AccountWalletLoadMoreRequested event,
    Emitter<AccountState> emit,
  ) async {
    if (!_hasMore || _isLoadMoreInProgress) return;

    _isLoadMoreInProgress = true;
    emit(
      AccountWalletHistorySuccess(
        history: _cachedHistory,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentPage++;
    final result = await _getAllKaraHistoryUsecase(
      QueryPageParams(page: _currentPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreInProgress = false;
        _currentPage--;
        emit(AccountRequestFailure(message: failure.message));
      },
      (history) {
        _cachedHistory = [..._cachedHistory, ...history];
        _hasMore = history.length >= _pageSize;
        _isLoadMoreInProgress = false;
        emit(
          AccountWalletHistorySuccess(
            history: _cachedHistory,
            hasMore: _hasMore,
          ),
        );
      },
    );
  }

  Future<void> _onBlockedUsersRequested(
    AccountBlockedUsersRequested event,
    Emitter<AccountState> emit,
  ) async {
    _currentBlockedUsersPage = event.queryPageParams.page;
    _hasMoreBlockedUsers = true;
    _isLoadMoreBlockedUsersInProgress = false;
    _cachedBlockedUsers = [];

    emit(AccountRequestInProgress());
    final result = await _blockedUsersUseCase(event.queryPageParams);
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (users) {
        _cachedBlockedUsers = users;
        _hasMoreBlockedUsers = users.length >= _pageSize;
        emit(
          AccountBlockedUsersSuccess(
            users: _cachedBlockedUsers,
            hasMore: _hasMoreBlockedUsers,
          ),
        );
      },
    );
  }

  Future<void> _onBlockedUsersLoadMoreRequested(
    AccountBlockedUsersLoadMoreRequested event,
    Emitter<AccountState> emit,
  ) async {
    if (!_hasMoreBlockedUsers || _isLoadMoreBlockedUsersInProgress) return;

    _isLoadMoreBlockedUsersInProgress = true;
    emit(
      AccountBlockedUsersSuccess(
        users: _cachedBlockedUsers,
        hasMore: _hasMoreBlockedUsers,
        isLoadMore: true,
      ),
    );

    _currentBlockedUsersPage++;
    final result = await _blockedUsersUseCase(
      QueryPageParams(page: _currentBlockedUsersPage),
    );
    result.fold(
      (failure) {
        _isLoadMoreBlockedUsersInProgress = false;
        _currentBlockedUsersPage--;
        emit(AccountRequestFailure(message: failure.message));
      },
      (users) {
        _cachedBlockedUsers = [..._cachedBlockedUsers, ...users];
        _hasMoreBlockedUsers = users.length >= _pageSize;
        _isLoadMoreBlockedUsersInProgress = false;
        emit(
          AccountBlockedUsersSuccess(
            users: _cachedBlockedUsers,
            hasMore: _hasMoreBlockedUsers,
          ),
        );
      },
    );
  }

  Future<void> _onUnblockUserRequested(
    AccountUnblockUserRequested event,
    Emitter<AccountState> emit,
  ) async {
    final userId = event.unblockUserParams.id;

    // Emit current list with unblockingUserId so only that item shows loading
    emit(
      AccountBlockedUsersSuccess(
        users: _cachedBlockedUsers,
        hasMore: _hasMoreBlockedUsers,
        unblockingUserId: userId,
      ),
    );

    final result = await _unblockUserUseCase(event.unblockUserParams);
    result.fold(
      (failure) {
        // Re-emit the list without unblockingUserId to stop the spinner
        emit(
          AccountBlockedUsersSuccess(
            users: _cachedBlockedUsers,
            hasMore: _hasMoreBlockedUsers,
          ),
        );
        emit(AccountRequestFailure(message: failure.message));
      },
      (_) {
        // Remove the unblocked user from the cached list
        _cachedBlockedUsers = _cachedBlockedUsers
            .where((user) => user.id != userId)
            .toList();

        // Emit updated list first, then success notification
        emit(
          AccountBlockedUsersSuccess(
            users: _cachedBlockedUsers,
            hasMore: _hasMoreBlockedUsers,
          ),
        );
        emit(
          AccountUnblockUserSuccess(
            message: 'User unblocked successfully',
            userId: userId,
          ),
        );
      },
    );
  }

  Future<void> _onLogoutRequested(
    AccountLogoutRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _logoutUseCase(NoParams());
    await _appSharedPrefs.remove(Constants.token);

    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(const AccountLogoutSuccess()),
    );
  }

  Future<void> _onChangePasswordRequested(
    AccountChangePasswordRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _changePasswordUseCase(event.changePasswordParams);
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(
        const AccountChangePasswordSuccess(
          message: 'Mot de passe modifié avec succès',
        ),
      ),
    );
  }

  Future<void> _onUpdateUserInfoRequested(
    AccountUpdateUserInfoRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _updateUserInfoUseCase(event.updateUserInfoParams);
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (user) => emit(AccountUpdateUserInfoSuccess(user: user)),
    );
  }

  Future<void> _onSendComplaintsSuggestionsRequested(
    AccountSendComplaintsSuggestionsRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _complaintsSuggestionsUseCase(
      event.complaintsSuggestionsParams,
    );
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(
        const AccountSendComplaintsSuggestionsSuccess(
          message: 'Votre message a été envoyé avec succès',
        ),
      ),
    );
  }

  Future<void> _onCguRequested(
    AccountCguRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _cguUseCase(NoParams());
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (cgu) => emit(AccountCguSuccess(cgu: cgu)),
    );
  }

  Future<void> _onPrivacyRequested(
    AccountPrivacyRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _privacyUseCase(NoParams());
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (privacy) => emit(AccountPrivacySuccess(privacy: privacy)),
    );
  }

  Future<void> _onAccountKaraRequested(
    AccountKaraRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountKaraRequestInProgress());
    final result = await _getKaraUseCase(NoParams());
    result.fold(
      (failure) => emit(AccountKaraFailure(message: failure.message)),
      (kara) => emit(AccountKaraSuccess(kara: kara)),
    );
  }

  Future<void> _onProfilPhotoUploadRequested(
    AccountProfilPhotoUploadRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountProfilPhotoRequestInProgress());
    final result = await _uploadProfilPhotoUseCase(
      UploadProfilPhotoParams(file: event.file),
    );
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(const AccountProfilPhotoUploadSuccess()),
    );
  }

  Future<void> _onProfilPhotoDeleteRequested(
    AccountProfilPhotoDeleteRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountProfilPhotoRequestInProgress());
    final result = await _deleteProfilPhotoUseCase(NoParams());
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(const AccountProfilPhotoDeleteSuccess()),
    );
  }

  Future<void> _onProfilCvUploadRequested(
    AccountProfilCvUploadRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountProfilCVRequestInProgress());
    final result = await _uploadProfilCVUseCase(
      UploadProfilCVParams(file: event.file),
    );
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(const AccountProfilCVUploadSuccess()),
    );
  }
}
