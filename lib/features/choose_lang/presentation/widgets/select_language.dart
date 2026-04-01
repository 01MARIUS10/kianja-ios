import 'package:flutter/material.dart';
import 'package:kianja/core/languages/language_enum.dart';
import 'package:kianja/core/languages/languages.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/features/choose_lang/presentation/widgets/language_picker.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({
    super.key,
    required this.selected,
    required this.onSelect,
  });
  final LanguageEnum selected;
  final ValueChanged<LanguageEnum> onSelect;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    return GestureDetector(
      onTap: () => _buildLanguagePicker(context, theme),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(selected.flag, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(selected.name, style: theme.textTheme.bodyMedium),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: isDark
                  ? AppColors.darkTextMuted
                  : AppColors.lightTextMuted,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  void _buildLanguagePicker(BuildContext context, ThemeData theme) {
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.bottomSheetTheme.backgroundColor,
      showDragHandle: true,
      shape: theme.bottomSheetTheme.shape,
      builder: (context) => LanguagePicker(
        languages: Languages.languageEnumList,
        selected: selected,
        onSelect: (lang) {
          onSelect(lang);
          Navigator.pop(context);
        },
      ),
    );
  }
}
