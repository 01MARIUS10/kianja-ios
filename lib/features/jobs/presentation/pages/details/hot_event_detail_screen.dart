import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/shared/widgets/photos/photo_handler.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/routing/routes.dart';

class HotEventDetailScreen extends StatelessWidget {
  const HotEventDetailScreen({
    super.key,
    required this.id,
    required this.name,
    required this.query,
  });
  final int id;
  final String name;
  final String query;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(
          GetHotEventDetailRequested(
            getHotEventDetailParams: GetHotEventDetailParams(
              query: query,
              id: id,
            ),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: name),
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is GetHotEventDetailSuccess) {
              final hotEvent = state.hotEvent;
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
                            hotEvent.title,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.paddingMedium),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${context.appLoc.start} : ',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: textSecondary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            AppFunction.getDate(
                                              hotEvent.startDate,
                                            ),
                                            style: theme.textTheme.bodySmall
                                                ?.copyWith(
                                                  color: hotEvent.type == 'hot'
                                                      ? AppColors.warning
                                                      : AppColors.darkPrimary,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          '${context.appLoc.end} : ',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                                color: textSecondary,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            AppFunction.getDate(
                                              hotEvent.endDate,
                                            ),
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                  color: hotEvent.type == 'hot'
                                                      ? AppColors.danger
                                                      : AppColors.endEvent,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  context.pushNamed(
                                    Routes.trainingCenterDetail.name,
                                    pathParameters: {
                                      'trainingCenterId': hotEvent.center.id
                                          .toString(),
                                    },
                                  );
                                },
                                borderRadius: BorderRadius.circular(
                                  Constants.borderRadiusSmall,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      context.appLoc.view_center,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: textSecondary,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: Constants.spacingExtraSmall,
                                    ),
                                    Icon(
                                      Icons.arrow_outward,
                                      size: Constants.iconSizeExtraSmall,
                                      color: textSecondary,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Constants.paddingMedium,
                      ),
                      child: PhotoHandler(
                        width: double.infinity,
                        imageUrls: [hotEvent.image]
                            .map(
                              (image) => '${EnvConfig.baseApiUrl}${image?.url}',
                            )
                            .toList(),
                      ),
                    ),
                    // // Image
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: Constants.paddingMedium,
                    //   ),
                    //   child: ClipRRect(
                    //     child: CachedNetworkImage(
                    //       imageUrl:
                    //           '${EnvConfig.baseApiUrl}${hotEvent.image?.url}',
                    //       fit: BoxFit.fill,
                    //       errorWidget: (context, url, error) {
                    //         return Image.asset(
                    //           Assets.hiring,
                    //           fit: BoxFit.fill,
                    //           errorBuilder: (context, url, error) =>
                    //               hotEvent.type == 'hot'
                    //               ? Image.asset(Assets.hot, fit: BoxFit.fill)
                    //               : Image.asset(
                    //                   Assets.events,
                    //                   fit: BoxFit.fill,
                    //                 ),
                    //         );
                    //       },
                    //       progressIndicatorBuilder: (context, url, progress) {
                    //         return const Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
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
                            hotEvent.description,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              height: 1.5,
                            ),
                          ),
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
                    GetHotEventDetailRequested(
                      getHotEventDetailParams: GetHotEventDetailParams(
                        query: query,
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
}
