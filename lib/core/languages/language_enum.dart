import 'package:flutter/material.dart';
import 'package:kianja/core/l10n/app_l10n.dart';
import 'package:kianja/core/languages/languages.dart';

enum LanguageEnum {
  malagasy(flag: '🇲🇬', locale: Languages.localeMalagasy, langCode: 'mg'),

  french(flag: '🇫🇷', locale: Languages.localeFrench, langCode: 'fr'),

  english(flag: '🇬🇧', locale: Languages.localeEnglish, langCode: 'en'),

  chinese(flag: '🇨🇳', locale: Languages.localeChinese, langCode: 'zh'),

  korean(flag: '🇰🇷', locale: Languages.localeKorean, langCode: 'ko');

  const LanguageEnum({
    required this.flag,
    required this.locale,
    required this.langCode,
  });

  String get name {
    switch (this) {
      case LanguageEnum.malagasy:
        return AppL10n.current!.malagasy;
      case LanguageEnum.french:
        return AppL10n.current!.french;
      case LanguageEnum.english:
        return AppL10n.current!.english;
      case LanguageEnum.chinese:
        return AppL10n.current!.chinese;
      case LanguageEnum.korean:
        return AppL10n.current!.korean;
    }
  }

  final String flag;
  final Locale locale;
  final String langCode;
}
