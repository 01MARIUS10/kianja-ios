import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/utils/usecase.dart';
import 'package:kianja/features/account/domain/usecases/change_password_usecase.dart';
import 'package:kianja/features/account/domain/usecases/logout_usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc({
    required LogoutUseCase logoutUseCase,
    required ChangePasswordUseCase changePasswordUseCase,
  }) : _logoutUseCase = logoutUseCase,
       _changePasswordUseCase = changePasswordUseCase,
       super(AccountInitial()) {
    on<AccountLogoutRequested>(_onLogoutRequested);
    on<AccountChangePasswordRequested>(_onChangePasswordRequested);
  }

  final LogoutUseCase _logoutUseCase;
  final ChangePasswordUseCase _changePasswordUseCase;

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
    final result = await _changePasswordUseCase(
      ChangePasswordParams(
        oldPassword: event.oldPassword,
        newPassword: event.newPassword,
      ),
    );
    result.fold(
      (failure) => emit(AccountRequestFailure(message: failure.message)),
      (_) => emit(
        const AccountChangePasswordSuccess(
          message: 'Mot de passe modifié avec succès',
        ),
      ),
    );
  }
}
