import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/routing/routes.dart';

class ComplaintsSuggestionsSentScreen extends StatelessWidget {
  const ComplaintsSuggestionsSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: TitleHeader(title: context.appLoc.complaints_and_suggestions),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 36),
            ),
            const SizedBox(height: Constants.spacingLarge),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: Text(
                context.appLoc.complaints_or_suggestions_sent_successfully,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
            TextButton(
              onPressed: () {
                context.goNamed(Routes.account.name);
              },
              child: Text(
                context.appLoc.return_to_my_account,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkPrimary
                      : AppColors.lightPrimary,
                ),
              ),
            ),
            const SizedBox(height: Constants.spacingLarge * 2),
          ],
        ),
      ),
    );
  }
}
