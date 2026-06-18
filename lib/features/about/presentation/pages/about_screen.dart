import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/about/presentation/bloc/about_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          GetIt.instance<AboutBloc>()
            ..add(const AboutGetUpdateVersionRequested()),
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.about),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Constants.spacingMedium),
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(Constants.paddingSmall),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      Constants.borderRadiusMedium,
                    ),
                    child: Image.asset(Assets.logoKianja, fit: BoxFit.contain),
                  ),
                ),
              ),
              const SizedBox(height: Constants.spacingMedium),
              Center(
                child: BlocBuilder<AboutBloc, AboutState>(
                  builder: (context, state) {
                    return RichText(
                      text: TextSpan(
                        text: 'KIANJA ',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                        ),
                        children: [
                          if (state is AboutGetUpdateVersionSuccess)
                            TextSpan(
                              text: 'v${state.appVersion.version}',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: Constants.spacingLarge),

              _buildParagraph(
                theme,
                context.appLoc.kianja_professional_description,
              ),
              const SizedBox(height: Constants.spacingMedium),
              _buildParagraph(theme, context.appLoc.kianja_talent_description),
              const SizedBox(height: Constants.spacingMedium),
              _buildParagraph(theme, context.appLoc.kianja_access_description),

              const SizedBox(height: Constants.spacingLarge),
              Text(
                context.appLoc.contact_us,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: Constants.spacingMedium),

              _buildContactRow(
                theme: theme,
                icon: Icons.phone_outlined,
                title: context.appLoc.via_phone,
                value: '+261 38 28 309 29',
                buttonText: context.appLoc.call,
                onTap: () async {
                  try {
                    final Uri url = Uri(
                      scheme: 'tel',
                      path: '+261 38 28 309 29',
                    );
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      if (context.mounted) {
                        AppMessenger.showError(
                          context,
                          context.appLoc.could_not_launch_phone_app,
                        );
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      AppMessenger.showError(
                        context,
                        '${context.appLoc.error_launching_app} $e',
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: Constants.spacingMedium),
              _buildContactRow(
                theme: theme,
                icon: Icons.email_outlined,
                title: context.appLoc.via_email,
                value: 'contact@mips.mg',
                buttonText: context.appLoc.send,
                onTap: () async {
                  try {
                    final Uri url = Uri(
                      scheme: 'mailto',
                      path: 'contact@mips.mg',
                      query:
                          'subject=${context.appLoc.forgot_password_request}',
                    );
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      if (context.mounted) {
                        AppMessenger.showError(
                          context,
                          context.appLoc.could_not_launch_email_app,
                        );
                      }
                    }
                  } catch (e) {
                    if (context.mounted) {
                      AppMessenger.showError(
                        context,
                        '${context.appLoc.error_launching_app} $e',
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: Constants.spacingLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(ThemeData theme, String text) {
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        height: 1.5,
        fontSize: 15,
        color: theme.colorScheme.onSurface,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildContactRow({
    required ThemeData theme,
    required IconData icon,
    required String title,
    required String value,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    final isDark = theme.brightness == Brightness.dark;
    final iconBgColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final iconColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: iconBgColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, size: 18, color: iconColor),
        ),
        const SizedBox(width: Constants.spacingMedium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.darkTextSecondary
                      : Colors.grey.shade500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingMediumLarge,
            ),
            minimumSize: const Size(0, 40),
            elevation: 0,
          ),
          child: Text(
            buttonText,
            style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
