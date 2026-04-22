import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu/account_menu_accordion_item.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu/account_menu_card.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu/account_menu_image_item.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu/account_menu_item.dart';
import 'package:kianja/features/account/presentation/widgets/logout_confirmation_dialog.dart';
import 'package:kianja/routing/routes.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => GetIt.instance<AccountBloc>(),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Account'),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(Constants.paddingMedium),
          child: Column(
            children: [
              const SizedBox(height: Constants.spacingMedium),
              // Profile Section
              BlocBuilder<AppBloc, AppState>(
                builder: (context, state) {
                  final user = state.user;
                  return Center(
                    child: Column(
                      children: [
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
                              //     errorBuilder: (context, error, stackTrace) =>
                              //         Icon(
                              //           Icons.person,
                              //           color: isDark
                              //               ? AppColors.darkTextSecondary
                              //               : AppColors.lightTextSecondary,
                              //           size: Constants.iconSizeLarge,
                              //         ),
                              //   ),
                              // ),

                              // Edit badge
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    context.goNamed(
                                      Routes.updatePersonalInfo.name,
                                    );
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
                        Text(
                          '${state.user.firstName} ${state.user.lastName}'
                              .trim(),
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: Constants.spacingLarge),

              // Card 1: Personal Info
              AccountMenuCard(
                children: [
                  AccountMenuItem(
                    icon: Icons.person_outline,
                    label: 'Personal Info',
                    iconColor: AppColors.warning,
                    onTap: () {
                      context.goNamed(Routes.personalInfo.name);
                    },
                  ),
                ],
              ),

              // Card 2: General Settings
              const AccountMenuCard(
                children: [
                  AccountMenuImageItem(
                    asset: Assets.kara,
                    label: 'KARA',
                    iconColor: Colors.green,
                  ),
                  AccountMenuItem(
                    icon: Icons.bookmark_outline,
                    label: 'Saved',
                    iconColor: Colors.blueGrey,
                  ),
                  AccountMenuItem(
                    icon: Icons.notifications_none_outlined,
                    label: 'Notifications',
                    iconColor: AppColors.warning,
                  ),
                  AccountMenuAccordionItem(iconColor: Colors.green),
                ],
              ),

              // Card 3: Account Settings
              AccountMenuCard(
                children: [
                  const AccountMenuItem(
                    icon: Icons.help_outline,
                    label: 'Privacy',
                    iconColor: AppColors.warning,
                  ),
                  AccountMenuItem(
                    icon: Icons.view_comfy_alt_outlined,
                    label: 'Change password',
                    iconColor: Colors.cyan,
                    onTap: () {
                      // context.go('${Routes.account}/${Routes.changePassword}');
                      context.goNamed(Routes.changePassword.name);
                    },
                  ),
                  const AccountMenuItem(
                    icon: Icons.settings_outlined,
                    label: 'Delete account',
                    iconColor: Colors.indigo,
                  ),
                ],
              ),

              // Card 4: Log Out
              BlocConsumer<AccountBloc, AccountState>(
                listener: (context, state) {
                  if (state is AccountRequestFailure) {
                    if (context.canPop()) {
                      context.pop();
                    }
                    AppMessenger.showError(context, state.message);
                  }
                  if (state is AccountLogoutSuccess) {
                    if (context.canPop()) {
                      context.pop();
                    }
                    BlocProvider.of<AppBloc>(
                      context,
                    ).add(const AppAuthenticated(isAuthenticated: false));
                    context.goNamed(Routes.signIn.name);
                  }
                },
                builder: (context, state) {
                  return AccountMenuCard(
                    children: [
                      AccountMenuItem(
                        icon: Icons.logout,
                        label: 'Log Out',
                        iconColor: AppColors.danger,
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (dialogContext) {
                              return BlocProvider.value(
                                value: BlocProvider.of<AccountBloc>(context),
                                child: BlocBuilder<AccountBloc, AccountState>(
                                  builder: (context, state) {
                                    return LogoutConfirmationDialog(
                                      isLoading:
                                          (state is AccountRequestInProgress) ||
                                          (state is AccountLogoutSuccess),
                                      onConfirm: () {
                                        BlocProvider.of<AccountBloc>(
                                          context,
                                        ).add(const AccountLogoutRequested());
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: Constants.spacingMedium),
            ],
          ),
        ),
      ),
    );
  }
}
