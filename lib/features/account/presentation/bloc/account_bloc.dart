import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/usecase/no_params.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_params.dart';
import 'package:kianja/features/account/domain/usecases/change_password/change_password_usecase.dart';
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
  }) : _logoutUseCase = logoutUseCase,
       _changePasswordUseCase = changePasswordUseCase,
       _updateUserInfoUseCase = updateUserInfoUseCase,
       super(AccountInitial()) {
    on<AccountLogoutRequested>(_onLogoutRequested);
    on<AccountChangePasswordRequested>(_onChangePasswordRequested);
    on<AccountUpdateUserInfoRequested>(_onUpdateUserInfoRequested);
  }

  final LogoutUseCase _logoutUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;
  final UpdateUserInfoUseCase _updateUserInfoUseCase;

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
}
