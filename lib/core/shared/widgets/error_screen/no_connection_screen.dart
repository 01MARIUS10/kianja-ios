import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

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
          // const SizedBox(height: Constants.spacingMedium),
          SvgPicture.asset(Assets.noConnectionIllustration, height: 250),
          // const SizedBox(height: Constants.spacingMedium),
          Text(
            context.appLoc.page_failed_load,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Constants.spacingSmall),
          Text(
            context.appLoc.please_check_connection_before_trying,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Constants.spacingMedium),
          SizedBox(
            width: double.infinity,
            height: Constants.size50,
            child: ElevatedButton(
              onPressed: onRetry,
              child: Text(
                context.appLoc.retry.toUpperCase(),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // const SizedBox(height: Constants.spacingLarge),
        ],
      ),
    );
  }
}
