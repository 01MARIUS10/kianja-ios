import 'package:flutter/material.dart';
import 'package:kianja/core/languages/language_enum.dart';

abstract final class Languages {
  static const localeFrench = Locale('fr', 'FR');
  static const localeEnglish = Locale('en', 'US');
  static const localeLanguages = [localeFrench, localeEnglish];
  static const languageEnumList = [LanguageEnum.french, LanguageEnum.english];

  static LanguageEnum getLanguageEnum(Locale locale) {
    return switch (locale.languageCode) {
      'fr' => LanguageEnum.french,
      'en' => LanguageEnum.english,
      _ => LanguageEnum.french,
    };
  }
}
