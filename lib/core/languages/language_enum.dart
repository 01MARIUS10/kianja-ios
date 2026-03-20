import 'package:flutter/material.dart';
import 'package:kianja/core/languages/languages.dart';

enum LanguageEnum {
  french(
    name: 'Français',
    flag: '🇫🇷',
    locale: Languages.localeFrench,
    langCode: 'fr',
  ),
  english(
    name: 'English',
    flag: '🇬🇧',
    locale: Languages.localeEnglish,
    langCode: 'en',
  );

  const LanguageEnum({
    required this.name,
    required this.flag,
    required this.locale,
    required this.langCode,
  });
  final String name;
  final String flag;
  final Locale locale;
  final String langCode;
}
