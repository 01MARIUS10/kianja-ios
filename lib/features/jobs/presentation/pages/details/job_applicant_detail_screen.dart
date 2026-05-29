import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/routing/routes.dart';

class JobApplicantDetailScreen extends StatelessWidget {
  const JobApplicantDetailScreen({super.key, required this.id});
  final int id;

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

    return BlocProvider(
      create: (context) =>
          GetIt.instance<JobsBloc>()
            ..add(JobsGetJobApplicantDetailRequested(id: id)),
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.job_applicant_detail),
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsGetJobApplicantDetailSuccess) {
              final jobApplicant = state.jobApplicant;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: Constants.paddingMedium,
                ),
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
                            jobApplicant.title,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          Text(
                            '${context.appLoc.posted}  •  ${AppFunction.dateTimeCounter(jobApplicant.createdAt, context)}',
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

                    // Description
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appLoc.description,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          Text(
                            jobApplicant.motivation,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.5,
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

                    if (jobApplicant.pdfUrl.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Resume
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.paddingMedium,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.appLoc.resume,
                                  style: theme.textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: Constants.spacingMedium),
                                InkWell(
                                  onTap: () {
                                    // AppDebug.showPrint(
                                    //   'Opening PDF: ${jobApplicant.pdfUrl}',
                                    // );
                                    // final url = Uri.parse(
                                    //   '${EnvConfig.baseApiUrl}${jobApplicant.pdfUrl}',
                                    // );
                                    // if (await canLaunchUrl(url)) {
                                    //   await launchUrl(url);
                                    // }
                                    context.pushNamed(
                                      Routes.jobApplicantViewPdf.name,
                                      pathParameters: {
                                        'id': jobApplicant.id.toString(),
                                      },
                                      extra: {
                                        'pdfUrl':
                                            '${EnvConfig.baseApiUrl}${jobApplicant.pdfUrl}',
                                      },
                                    );
                                  },
                                  child: Image.asset(Assets.pdf, height: 40),
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
                        ],
                      ),

                    // Job features
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appLoc.job_features_preference,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          _buildFeatureRow(
                            context,
                            label: context.appLoc.category,
                            value: jobApplicant.category?.name ?? '',
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          _buildFeatureRow(
                            context,
                            label: context.appLoc.location,
                            value: jobApplicant.location.name,
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          _buildFeatureRow(
                            context,
                            label: context.appLoc.gender,
                            value: jobApplicant.gender?.name ?? '',
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

                    // About the applicant
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appLoc.about_applicant,
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
                                  border: Border.all(
                                    color: borderColor,
                                    width: 1,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    Assets.rabbitAvatar,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Text(
                                '${jobApplicant.user.firstName} ${jobApplicant.user.lastName}',
                                style: theme.textTheme.bodySmall,
                              ),
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
                              const SizedBox(
                                width: Constants.spacingExtraSmall,
                              ),
                              Text(
                                context.appLoc.verified_phone_number,
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          Text(
                            jobApplicant.user.residence,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          Text(
                            '${context.appLoc.member_since} ${AppFunction.getDate(jobApplicant.user.createdAt)}',
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: Constants.spacingLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is JobsRequestFailure) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<JobsBloc>(
                    context,
                  ).add(JobsGetJobApplicantDetailRequested(id: id));
                },
                message: state.message,
              );
            } else {
              return const ShimmerJobDetailIndicator();
            }
          },
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
