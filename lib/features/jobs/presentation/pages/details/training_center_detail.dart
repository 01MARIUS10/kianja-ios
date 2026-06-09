import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
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
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterDetail extends StatelessWidget {
  const TrainingCenterDetail({
    super.key,
    required this.id,
    required this.matchedLocationBefore,
  });
  final int id;
  final String matchedLocationBefore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return BlocProvider(
          create: (context) => GetIt.instance<JobsBloc>()
            ..add(
              GetTrainingCenterDetailRequested(
                trainingCenterDetailParams: TrainingCenterDetailParams(id: id),
              ),
            ),
          child: BaseScreen(
            appBar: TitleHeader(title: context.appLoc.training_center_detail),
            child: BlocBuilder<JobsBloc, JobsState>(
              builder: (context, state) {
                if (state is GetTrainingCenterDetailSuccess) {
                  final trainingCenter = state.trainingCenter;
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
                                trainingCenter.name,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: Constants.spacingSmall),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${context.appLoc.posted}  •  ${AppFunction.dateTimeCounter(trainingCenter.createdAt, context)}',
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: textSecondary,
                                    ),
                                  ),
                                  if (appState.user.id ==
                                          state.trainingCenter.user.id &&
                                      matchedLocationBefore ==
                                          Routes.myPost.path)
                                    InkWell(
                                      onTap: () {
                                        context.pushNamed(
                                          Routes.postHotEvent.name,
                                          pathParameters: {
                                            'trainingCenterId': trainingCenter
                                                .id
                                                .toString(),
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.flash_on_outlined,
                                            color: isDark
                                                ? AppColors.darkPrimary
                                                : AppColors.lightPrimary,
                                            size: Constants.iconSizeExtraSmall,
                                          ),
                                          Text(
                                            context.appLoc.make_an_offer,
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                  color: isDark
                                                      ? AppColors.darkPrimary
                                                      : AppColors.lightPrimary,
                                                ),
                                          ),
                                          Icon(
                                            Icons.flash_on_outlined,
                                            color: isDark
                                                ? AppColors.darkPrimary
                                                : AppColors.lightPrimary,
                                            size: Constants.iconSizeExtraSmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
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
                        if (trainingCenter.images != null &&
                            trainingCenter.images!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Constants.paddingMedium,
                                ),
                                child: PhotoHandler(
                                  width: double.infinity,
                                  imageUrls: trainingCenter.images!
                                      .map(
                                        (image) =>
                                            '${EnvConfig.baseApiUrl}${image.url}',
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
                                trainingCenter.description,
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
                                context.appLoc.training_center_features,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: Constants.spacingMedium),
                              _buildFeatureRow(
                                context,
                                label: context.appLoc.domain,
                                value: trainingCenter.domains
                                    .map((domain) => domain.name)
                                    .toList()
                                    .join(', '),
                              ),
                              const SizedBox(height: Constants.spacingSmall),
                              _buildFeatureRow(
                                context,
                                label: context.appLoc.location,
                                value: trainingCenter.location?.name ?? '',
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
                                context.appLoc.about_center_publisher,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: Constants.spacingMedium),
                              Row(
                                children: [
                                  ClipOval(
                                    child:
                                        trainingCenter.user.photoUrl.isNotEmpty
                                        ? Image.network(
                                            '${EnvConfig.baseApiUrl}${trainingCenter.user.photoUrl}',
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
                                    '${trainingCenter.user.firstName} ${trainingCenter.user.lastName}',
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
                                trainingCenter.user.residence,
                                style: theme.textTheme.bodySmall,
                              ),
                              const SizedBox(height: Constants.spacingSmall),
                              Text(
                                '${context.appLoc.member_since} ${AppFunction.getDate(trainingCenter.user.createdAt)}',
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
                      BlocProvider.of<JobsBloc>(context).add(
                        GetTrainingCenterDetailRequested(
                          trainingCenterDetailParams:
                              TrainingCenterDetailParams(id: id),
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
        );
      },
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
