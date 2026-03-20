part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({required this.lang, required this.isAlreadyChosenLang});
  final Locale lang;
  final bool isAlreadyChosenLang;

  AppState copyWith({Locale? lang, bool? isAlreadyChosenLang}) {
    return AppState(
      lang: lang ?? this.lang,
      isAlreadyChosenLang: isAlreadyChosenLang ?? this.isAlreadyChosenLang,
    );
  }

  @override
  List<Object> get props => [lang, isAlreadyChosenLang];
}
