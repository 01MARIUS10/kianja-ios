import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/utils/constants.dart';

class ServerFailureScreen extends StatelessWidget {
  const ServerFailureScreen({super.key, required this.onRetry, this.message});

  final VoidCallback onRetry;
  final String? message;

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
          SvgPicture.asset(Assets.serverIllustration, height: 250),
          // const SizedBox(height: Constants.spacingMedium),
          Text(
            'Service Unavailable',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: Constants.spacingSmall),
          Text(
            message ??
                'The server is under maintenance or encountered an error. Please try again later.',
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
