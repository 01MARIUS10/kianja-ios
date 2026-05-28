import 'package:flutter/material.dart';
import 'package:kianja/core/languages/languages.dart';

enum LanguageEnum {
  malagasy(
    name: 'Malagasy',
    flag: '🇲🇬',
    locale: Languages.localeMalagasy,
    langCode: 'mg',
  ),

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
  ),

  chinese(
    name: '中文',
    flag: '🇨🇳',
    locale: Languages.localeChinese,
    langCode: 'zh',
  ),

  korean(
    name: '한국어',
    flag: '🇰🇷',
    locale: Languages.localeKorean,
    langCode: 'ko',
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
