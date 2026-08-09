import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/circle_user_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/account/presentation/widgets/account_menu/account_menu_card.dart';
import 'package:kianja/features/account/presentation/widgets/personal_info_row.dart';
import 'package:kianja/features/jobs/domain/usecases/block_user/block_user_params.dart';
import 'package:kianja/features/jobs/domain/usecases/view_user_profile/view_user_profile_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/routing/routes.dart';

class ViewProfileScreen extends StatelessWidget {
  const ViewProfileScreen({required this.id, super.key});
  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(
          JobsViewUserProfileRequested(
            viewUserProfileParams: ViewUserProfileParams(id: id),
          ),
        ),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'User profile'),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            Constants.paddingMedium,
            Constants.spacingMedium,
            Constants.paddingMedium,
            Constants.spacingLarge,
          ),
          child: BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobsBlockUserSuccess) {
                context.pushReplacementNamed(Routes.jobs.name);
                AppMessenger.showSuccess(
                  context,
                  'Utilisateur bloqué avec succès',
                );
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is JobsViewUserProfileSuccess) {
                final user = state.user;
                final fullName = '${user.firstName} ${user.lastName}'.trim();

                return Column(
                  children: [
                    const SizedBox(height: Constants.spacingMedium),
                    // ── Avatar
                    CircleUserAvatar(user: user),
                    const SizedBox(height: Constants.spacingMedium),

                    // ── Full name headline ─────────────────────────────────
                    Text(
                      fullName.isEmpty ? context.appLoc.full_name : fullName,
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
                          label: context.appLoc.full_name,
                          value: fullName.isEmpty
                              ? context.appLoc.full_name
                              : fullName,
                          iconColor: AppColors.warning,
                        ),
                        if (user.email.isNotEmpty)
                          Column(
                            children: [
                              const Divider(thickness: 0.5),
                              PersonalInfoRow(
                                icon: Icons.mail_outline,
                                label: context.appLoc.email,
                                value: user.email,
                                iconColor: AppColors.info,
                              ),
                            ],
                          ),
                        const Divider(thickness: 0.5),

                        PersonalInfoRow(
                          icon: Icons.phone_outlined,
                          label: context.appLoc.phone_number,
                          value:
                              '+261 ${AppFunction.formatPhoneNumber(user.phone)}',
                          iconColor: AppColors.success,
                        ),
                        const Divider(thickness: 0.5),

                        PersonalInfoRow(
                          icon: Icons.location_on_outlined,
                          label: context.appLoc.residence,
                          value: user.residence,
                          iconColor: AppColors.danger,
                        ),

                        if (user.cvUrl.isNotEmpty)
                          Column(
                            children: [
                              const Divider(thickness: 0.5),
                              InkWell(
                                onTap: () {
                                  context.pushNamed(
                                    Routes.viewProfileCV.name,
                                    extra: {
                                      'pdfUrl':
                                          EnvConfig.baseApiUrl + user.cvUrl,
                                    },
                                  );
                                },
                                child: PersonalInfoRow(
                                  icon: Icons.picture_as_pdf_outlined,
                                  label: context.appLoc.resume,
                                  value: 'Voir mon CV',
                                  iconColor: AppColors.info,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    const SizedBox(height: Constants.spacingSmall),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<JobsBloc>(context).add(
                            JobsBlockUserRequested(
                              blockUserParams: BlockUserParams(id: id),
                            ),
                          );
                        },
                        child: Text(
                          'Bloquer'.toUpperCase(),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                            color: isDark
                                ? AppColors.darkTextPrimary
                                : AppColors.lightTextPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is JobsRequestFailure) {
                return ServerFailureScreen(
                  onRetry: () {
                    BlocProvider.of<JobsBloc>(context).add(
                      JobsViewUserProfileRequested(
                        viewUserProfileParams: ViewUserProfileParams(id: id),
                      ),
                    );
                  },
                  message: state.message,
                );
              } else {
                return const ShimmerJobDetailIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
