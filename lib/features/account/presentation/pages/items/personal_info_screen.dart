import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/presentation/widgets/account_header.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu_card.dart';
import 'package:kianja/features/account/presentation/widgets/personal_info_row.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: const AccountHeader(title: 'Personal Info'),
      child: Stack(
        children: [
          // ── Scrollable content ──────────────────────────────────────────
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(
              Constants.paddingMedium,
              Constants.spacingMedium,
              Constants.paddingMedium,
              // extra bottom padding so the FAB never covers the last row
              Constants.spacingLarge + Constants.size50,
            ),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                final user = state.user;
                final fullName = '${user.firstName} ${user.lastName}'.trim();

                return Column(
                  children: [
                    const SizedBox(height: Constants.spacingMedium),
                    // ── Avatar ────────────────────────────────────────────
                    ClipOval(
                      child: Image.asset(
                        Assets.rabbitAvatar,
                        fit: BoxFit.cover,
                        cacheWidth: Constants.size100.toInt(),
                        cacheHeight: Constants.size100.toInt(),
                        width: Constants.size100,
                        height: Constants.size100,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.person,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                          size: Constants.iconSizeLarge,
                        ),
                      ),
                    ),
                    const SizedBox(height: Constants.spacingMedium),

                    // ── Full name headline ─────────────────────────────────
                    Text(
                      fullName.isEmpty ? 'Full Name' : fullName,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    const SizedBox(height: Constants.spacingLarge),

                    // ── Info card ─────────────────────────────────────────
                    AccountMenuCard(
                      children: [
                        PersonalInfoRow(
                          icon: Icons.person_outline,
                          label: 'Full Name',
                          value: fullName.isEmpty ? 'Full name' : fullName,
                          iconColor: AppColors.warning,
                        ),
                        _Divider(isDark: isDark),
                        const PersonalInfoRow(
                          icon: Icons.mail_outline,
                          label: 'Email',
                          value: 'example@gmail.com',
                          iconColor: AppColors.info,
                        ),
                        _Divider(isDark: isDark),
                        const PersonalInfoRow(
                          icon: Icons.phone_outlined,
                          label: 'Phone Number',
                          value: '034 00 000 00',
                          iconColor: AppColors.success,
                        ),
                        _Divider(isDark: isDark),
                        const PersonalInfoRow(
                          icon: Icons.location_on_outlined,
                          label: 'Residence',
                          value: 'Antananarivo',
                          iconColor: AppColors.danger,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          // ── Edit FAB — bottom-right ────────────────────────────────────
          Positioned(
            right: Constants.paddingMedium,
            bottom: Constants.spacingMedium,
            child: ElevatedButton(
              onPressed: () {
                // TODO: navigate to edit personal info
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.paddingMediumLarge,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Constants.borderRadiusMedium,
                  ),
                ),
              ),
              child: Text(
                'Edit',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Internal divider ─────────────────────────────────────────────────────────

class _Divider extends StatelessWidget {
  const _Divider({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.spacingSmall),
      child: Divider(
        height: 1,
        thickness: 0.5,
        color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
      ),
    );
  }
}
