import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/utils/constants.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key, required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.paddingLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: Constants.spacingMedium),
          SvgPicture.asset(Assets.noConnectionIllustration, height: 250),
          const SizedBox(height: Constants.spacingMedium),
          Text(
            'Page failed to load',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Constants.spacingSmall),
          Text(
            'Please check your connection before trying again.',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Constants.spacingLarge),
          SizedBox(
            width: double.infinity,
            height: Constants.size50,
            child: ElevatedButton(
              onPressed: onRetry,
              child: Text(
                'Retry',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: Constants.spacingLarge),
        ],
      ),
    );
  }
}
