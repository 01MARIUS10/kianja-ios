import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';

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
              final hotType = hotEvent.type == 'hot';
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
                          const SizedBox(height: Constants.spacingSmall),
                          Row(
                            children: [
                              Text(
                                hotType ? 'Hot date  ' : 'Event date  ',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: hotType
                                      ? AppColors.warning
                                      : AppColors.success,
                                ),
                              ),
                              Icon(
                                hotType
                                    ? Icons.offline_bolt_outlined
                                    : Icons.event_outlined,
                                size: Constants.iconSizeExtraSmall,
                                color: hotType
                                    ? AppColors.warning
                                    : AppColors.success,
                              ),
                              const SizedBox(
                                width: Constants.spacingExtraSmall,
                              ),
                              Text(
                                '${hotEvent.startDate} to ${hotEvent.endDate}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: hotType
                                      ? AppColors.warning
                                      : AppColors.success,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Constants.spacingExtraSmall),
                          Text(
                            'Posted • 1h',
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
                      child: ClipRRect(
                        child: hotType
                            ? Image.asset(Assets.hot, fit: BoxFit.cover)
                            : Image.asset(Assets.events, fit: BoxFit.cover),
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
                            'Description',
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
