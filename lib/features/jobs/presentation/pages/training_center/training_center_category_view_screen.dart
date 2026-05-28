import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/training/enum/training_center_badge.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_view_category_usecase.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/training_center_vip_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/item/training_center_item_list.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterCategoryViewScreen extends StatelessWidget {
  const TrainingCenterCategoryViewScreen({
    super.key,
    required this.category,
    required this.id,
  });

  /// The display title for the category (e.g. "Auto-école").
  final String category;

  /// The category ID used to fetch VIP / Premium / Normal splits.
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(
          GetTrainingCenterViewCategoryRequested(
            params: GetTrainingCenterViewCategoryParams(id: id),
          ),
        ),
      child: BaseScreen(
        appBar: TitleHeader(title: category),
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, state) {
            if (state is GetTrainingCenterViewCategorySuccess) {
              return _CategoryContent(
                id: id,
                category: category,
                vip: state.trainingCenterViewCategory.vip,
                premium: state.trainingCenterViewCategory.premium,
                normal: state.trainingCenterViewCategory.normal,
              );
            } else if (state is JobsRequestFailure) {
              return ServerFailureScreen(
                onRetry: () {
                  BlocProvider.of<JobsBloc>(context).add(
                    GetTrainingCenterViewCategoryRequested(
                      params: GetTrainingCenterViewCategoryParams(id: id),
                    ),
                  );
                },
                message: state.message,
              );
            }
            // Loading
            return const _LoadingShimmer();
          },
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Content
// ─────────────────────────────────────────────

class _CategoryContent extends StatelessWidget {
  const _CategoryContent({
    required this.id,
    required this.category,
    required this.vip,
    required this.premium,
    required this.normal,
  });

  final int id;
  final String category;
  final List<TrainingCenter> vip;
  final List<TrainingCenter> premium;
  final List<TrainingCenter> normal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final borderColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return RefreshIndicator.adaptive(
      displacement: 10,
      onRefresh: () async {
        BlocProvider.of<JobsBloc>(context).add(
          GetTrainingCenterViewCategoryRequested(
            params: GetTrainingCenterViewCategoryParams(id: id),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: Constants.spacingMedium),
          if (vip.isNotEmpty) ...[
            TrainingCenterVipSection(vipCenters: vip),
            Divider(
              color: borderColor,
              thickness: 1,
              height: 1,
              indent: Constants.paddingMedium,
              endIndent: Constants.paddingMedium,
            ),
            const SizedBox(height: Constants.spacingExtraSmall),
          ],
          Expanded(
            child: ListView.separated(
              itemCount: premium.length + normal.length,
              itemBuilder: (context, index) {
                if (index < premium.length) {
                  return TrainingCenterItemList(
                    trainingCenter: premium[index],
                    badge: premium[index].badge ?? TrainingCenterBadge.normal,
                    onTap: () => context.pushNamed(
                      Routes.trainingCenterDetail.name,
                      pathParameters: {
                        'trainingCenterId': premium[index].id.toString(),
                      },
                    ),
                  );
                }
                return TrainingCenterItemList(
                  trainingCenter: normal[index - premium.length],
                  onTap: () => context.pushNamed(
                    Routes.trainingCenterDetail.name,
                    pathParameters: {
                      'trainingCenterId': normal[index - premium.length].id
                          .toString(),
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                color: borderColor,
                thickness: 1,
                height: 1,
                indent: Constants.paddingMedium,
                endIndent: Constants.paddingMedium,
              ),
            ),
          ),
          // if (premium.isNotEmpty) ...[
          //   ...premium.asMap().entries.map((entry) {
          //     final index = entry.key;
          //     final center = entry.value;
          //     return Column(
          //       children: [
          //         TrainingCenterItemList(
          //           trainingCenter: center,
          //           badge: center.badge ?? TrainingCenterBadge.normal,
          //           onTap: () => context.pushNamed(
          //             Routes.trainingCenterDetail.name,
          //             pathParameters: {'id': center.id.toString()},
          //           ),
          //         ),
          //         if (index < premium.take(3).length - 1)
          //           Padding(
          //             padding: const EdgeInsets.symmetric(
          //               horizontal: Constants.paddingMedium,
          //             ),
          //             child: Divider(color: borderColor, height: 1),
          //           ),
          //       ],
          //     );
          //   }),
          // ],
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: Constants.paddingMedium,
          //   ),
          //   child: Divider(color: borderColor, height: 1),
          // ),
          // if (normal.isNotEmpty) ...[
          //   ...normal.asMap().entries.map((entry) {
          //     final index = entry.key;
          //     final center = entry.value;
          //     return Column(
          //       children: [
          //         TrainingCenterItemList(
          //           trainingCenter: center,
          //           onTap: () => context.pushNamed(
          //             Routes.trainingCenterDetail.name,
          //             pathParameters: {'id': center.id.toString()},
          //           ),
          //         ),
          //         if (index < normal.length - 1)
          //           Padding(
          //             padding: const EdgeInsets.symmetric(
          //               horizontal: Constants.paddingMedium,
          //             ),
          //             child: Divider(color: borderColor, height: 1),
          //           ),
          //       ],
          //     );
          //   }),
          // ],

          // Empty state
          if (vip.isEmpty && premium.isEmpty && normal.isEmpty)
            _EmptyState(theme: theme),

          const SizedBox(height: Constants.spacingLarge),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Empty state
// ─────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.theme});
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final isDark = Brightness.dark == Theme.of(context).brightness;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Constants.paddingLarge),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.school_outlined,
              size: Constants.iconSizeLarge,
              color: isDark
                  ? AppColors.darkTextMuted
                  : AppColors.lightTextSecondary,
            ),
            const SizedBox(height: Constants.spacingSmall),
            Text(
              'Aucun centre de formation disponible',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Loading shimmer placeholder
// ─────────────────────────────────────────────

class _LoadingShimmer extends StatelessWidget {
  const _LoadingShimmer();

  @override
  Widget build(BuildContext context) {
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final baseColor = isDark ? AppColors.darkBorder : AppColors.lightBorder;
    final highlightColor = isDark
        ? AppColors.darkSurface
        : AppColors.lightSurface;

    Widget shimmerBox({double width = double.infinity, double height = 14}) {
      return _AnimatedShimmer(
        width: width,
        height: height,
        baseColor: baseColor,
        highlightColor: highlightColor,
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(Constants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // VIP section placeholder
          shimmerBox(width: 60, height: 12),
          const SizedBox(height: Constants.spacingSmall),
          Row(
            children: List.generate(
              2,
              (i) => Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: i == 0 ? Constants.spacingSmall : 0,
                  ),
                  child: shimmerBox(height: 140),
                ),
              ),
            ),
          ),
          const SizedBox(height: Constants.spacingMedium),

          // List items placeholders
          ...List.generate(5, (i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: Constants.spacingMedium),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shimmerBox(width: 110, height: 75),
                  const SizedBox(width: Constants.spacingSmall),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        shimmerBox(height: 14),
                        const SizedBox(height: 6),
                        shimmerBox(width: 100, height: 12),
                        const SizedBox(height: 6),
                        shimmerBox(width: 140, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _AnimatedShimmer extends StatefulWidget {
  const _AnimatedShimmer({
    required this.width,
    required this.height,
    required this.baseColor,
    required this.highlightColor,
  });

  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;

  @override
  State<_AnimatedShimmer> createState() => _AnimatedShimmerState();
}

class _AnimatedShimmerState extends State<_AnimatedShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: Color.lerp(
              widget.baseColor,
              widget.highlightColor,
              _animation.value,
            ),
            borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
          ),
        );
      },
    );
  }
}
