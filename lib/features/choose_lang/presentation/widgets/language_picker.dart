import 'package:flutter/material.dart';
import 'package:kianja/core/languages/language_enum.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/extensions.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({
    super.key,
    required this.languages,
    required this.selected,
    required this.onSelect,
  });

  final List<LanguageEnum> languages;
  final LanguageEnum selected;
  final ValueChanged<LanguageEnum> onSelect;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.appLoc.select_lang, style: textTheme.bodyMedium),
          const SizedBox(height: 16),

          ...languages.map((lang) {
            final isSelected = selected == lang;

            return GestureDetector(
              onTap: () => onSelect(lang),
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
                      ? AppColors.darkBackground
                      : AppColors.lightBackground,
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
          }),
        ],
      ),
    );
  }
}
