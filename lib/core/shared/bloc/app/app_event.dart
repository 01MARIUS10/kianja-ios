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
  const AppLanguageConfirmed();
}

class AppLanguageChanged extends AppEvent {
  const AppLanguageChanged({required this.lang});
  final String lang;

  @override
  List<Object> get props => [lang];
}
