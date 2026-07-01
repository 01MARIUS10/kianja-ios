import 'package:flutter/material.dart';
import 'package:kianja/core/languages/language_enum.dart';

abstract final class Languages {
  static const localeMalagasy = Locale('mg');
  static const localeFrench = Locale('fr');
  static const localeEnglish = Locale('en');
  static const localeKorean = Locale('ko');
  static const localeChinese = Locale('zh');
  static const localeLanguages = [
    localeMalagasy,
    localeFrench,
    localeEnglish,
    localeKorean,
    localeChinese,
  ];
  static const languageEnumList = [
    LanguageEnum.malagasy,
    LanguageEnum.french,
    LanguageEnum.english,
    LanguageEnum.korean,
    LanguageEnum.chinese,
  ];

  static LanguageEnum getLanguageEnum(Locale locale) {
    return switch (locale.languageCode) {
      'mg' => LanguageEnum.malagasy,
      'fr' => LanguageEnum.french,
      'en' => LanguageEnum.english,
      'ko' => LanguageEnum.korean,
      'zh' => LanguageEnum.chinese,
      _ => LanguageEnum.french,
    };
  }
}
