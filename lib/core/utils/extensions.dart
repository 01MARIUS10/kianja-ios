import 'package:flutter/material.dart';
import 'package:kianja/core/l10n/app_localizations.dart';

/// Helper pour accéder plus facilement aux ressources de traduction (AppLocalizations).
/// Permet d’écrire `context.appLoc` au lieu de `AppLocalizations.of(context)`.
///
/// Exemple :
/// ```dart
/// Text(context.appLoc.myTranslatedString)
/// ```
extension BuildContextHelper on BuildContext {
  AppLocalizations get appLoc {
    return AppLocalizations.of(this)!;
  }
}
