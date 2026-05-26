import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/shared/widgets/photos/photo_handler.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';

class TrainingCenterDetail extends StatelessWidget {
  const TrainingCenterDetail({super.key, required this.id});
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
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(
          GetTrainingCenterDetailRequested(
            trainingCenterDetailParams: TrainingCenterDetailParams(id: id),
          ),
        ),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Training center details'),
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
                          Text(
                            'Posted  •  ${AppFunction.dateTimeCounter(trainingCenter.createdAt)}',
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
                      child: PhotoHandler(
                        height: 300,
                        width: double.infinity,
                        imageUrls: trainingCenter.images
                            .map(
                              (image) => '${EnvConfig.baseApiUrl}${image.url}',
                            )
                            .toList(),
                      ),
                      // child: ClipRRect(
                      //   child: CachedNetworkImage(
                      //     imageUrl:
                      //         '${EnvConfig.baseApiUrl}${trainingCenter.imageUrl}',
                      //     fit: BoxFit.cover,
                      //     errorWidget: (context, url, error) {
                      //       return Image.asset(
                      //         Assets.hiring,
                      //         fit: BoxFit.cover,
                      //         errorBuilder: (context, url, error) => const Icon(
                      //           Icons.image,
                      //           size: 40,
                      //           color: Colors.grey,
                      //         ),
                      //       );
                      //     },
                      //     progressIndicatorBuilder: (context, url, progress) {
                      //       return const Center(
                      //         child: CircularProgressIndicator(),
                      //       );
                      //     },
                      //   ),
                      // ),
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
                            'Training center features',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          _buildFeatureRow(
                            context,
                            label: 'Category',
                            value: trainingCenter.category?.name ?? '',
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          _buildFeatureRow(
                            context,
                            label: 'Location',
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
                                'Verified phone number',
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
                            'Member since ${AppFunction.getDate(trainingCenter.user.createdAt)}',
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
                      trainingCenterDetailParams: TrainingCenterDetailParams(
                        id: id,
                      ),
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
