import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/shared/widgets/photos/photo_handler.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';

class JobOfferDetailScreen extends StatelessWidget {
  const JobOfferDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return BlocProvider(
      create: (context) =>
          GetIt.instance<JobsBloc>()
            ..add(JobsGetJobOfferDetailRequested(id: id)),
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.job_offer_detail),
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is JobsGetJobOfferDetailSuccess) {
              final jobOffer = state.jobOffer;
              final isExpired = AppFunction.isExpired(jobOffer.dateLimit);
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
                            jobOffer.title,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          Row(
                            children: [
                              Text(
                                '${context.appLoc.deadline}  ',
                                style: theme.textTheme.bodySmall,
                              ),
                              Icon(
                                Icons.access_time,
                                size: Constants.iconSizeExtraSmall,
                                color: isExpired
                                    ? AppColors.danger
                                    : AppColors.success,
                              ),
                              const SizedBox(
                                width: Constants.spacingExtraSmall,
                              ),
                              Text(
                                isExpired
                                    ? '${AppFunction.getDate(jobOffer.dateLimit)} (${context.appLoc.expired})'
                                    : AppFunction.getDate(jobOffer.dateLimit),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isExpired
                                      ? AppColors.danger.withValues(alpha: 0.7)
                                      : AppColors.success,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Constants.spacingExtraSmall),
                          Text(
                            '${context.appLoc.posted}  •  ${AppFunction.dateTimeCounter(jobOffer.createdAt, context)}',
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
                    if (jobOffer.image != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.paddingMedium,
                            ),
                            child: PhotoHandler(
                              width: double.infinity,
                              imageUrls: [jobOffer.image]
                                  .map(
                                    (image) =>
                                        '${EnvConfig.baseApiUrl}${image?.url}',
                                  )
                                  .toList(),
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
                            jobOffer.description,
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

                    // Job features
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appLoc.job_features,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          _buildFeatureRow(
                            context,
                            label: context.appLoc.categories,
                            value: jobOffer.categories
                                .map((category) => category.name)
                                .join(', '),
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          _buildFeatureRow(
                            context,
                            label: context.appLoc.location,
                            value: jobOffer.location?.name ?? '',
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          _buildFeatureRow(
                            context,
                            label: context.appLoc.gender,
                            value: jobOffer.gender?.name ?? '',
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

                    // Actor
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appLoc.actor,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          Text(
                            jobOffer.actor?.name ?? '',
                            style: theme.textTheme.bodySmall,
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

                    // About the client
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.appLoc.about_client,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          Row(
                            children: [
                              ClipOval(
                                child: jobOffer.user.photoUrl.isNotEmpty
                                    ? Image.network(
                                        '${EnvConfig.baseApiUrl}${jobOffer.user.photoUrl}',
                                        fit: BoxFit.cover,
                                        width: Constants.size35,
                                        height: Constants.size35,
                                        errorBuilder: (_, _, _) =>
                                            const DefaultAvatar(
                                              size: Constants.size35,
                                            ),
                                      )
                                    : const DefaultAvatar(
                                        size: Constants.size35,
                                      ),
                              ),
                              const SizedBox(width: Constants.spacingSmall),
                              Text(
                                '${jobOffer.user.firstName} ${jobOffer.user.lastName}',
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
                          // Text(
                          //   '10 jobs posted',
                          //   style: theme.textTheme.bodySmall,
                          // ),
                          // const SizedBox(height: Constants.spacingSmall),
                          Text(
                            jobOffer.user.residence,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          Text(
                            '${context.appLoc.member_since} ${AppFunction.getDate(jobOffer.user.createdAt)}',
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
                  ).add(JobsGetJobOfferDetailRequested(id: id));
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
