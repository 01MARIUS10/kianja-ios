import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/languages/languages.dart';
import 'package:kianja/core/shared/app_feature/data/datasources/app_shared_prefs.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/app_feature/domain/usecases/get_user_usecase.dart';
import 'package:kianja/core/themes/app_mode.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AppSharedPrefs appSharedPrefs,
    required GetUserUseCase getUserUseCase,
    // required DeleteCachedUserUseCase deleteCachedUserUseCase,
  }) : _appSharedPrefs = appSharedPrefs,
       _getUserUseCase = getUserUseCase,
       //  _deleteCachedUserUseCase = deleteCachedUserUseCase,
       super(
         const AppState(
           lang: Languages.localeFrench,
           isAlreadyChosenLang: false,
           isAuthenticated: false,
         ),
       ) {
    on<AppInitialized>(_onAppInitialized);
    on<AppLanguageConfirmed>(_onAppLanguageConfirmed);
    on<AppLanguageChanged>(_onAppLanguageChanged);
    on<AppAuthenticated>(_onAppAuthenticated);
    on<AppUserLoaded>(_onAppUserLoaded);
    on<AppUserUpdated>(_onAppUserUpdated);
    // on<AppCachedUserDeleted>(_onAppCachedUserDeleted);
    on<AppThemeChanged>(_onAppThemeChanged);
  }
  final AppSharedPrefs _appSharedPrefs;
  final GetUserUseCase _getUserUseCase;
  // final DeleteCachedUserUseCase _deleteCachedUserUseCase;

  void _onAppInitialized(AppInitialized event, Emitter emit) async {
    emit(state.copyWith(appInitStatus: AppInitStatus.loading));
    final String? lang = _appSharedPrefs.get(Constants.lang);
    final bool? isAlreadyChosenLang = _appSharedPrefs.get(
      Constants.isAlreadyChosenLang,
    );
    AppDebug.showPrint('AppBloc initialized');
    AppDebug.showPrint('isAlreadyChosenLang: $isAlreadyChosenLang');
    AppDebug.showPrint('Lang: $lang');
    final String token = _appSharedPrefs.get(Constants.token) ?? '';
    final bool isAuthenticated = token.isNotEmpty;
    final String? savedTheme = _appSharedPrefs.get(Constants.theme);
    final AppMode appMode = AppMode.values.firstWhere(
      (m) => m.name == savedTheme,
      orElse: () => AppMode.system,
    );
    final result = await _getUserUseCase(NoParams());
    final User user = result.fold((failure) {
      if (failure.message == 'Unauthorized' && failure.statusCode == 401) {
        _appSharedPrefs.remove(Constants.token);
        emit(
          state.copyWith(isAuthenticated: false, errorMessage: failure.message),
        );
      }
      return const User.empty();
    }, (user) => user);
    AppDebug.showPrint('user: $user');
    AppDebug.showPrint(
      'userStatus: ${user == const User.empty() ? 'deleted' : 'loaded'}',
    );
    emit(
      state.copyWith(
        lang: Locale(lang ?? 'fr'),
        isAlreadyChosenLang: isAlreadyChosenLang ?? false,
        isAuthenticated: isAuthenticated,
        appMode: appMode,
        user: user,
        userStatus: user == const User.empty()
            ? AppUserStatus.deleted
            : AppUserStatus.loaded,
        appInitStatus: AppInitStatus.loaded,
      ),
    );
  }

  void _onAppLanguageConfirmed(AppLanguageConfirmed event, Emitter emit) async {
    emit(state.copyWith(languageStatus: AppLanguageStatus.loading));
    await _appSharedPrefs.save(Constants.isAlreadyChosenLang, true);
    await _appSharedPrefs.save(Constants.lang, event.lang);
    await Future.delayed(const Duration(milliseconds: 500));
    emit(
      state.copyWith(
        isAlreadyChosenLang: true,
        languageStatus: AppLanguageStatus.confirmed,
      ),
    );
  }

  void _onAppLanguageChanged(AppLanguageChanged event, Emitter emit) async {
    emit(state.copyWith(lang: Locale(event.lang)));
  }

  void _onAppAuthenticated(AppAuthenticated event, Emitter emit) {
    emit(state.copyWith(isAuthenticated: event.isAuthenticated));
  }

  void _onAppUserLoaded(AppUserLoaded event, Emitter emit) async {
    emit(state.copyWith(userStatus: AppUserStatus.loading));
    final result = await _getUserUseCase(NoParams());
    result.fold(
      (failure) {
        AppDebug.showPrint(
          'user: ${failure.message}, status: ${failure.statusCode}',
        );
        emit(
          state.copyWith(
            userStatus: AppUserStatus.error,
            user: const User.empty(),
            errorMessage: failure.message,
          ),
        );
        _appSharedPrefs.remove(Constants.token);
        add(const AppInitialized());
      },
      (user) =>
          emit(state.copyWith(userStatus: AppUserStatus.loaded, user: user)),
    );
  }

  void _onAppUserUpdated(AppUserUpdated event, Emitter emit) async {
    emit(state.copyWith(userStatus: AppUserStatus.loading));
    emit(state.copyWith(userStatus: AppUserStatus.loaded, user: event.user));
  }

  // void _onAppCachedUserDeleted(AppCachedUserDeleted event, Emitter emit) async {
  //   emit(state.copyWith(userStatus: AppUserStatus.loading));
  //   final result = await _deleteCachedUserUseCase(NoParams());
  //   result.fold(
  //     (failure) => emit(
  //       state.copyWith(
  //         userStatus: AppUserStatus.error,
  //         errorMessage: failure.message,
  //       ),
  //     ),
  //     (_) => emit(state.copyWith(userStatus: AppUserStatus.deleted)),
  //   );
  // }

  void _onAppThemeChanged(AppThemeChanged event, Emitter emit) async {
    await _appSharedPrefs.save(Constants.theme, event.appMode.name);
    emit(state.copyWith(appMode: event.appMode));
  }
}
