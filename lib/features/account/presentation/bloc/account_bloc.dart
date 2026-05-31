import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/domain/usecases/cgu_usecase.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_usecase.dart';
import 'package:kianja/features/account/domain/usecases/delete_profil_photo_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_all_kara_history_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_kara_usecase.dart';
import 'package:kianja/features/account/domain/usecases/logout_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_photo/upload_profil_photo_params.dart';
import 'package:kianja/features/account/domain/usecases/upload_profil_photo/upload_profil_photo_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({
    required LogoutUseCase logoutUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
    required UpdateUserInfoUseCase updateUserInfoUseCase,
    required CguUsecase cguUseCase,
    required GetAllKaraHistoryUsecase getAllKaraHistoryUsecase,
    required GetKaraUseCase getKaraUseCase,
    required UploadProfilPhotoUseCase uploadProfilPhotoUseCase,
    required DeleteProfilPhotoUseCase deleteProfilPhotoUseCase,
  }) : _logoutUseCase = logoutUseCase,
       _changePasswordUseCase = changePasswordUseCase,
       _updateUserInfoUseCase = updateUserInfoUseCase,
       _cguUseCase = cguUseCase,
       _getAllKaraHistoryUsecase = getAllKaraHistoryUsecase,
       _getKaraUseCase = getKaraUseCase,
       _uploadProfilPhotoUseCase = uploadProfilPhotoUseCase,
       _deleteProfilPhotoUseCase = deleteProfilPhotoUseCase,
       super(AccountInitial()) {
    on<AccountLogoutRequested>(_onLogoutRequested);
    on<AccountChangePasswordRequested>(_onChangePasswordRequested);
    on<AccountUpdateUserInfoRequested>(_onUpdateUserInfoRequested);
    on<AccountCguRequested>(_onCguRequested);
    on<AccountWalletHistoryRequested>(_onAccountWalletHistoryRequested);
    on<AccountWalletLoadMoreRequested>(_onAccountWalletLoadMoreRequested);
    on<AccountKaraRequested>(_onAccountKaraRequested);
    on<AccountProfilPhotoUploadRequested>(_onProfilPhotoUploadRequested);
    on<AccountProfilPhotoDeleteRequested>(_onProfilPhotoDeleteRequested);
  }

  final LogoutUseCase _logoutUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateUserInfoUseCase _updateUserInfoUseCase;
  final CguUsecase _cguUseCase;
  final GetAllKaraHistoryUsecase _getAllKaraHistoryUsecase;
  final GetKaraUseCase _getKaraUseCase;
  final UploadProfilPhotoUseCase _uploadProfilPhotoUseCase;
  final DeleteProfilPhotoUseCase _deleteProfilPhotoUseCase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;
  List<KaraHistory> _cachedHistory = [];

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

  Future<void> _onLogoutRequested(
    AccountLogoutRequested event,
    Emitter<AccountState> emit,
  ) async {
    emit(AccountRequestInProgress());
    final result = await _logoutUseCase(NoParams());
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
}
