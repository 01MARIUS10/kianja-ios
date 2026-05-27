import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/core/utils/usecase/query_page_params.dart';
import 'package:kianja/features/account/domain/entities/kara_history.dart';
import 'package:kianja/features/account/domain/usecases/cgu_usecase.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_usecase.dart';
import 'package:kianja/features/account/domain/usecases/get_all_kara_history_usecase.dart';
import 'package:kianja/features/account/domain/usecases/logout_usecase.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({
    required LogoutUseCase logoutUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
    required UpdateUserInfoUseCase updateUserInfoUseCase,
    required CguUsecase cguUseCase,
    required GetAllKaraHistoryUsecase getAllKaraHistoryUsecase,
  }) : _logoutUseCase = logoutUseCase,
       _changePasswordUseCase = changePasswordUseCase,
       _updateUserInfoUseCase = updateUserInfoUseCase,
       _cguUseCase = cguUseCase,
       _getAllKaraHistoryUsecase = getAllKaraHistoryUsecase,
       super(AccountInitial()) {
    on<AccountLogoutRequested>(_onLogoutRequested);
    on<AccountChangePasswordRequested>(_onChangePasswordRequested);
    on<AccountUpdateUserInfoRequested>(_onUpdateUserInfoRequested);
    on<AccountCguRequested>(_onCguRequested);
    on<AccountWalletHistoryRequested>(_onAccountWalletHistoryRequested);
    on<AccountWalletLoadMoreRequested>(_onAccountWalletLoadMoreRequested);
  }

  final LogoutUseCase _logoutUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateUserInfoUseCase _updateUserInfoUseCase;
  final CguUsecase _cguUseCase;
  final GetAllKaraHistoryUsecase _getAllKaraHistoryUsecase;

  static const int _pageSize = 15;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadMoreInProgress = false;
  List<KaraHistory> _allHistory = [];
  List<KaraHistory> _visibleHistory = [];

  Future<void> _onAccountWalletHistoryRequested(
    AccountWalletHistoryRequested event,
    Emitter<AccountState> emit,
  ) async {
    _currentPage = event.queryPageParams.page;
    _hasMore = true;
    _isLoadMoreInProgress = false;
    _allHistory = [];
    _visibleHistory = [];

    emit(AccountRequestInProgress());
    final result = await _getAllKaraHistoryUsecase(event.queryPageParams);
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (history) {
        _allHistory = history;
        _visibleHistory = _slice(page: _currentPage);
        _hasMore = _visibleHistory.length < _allHistory.length;
        emit(
          AccountWalletHistorySuccess(
            history: _visibleHistory,
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
    if (_allHistory.isEmpty) return;

    _isLoadMoreInProgress = true;
    emit(
      AccountWalletHistorySuccess(
        history: _visibleHistory,
        hasMore: _hasMore,
        isLoadMore: true,
      ),
    );

    _currentPage++;
    final next = _slice(page: _currentPage);
    _visibleHistory = [..._visibleHistory, ...next];
    _hasMore = _visibleHistory.length < _allHistory.length;
    _isLoadMoreInProgress = false;

    emit(
      AccountWalletHistorySuccess(history: _visibleHistory, hasMore: _hasMore),
    );
  }

  List<KaraHistory> _slice({required int page}) {
    if (_allHistory.isEmpty) return [];
    final start = (page - 1) * _pageSize;
    if (start >= _allHistory.length) return [];
    final end = (start + _pageSize).clamp(0, _allHistory.length);
    return _allHistory.sublist(start, end);
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
}
