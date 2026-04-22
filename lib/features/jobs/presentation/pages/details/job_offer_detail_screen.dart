import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class JobOfferDetailScreen extends StatelessWidget {
  const JobOfferDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final surfaceColor = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;

    return BaseScreen(
      appBar: const TitleHeader(title: 'Job details'),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: Constants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Info
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  Row(
                    children: [
                      Text('Limite date  ', style: theme.textTheme.bodySmall),
                      const Icon(
                        Icons.access_time,
                        size: Constants.iconSizeExtraSmall,
                        color: AppColors.danger,
                      ),
                      const SizedBox(width: Constants.spacingExtraSmall),
                      Text(
                        '4 Juillet 2026',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.spacingExtraSmall),
                  Text(
                    'Posted  •  1h',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Constants.spacingMedium),
            Divider(
              color: borderColor,
              thickness: 1,
              height: 1,
              indent: Constants.paddingMedium,
              endIndent: Constants.paddingMedium,
            ),
            const SizedBox(height: Constants.spacingMedium),

            // Image
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: ClipRRect(
                child: Image.asset(
                  Assets.hiring,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: Constants.spacingMedium),
            Divider(
              color: borderColor,
              thickness: 1,
              height: 1,
              indent: Constants.paddingMedium,
              endIndent: Constants.paddingMedium,
            ),
            const SizedBox(height: Constants.spacingMedium),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingMedium),
                  Text(
                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\n\nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n\nIt was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: theme.textTheme.bodyMedium?.copyWith(height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Constants.spacingMedium),
            Divider(
              color: borderColor,
              thickness: 1,
              height: 1,
              indent: Constants.paddingMedium,
              endIndent: Constants.paddingMedium,
            ),
            const SizedBox(height: Constants.spacingMedium),

            // Job features
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Job features',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingMedium),
                  _buildFeatureRow(
                    context,
                    label: 'Category',
                    value: 'Designer',
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  _buildFeatureRow(
                    context,
                    label: 'Location',
                    value: 'Outside the country',
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  _buildFeatureRow(context, label: 'Gender', value: 'Together'),
                ],
              ),
            ),
            const SizedBox(height: Constants.spacingMedium),
            Divider(
              color: borderColor,
              thickness: 1,
              height: 1,
              indent: Constants.paddingMedium,
              endIndent: Constants.paddingMedium,
            ),
            const SizedBox(height: Constants.spacingMedium),

            // Actor
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Actor',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingMedium),
                  Text('ONG', style: theme.textTheme.bodySmall),
                ],
              ),
            ),
            const SizedBox(height: Constants.spacingMedium),
            Divider(
              color: borderColor,
              thickness: 1,
              height: 1,
              indent: Constants.paddingMedium,
              endIndent: Constants.paddingMedium,
            ),
            const SizedBox(height: Constants.spacingMedium),

            // About the client
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.paddingMedium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About the client',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingMedium),
                  Row(
                    children: [
                      Container(
                        width: Constants.size35,
                        height: Constants.size35,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: surfaceColor,
                          border: Border.all(color: borderColor, width: 1),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            Assets.rabbitAvatar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: Constants.spacingSmall),
                      Text('Full Name', style: theme.textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  Row(
                    children: [
                      const Icon(
                        Icons.verified_user_outlined,
                        size: Constants.iconSizeExtraSmall,
                        color: AppColors.success,
                      ),
                      const SizedBox(width: Constants.spacingExtraSmall),
                      Text(
                        'Verified phone number',
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  Text('10 jobs posted', style: theme.textTheme.bodySmall),
                  const SizedBox(height: Constants.spacingSmall),
                  Text('Antananarivo', style: theme.textTheme.bodySmall),
                  const SizedBox(height: Constants.spacingSmall),
                  Text(
                    'Member since Jan 20, 2024',
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: Constants.spacingLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(
    BuildContext context, {
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label :',
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: Constants.spacingExtraSmall),
        Expanded(child: Text(value, style: theme.textTheme.bodySmall)),
      ],
    );
  }
}
