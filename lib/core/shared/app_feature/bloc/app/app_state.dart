// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

enum AppInitStatus { initial, loading, loaded, error }

enum AppUserStatus { initial, loading, loaded, sessionExpired, deleted, error }

enum AppLanguageStatus { initial, loading, confirmed, error }

enum AppSponsPartnerStatus { initial, loading, loaded, error }

class AppState extends Equatable {
  const AppState({
    required this.lang,
    required this.isAlreadyChosenLang,
    required this.isAuthenticated,
    this.appMode = AppMode.system,
    this.user = const User.empty(),
    this.appInitStatus = AppInitStatus.initial,
    this.userStatus = AppUserStatus.initial,
    this.languageStatus = AppLanguageStatus.initial,
    this.sponsPartnerStatus = AppSponsPartnerStatus.initial,
    this.sponsPartners = const [],
    this.errorMessage = '',
  });
  final Locale lang;
  final bool isAlreadyChosenLang;
  final bool isAuthenticated;
  final AppMode appMode;
  final User user;
  final AppInitStatus appInitStatus;
  final AppUserStatus userStatus;
  final AppLanguageStatus languageStatus;
  final AppSponsPartnerStatus sponsPartnerStatus;
  final List<SponsPartner> sponsPartners;
  final String errorMessage;

  AppState copyWith({
    Locale? lang,
    bool? isAlreadyChosenLang,
    bool? isAuthenticated,
    AppMode? appMode,
    User? user,
    AppInitStatus? appInitStatus,
    AppUserStatus? userStatus,
    AppLanguageStatus? languageStatus,
    AppSponsPartnerStatus? sponsPartnerStatus,
    List<SponsPartner>? sponsPartners,
    String? errorMessage,
  }) {
    return AppState(
      lang: lang ?? this.lang,
      isAlreadyChosenLang: isAlreadyChosenLang ?? this.isAlreadyChosenLang,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      appMode: appMode ?? this.appMode,
      user: user ?? this.user,
      appInitStatus: appInitStatus ?? this.appInitStatus,
      userStatus: userStatus ?? this.userStatus,
      languageStatus: languageStatus ?? this.languageStatus,
      sponsPartnerStatus: sponsPartnerStatus ?? this.sponsPartnerStatus,
      sponsPartners: sponsPartners ?? this.sponsPartners,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
    lang,
    isAlreadyChosenLang,
    isAuthenticated,
    appMode,
    user,
    appInitStatus,
    userStatus,
    languageStatus,
    sponsPartnerStatus,
    sponsPartners,
    errorMessage,
  ];
}
