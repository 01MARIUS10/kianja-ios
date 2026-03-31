import 'package:flutter/material.dart';
import 'package:kianja/core/languages/language_enum.dart';

abstract final class Languages {
  static const localeMalagasy = Locale('mg');
  static const localeFrench = Locale('fr');
  static const localeEnglish = Locale('en');
  static const localeLanguages = [localeMalagasy, localeFrench, localeEnglish];
  static const languageEnumList = [
    LanguageEnum.malagasy,
    LanguageEnum.french,
    LanguageEnum.english,
  ];

  static LanguageEnum getLanguageEnum(Locale locale) {
    return switch (locale.languageCode) {
      'mg' => LanguageEnum.malagasy,
      'fr' => LanguageEnum.french,
      'en' => LanguageEnum.english,
      _ => LanguageEnum.french,
    };
  }
}
