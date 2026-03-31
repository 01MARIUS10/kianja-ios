part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitialized extends AppEvent {
  const AppInitialized();
}

class AppLanguageConfirmed extends AppEvent {
  const AppLanguageConfirmed({required this.lang});
  final String lang;

  @override
  List<Object> get props => [lang];
}

class AppLanguageChanged extends AppEvent {
  const AppLanguageChanged({required this.lang});
  final String lang;

  @override
  List<Object> get props => [lang];
}

class AppAuthenticated extends AppEvent {
  const AppAuthenticated({required this.isAuthenticated});
  final bool isAuthenticated;

  @override
  List<Object> get props => [isAuthenticated];
}

class AppUserLoaded extends AppEvent {
  const AppUserLoaded();
}

class AppCachedUserDeleted extends AppEvent {
  const AppCachedUserDeleted();
}

class AppThemeChanged extends AppEvent {
  const AppThemeChanged({required this.themeMode});
  final ThemeMode themeMode;

  @override
  List<Object> get props => [themeMode];
}
