import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/features/auth/domain/usecases/signin_usecase.dart';
import 'package:kianja/features/auth/domain/usecases/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignInUseCase signInUseCase,
    required SignUpUseCase signUpUseCase,
  }) : _signInUseCase = signInUseCase,
       _signUpUseCase = signUpUseCase,
       super(AuthInitial()) {
    on<AuthSignInRequested>(_onAuthSignInRequested);
    on<AuthSignUpRequested>(_onAuthSignUpRequested);
  }
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;

  void _onAuthSignInRequested(
    AuthSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthRequestInProgress());
    final result = await _signInUseCase(
      SignInParams(
        phone: event.phone,
        password: event.password,
        stayLogged: event.stayLogged,
      ),
    );
    result.fold(
      (failure) => emit(AuthRequestFailure(message: failure.message)),
      (token) => emit(AuthSignInSuccess(token: token)),
    );
  }

  void _onAuthSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthRequestInProgress());
    final result = await _signUpUseCase(
      SignUpParams(
        firstName: event.firstName,
        lastName: event.lastName,
        genre: event.genre,
        phone: event.phone,
        birthDate: event.birthDate,
        residence: event.residence,
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthRequestFailure(message: failure.message)),
      (token) => emit(AuthSignUpSuccess(token: token)),
    );
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    AppDebug.showPrint('AuthBloc - ${change.toString()}');
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    super.onTransition(transition);
    AppDebug.showPrint('AuthBloc - ${transition.toString()}');
  }
}
