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

class AppUserUpdated extends AppEvent {
  const AppUserUpdated({required this.user});
  final User user;

  @override
  List<Object> get props => [user];
}

class AppUserDeleted extends AppEvent {
  const AppUserDeleted();
}

class AppThemeChanged extends AppEvent {
  const AppThemeChanged({required this.appMode});
  final AppMode appMode;

  @override
  List<Object> get props => [appMode];
}

class AppSponsPartnerLoaded extends AppEvent {
  const AppSponsPartnerLoaded();
}

class AppSponsorAndPartnerLoaded extends AppEvent {
  const AppSponsorAndPartnerLoaded({required this.menuId});
  final int menuId;

  @override
  List<Object> get props => [menuId];
}
