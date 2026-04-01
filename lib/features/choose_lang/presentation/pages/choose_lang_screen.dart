import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/l10n/app_localizations.dart';
import 'package:kianja/core/languages/language_enum.dart';
import 'package:kianja/core/languages/languages.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/choose_lang/presentation/widgets/select_language.dart';
import 'package:kianja/routing/routes.dart';

class ChooseLangScreen extends StatefulWidget {
  const ChooseLangScreen({super.key});

  @override
  State<ChooseLangScreen> createState() => _ChooseLangScreenState();
}

class _ChooseLangScreenState extends State<ChooseLangScreen> {
  late LanguageEnum _language;

  @override
  void initState() {
    super.initState();
    _language = Languages.getLanguageEnum(
      BlocProvider.of<AppBloc>(context).state.lang,
    );
    AppDebug.showPrint('Choose langue screen');
    AppDebug.showPrint(
      'isAlreadyChosenLang: ${BlocProvider.of<AppBloc>(context).state.isAlreadyChosenLang}',
    );
    AppDebug.showPrint(
      'Langue : ${BlocProvider.of<AppBloc>(context).state.lang}',
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Constants.paddingMedium),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  context.appLoc.choose_lang,
                  style: theme.textTheme.headlineMedium,
                ),
                SizedBox(
                  height: Constants.size300,
                  width: Constants.size300,
                  child: SvgPicture.asset(Assets.langIllustration),
                ),
                SelectLanguage(
                  selected: _language,
                  onSelect: (lang) {
                    setState(() {
                      _language = lang;
                    });
                    BlocProvider.of<AppBloc>(
                      context,
                    ).add(AppLanguageChanged(lang: lang.langCode));
                  },
                ),
              ],
            ),
            SizedBox(
              height: Constants.size50,
              width: double.infinity,
              child: BlocConsumer<AppBloc, AppState>(
                listener: (context, state) {
                  if (state.languageStatus == AppLanguageStatus.confirmed) {
                    context.goNamed(Routes.jobs.name);
                  }
                },
                builder: (context, state) {
                  final isLoading =
                      state.languageStatus == AppLanguageStatus.loading ||
                      state.languageStatus == AppLanguageStatus.confirmed;
                  return ElevatedButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            BlocProvider.of<AppBloc>(context).add(
                              AppLanguageConfirmed(lang: _language.langCode),
                            );
                          },
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.continu.toUpperCase(),
                            style: theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary,
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
