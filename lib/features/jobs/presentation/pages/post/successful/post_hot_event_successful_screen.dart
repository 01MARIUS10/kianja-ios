import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/routing/routes.dart';

class PostHotEventSuccessfulScreen extends StatelessWidget {
  const PostHotEventSuccessfulScreen({
    super.key,
    required this.id,
    required this.type,
  });
  final int id;
  final String type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: const TitleHeader(title: 'Posted successfully'),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
            Text(
              'Post successful.',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: Constants.spacingSmall),
            TextButton(
              onPressed: () {
                context.pushReplacementNamed(
                  Routes.trainingCenterHotEventDetail.name,
                  pathParameters: {'id': id.toString()},
                  extra: {
                    'category': type.toUpperCase(),
                    'query': type == 'hot' ? '/hots' : '/events',
                  },
                );
              },
              child: Text(
                'View post',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkPrimary
                      : AppColors.lightPrimary,
                ),
              ),
            ),
            const SizedBox(
              height: Constants.spacingLarge * 2,
            ), // to push it slightly up from exact center if needed, or just let center do its thing.
          ],
        ),
      ),
    );
  }
}
