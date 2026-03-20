import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/languages/languages.dart';
import 'package:kianja/core/shared/data/app_shared_prefs.dart';
import 'package:kianja/core/utils/constants.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AppSharedPrefs appSharedPrefs})
    : _appSharedPrefs = appSharedPrefs,
      super(
        const AppState(
          lang: Languages.localeFrench,
          isAlreadyChosenLang: false,
        ),
      ) {
    on<AppInitialized>(_onAppInitialized);
    on<AppLanguageConfirmed>(_onAppLanguageConfirmed);
    on<AppLanguageChanged>(_onAppLanguageChanged);
  }
  final AppSharedPrefs _appSharedPrefs;

  void _onAppInitialized(AppInitialized event, Emitter emit) async {
    final String? lang = _appSharedPrefs.get(Constants.lang);
    final bool? isAlreadyChosenLang = _appSharedPrefs.get(
      Constants.isAlreadyChosenLang,
    );
    emit(
      state.copyWith(
        lang: Locale(lang ?? 'fr'),
        isAlreadyChosenLang: isAlreadyChosenLang ?? false,
      ),
    );
  }

  void _onAppLanguageConfirmed(AppLanguageConfirmed event, Emitter emit) async {
    await _appSharedPrefs.save(Constants.isAlreadyChosenLang, true);
    emit(state.copyWith(isAlreadyChosenLang: true));
  }

  void _onAppLanguageChanged(AppLanguageChanged event, Emitter emit) async {
    await _appSharedPrefs.save(Constants.lang, event.lang);
    emit(state.copyWith(lang: Locale(event.lang)));
  }
}
