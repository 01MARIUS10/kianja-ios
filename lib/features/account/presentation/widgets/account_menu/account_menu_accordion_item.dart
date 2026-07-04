import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/themes/mode/app_mode.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

/// An accordion-style account menu item that expands to show a radio list
/// of theme options (Light / Dark / System) and collapses after selection.
///
/// Shares the same visual language as [AccountMenuItem]:
/// - Circular icon bubble on the left
/// - Label text + animated chevron
/// - Expanding radio list with smooth animation
class AccountMenuAccordionItem extends StatefulWidget {
  const AccountMenuAccordionItem({super.key, this.iconColor});

  final Color? iconColor;

  @override
  State<AccountMenuAccordionItem> createState() =>
      _AccountMenuAccordionItemState();
}

class _AccountMenuAccordionItemState extends State<AccountMenuAccordionItem>
    with SingleTickerProviderStateMixin {
  bool _expanded = false;

  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  late final Animation<double> _chevronAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _chevronAnimation = Tween<double>(
      begin: 0,
      end: 0.25, // 90° rotation
    ).animate(_expandAnimation);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      _expanded ? _controller.forward() : _controller.reverse();
    });
  }

  void _select(BuildContext context, AppMode mode) {
    BlocProvider.of<AppBloc>(context).add(AppThemeChanged(appMode: mode));
    // Collapse after selection
    setState(() {
      _expanded = false;
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final currentMode = context.select((AppBloc bloc) => bloc.state.appMode);

    final iconBubbleColor = isDark
        ? AppColors.darkBackground
        : AppColors.lightBackground;
    final labelColor = isDark
        ? AppColors.darkTextPrimary
        : AppColors.lightTextPrimary;
    final radioActiveColor = isDark
        ? AppColors.darkPrimary
        : AppColors.lightPrimary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    final kThemeOptions = [
      (
        label: context.appLoc.light,
        icon: Icons.light_mode_outlined,
        mode: AppMode.light,
      ),
      (
        label: context.appLoc.dark,
        icon: Icons.dark_mode_outlined,
        mode: AppMode.dark,
      ),
      (
        label: context.appLoc.system,
        icon: Icons.brightness_auto_outlined,
        mode: AppMode.system,
      ),
    ];
    // Derive current label for the subtitle
    final currentLabel = kThemeOptions
        .firstWhere((o) => o.mode == currentMode)
        .label;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Header row ────────────────────────────────────────────────────
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _toggle,
            borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
            splashColor: isDark
                ? Colors.white.withValues(alpha: 0.05)
                : Colors.black.withValues(alpha: 0.05),
            highlightColor: isDark
                ? Colors.white.withValues(alpha: 0.03)
                : Colors.black.withValues(alpha: 0.03),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Constants.spacingSmall,
                horizontal: Constants.spacingSmall,
              ),
              child: Row(
                children: [
                  // Icon bubble — identical to AccountMenuItem
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: iconBubbleColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.brightness_6_outlined,
                      size: 18,
                      color:
                          widget.iconColor ??
                          (isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary),
                    ),
                  ),
                  const SizedBox(width: Constants.spacingMedium),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          context.appLoc.theme,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: labelColor,
                          ),
                        ),
                        Text(
                          currentLabel,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: isDark
                                ? AppColors.darkTextSecondary
                                : AppColors.lightTextSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Animated rotating chevron
                  RotationTransition(
                    turns: _chevronAnimation,
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                      color: isDark
                          ? AppColors.darkTextMuted
                          : AppColors.lightTextMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // ── Expanding radio list ───────────────────────────────────────────
        SizeTransition(
          sizeFactor: _expandAnimation,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Divider(
                height: 1,
                thickness: 0.5,
                indent: Constants.spacingSmall,
                endIndent: Constants.spacingSmall,
                color: borderColor,
              ),
              ...kThemeOptions.map(
                (option) => _ThemeRadioTile(
                  icon: option.icon,
                  label: option.label,
                  mode: option.mode,
                  selected: currentMode == option.mode,
                  activeColor: radioActiveColor,
                  isDark: isDark,
                  onTap: () => _select(context, option.mode),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Radio tile ───────────────────────────────────────────────────────────────

class _ThemeRadioTile extends StatelessWidget {
  const _ThemeRadioTile({
    required this.icon,
    required this.label,
    required this.mode,
    required this.selected,
    required this.activeColor,
    required this.isDark,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final AppMode mode;
  final bool selected;
  final Color activeColor;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.spacingMedium,
          vertical: Constants.spacingSmall,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: selected
                  ? activeColor
                  : (isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary),
            ),
            const SizedBox(width: Constants.spacingMedium),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: selected
                      ? activeColor
                      : (isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary),
                  fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: selected
                  ? Icon(
                      Icons.check_circle_rounded,
                      key: const ValueKey(true),
                      size: 22,
                      color: activeColor,
                    )
                  : Icon(
                      Icons.circle_outlined,
                      key: const ValueKey(false),
                      size: 22,
                      color: isDark
                          ? AppColors.darkTextMuted
                          : AppColors.lightTextMuted,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
