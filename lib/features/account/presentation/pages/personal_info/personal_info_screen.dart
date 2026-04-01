import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/presentation/widgets/account_header.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu/account_menu_card.dart';
import 'package:kianja/features/account/presentation/widgets/personal_info_row.dart';
import 'package:kianja/routing/routes.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BaseScreen(
      appBar: const AccountHeader(title: 'Personal Info'),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          Constants.paddingMedium,
          Constants.spacingMedium,
          Constants.paddingMedium,
          Constants.spacingLarge,
        ),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            final user = state.user;
            final fullName = '${user.firstName} ${user.lastName}'.trim();

            return Column(
              children: [
                const SizedBox(height: Constants.spacingMedium),
                // ── Avatar with edit badge ───────────────────────
                Center(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      // Avatar circle
                      CircleUserAvatar(user: user),
                      // ClipOval(
                      //   child: Image.asset(
                      //     Assets.rabbitAvatar,
                      //     fit: BoxFit.cover,
                      //     cacheWidth: Constants.size100.toInt(),
                      //     cacheHeight: Constants.size100.toInt(),
                      //     width: Constants.size100,
                      //     height: Constants.size100,
                      //     errorBuilder: (context, error, stackTrace) => Icon(
                      //       Icons.person,
                      //       color: isDark
                      //           ? AppColors.darkTextSecondary
                      //           : AppColors.lightTextSecondary,
                      //       size: Constants.iconSizeLarge,
                      //     ),
                      //   ),
                      // ),

                      // Edit badge
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            context.goNamed(Routes.updatePersonalInfo.name);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkPrimary
                                  : AppColors.lightPrimary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isDark
                                    ? AppColors.darkBorder
                                    : AppColors.lightBorder,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                    const Divider(thickness: 0.5),
                    PersonalInfoRow(
                      icon: Icons.mail_outline,
                      label: 'Email',
                      value: user.email,
                      iconColor: AppColors.info,
                    ),
                    const Divider(thickness: 0.5),

                    PersonalInfoRow(
                      icon: Icons.phone_outlined,
                      label: 'Phone Number',
                      value:
                          '+261 ${AppFunction.formatPhoneNumber(user.phone)}',
                      iconColor: AppColors.success,
                    ),
                    const Divider(thickness: 0.5),

                    PersonalInfoRow(
                      icon: Icons.location_on_outlined,
                      label: 'Residence',
                      value: user.residence,
                      iconColor: AppColors.danger,
                    ),
                  ],
                ),
                const SizedBox(height: Constants.spacingSmall),
              ],
            );
          },
        ),
      ),
    );
  }
}
