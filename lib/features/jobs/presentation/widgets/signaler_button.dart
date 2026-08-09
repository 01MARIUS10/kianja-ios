import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/routing/routes.dart';

class SignalerButton extends StatelessWidget {
  const SignalerButton({
    super.key,
    required this.contenuId,
    required this.type,
  });
  final int contenuId;
  final String type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.info),
      onPressed: () {
        context.pushNamed(
          Routes.signalerContenu.name,
          pathParameters: {'contenuId': contenuId.toString(), 'type': type},
        );
      },
      child: Text(
        context.appLoc.report.toUpperCase(),
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
          color: isDark
              ? AppColors.darkTextPrimary
              : AppColors.lightTextPrimary,
        ),
      ),
    );
  }
}
