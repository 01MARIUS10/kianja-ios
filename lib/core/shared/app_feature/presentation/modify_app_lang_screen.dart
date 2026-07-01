import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/languages/language_enum.dart';
import 'package:kianja/core/languages/languages.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

class ModifyAppLangScreen extends StatelessWidget {
  const ModifyAppLangScreen({super.key});

  void _onLanguageSelected(
    BuildContext context,
    LanguageEnum lang,
    LanguageEnum current,
  ) {
    if (lang == current) return;

    final langCode = lang.langCode;
    BlocProvider.of<AppBloc>(context).add(AppLanguageChanged(lang: langCode));
    BlocProvider.of<AppBloc>(context).add(AppLanguageConfirmed(lang: langCode));
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return BaseScreen(
      appBar: TitleHeader(title: context.appLoc.select_lang),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final selected = Languages.getLanguageEnum(state.lang);

          return SingleChildScrollView(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Column(
              children: Languages.languageEnumList.map((lang) {
                final isSelected = selected == lang;

                return GestureDetector(
                  onTap: () => _onLanguageSelected(context, lang, selected),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.darkPrimaryHover.withAlpha(20)
                          : isDark
                          ? AppColors.darkSurface
                          : AppColors.lightSurface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.darkPrimaryHover
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(lang.flag, style: const TextStyle(fontSize: 22)),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Text(lang.name, style: textTheme.bodyMedium),
                        ),
                        if (isSelected)
                          const Icon(
                            Icons.check_circle_rounded,
                            color: AppColors.darkPrimaryHover,
                            size: 20,
                          ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
