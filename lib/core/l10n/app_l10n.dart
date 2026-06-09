import 'package:kianja/core/l10n/localization/app_localizations.dart';
import 'package:kianja/core/utils/global_key_service.dart';

class AppL10n {
  static AppLocalizations? get current {
    final context = GlobalKeyService.scaffoldMessengerKey.currentContext;
    if (context == null) return null;
    return AppLocalizations.of(context);
  }
}
