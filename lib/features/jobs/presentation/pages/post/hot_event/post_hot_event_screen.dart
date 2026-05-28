import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/routing/routes.dart';

enum PostHotEventType { hot, event }

class PostHotEventScreen extends StatefulWidget {
  const PostHotEventScreen({super.key, required this.trainingCenterId});
  final int trainingCenterId;

  @override
  State<PostHotEventScreen> createState() => _PostHotEventScreenState();
}

class _PostHotEventScreenState extends State<PostHotEventScreen> {
  PostHotEventType _selectedType = PostHotEventType.hot;

  String get _title {
    return switch (_selectedType) {
      PostHotEventType.hot => context.appLoc.hot_offer,
      PostHotEventType.event => context.appLoc.event_offer,
    };
  }

  String get _description {
    return switch (_selectedType) {
      PostHotEventType.hot => context.appLoc.create_hot_offer,
      PostHotEventType.event => context.appLoc.create_event_offer,
    };
  }

  void _handleCreate() {
    switch (_selectedType) {
      case PostHotEventType.hot:
        context.goNamed(
          Routes.createHotEvent.name,
          pathParameters: {
            'trainingCenterId': widget.trainingCenterId.toString(),
          },
          extra: {'type': context.appLoc.hot},
        );
        break;
      case PostHotEventType.event:
        context.goNamed(
          Routes.createHotEvent.name,
          pathParameters: {
            'trainingCenterId': widget.trainingCenterId.toString(),
          },
          extra: {'type': context.appLoc.event},
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: TitleHeader(title: context.appLoc.make_an_offer),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.paddingMedium,
          horizontal: Constants.paddingMedium,
        ),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.darkTextPrimary
                        : AppColors.lightTextPrimary,
                  ),
                ),
                const SizedBox(height: Constants.spacingSmall),
                Text(
                  _description,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: Constants.spacingLarge),
                _PostOptionTile(
                  icon: Icons.flash_on,
                  title: context.appLoc.hot,
                  isSelected: _selectedType == PostHotEventType.hot,
                  isDark: isDark,
                  theme: theme,
                  onTap: () {
                    setState(() {
                      _selectedType = PostHotEventType.hot;
                    });
                  },
                ),
                const SizedBox(height: Constants.spacingMedium),
                _PostOptionTile(
                  icon: Icons.calendar_month,
                  title: context.appLoc.event,
                  isSelected: _selectedType == PostHotEventType.event,
                  isDark: isDark,
                  theme: theme,
                  onTap: () {
                    setState(() {
                      _selectedType = PostHotEventType.event;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: Constants.spacingLarge),
            SizedBox(
              width: double.infinity,
              height: Constants.size50,
              child: ElevatedButton(
                onPressed: _handleCreate,
                child: Text(
                  context.appLoc.create.toUpperCase(),
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostOptionTile extends StatelessWidget {
  const _PostOptionTile({
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.isDark,
    required this.theme,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isDark;
  final ThemeData theme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color selectedBorderColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;
    final Color unselectedBorderColor = isDark
        ? AppColors.darkBorder
        : Colors.grey.shade300;

    final Color iconColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(Constants.paddingMedium),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
          borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
          border: Border.all(
            color: isSelected ? selectedBorderColor : unselectedBorderColor,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkBackground
                    : AppColors.lightBackground,
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
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
