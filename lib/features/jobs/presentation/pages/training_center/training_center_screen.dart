import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_filter.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center_hot_event.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/pages/training_center/training_center_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/training_center_horizontal_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/training_center_vertical_section.dart';
import 'package:kianja/routing/routes.dart';

class TrainingCenterScreen extends StatefulWidget {
  const TrainingCenterScreen({super.key});

  @override
  State<TrainingCenterScreen> createState() => _TrainingCenterScreenState();
}

class _TrainingCenterScreenState extends State<TrainingCenterScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  List<TrainingCenterHotEvent>? _hotEventData;
  String? _hotEventError;
  bool _hotEventLoading = false;

  TrainingCenterFilter? _recentData;
  String? _recentError;
  bool _recentLoading = false;

  List<JobCategory>? _categoryData;
  String? _categoryError;
  bool _categoryLoading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onTabTap(BuildContext blocContext, int index) {
    AppDebug.showPrint('Tab tapped: $index');
    setState(() => _selectedIndex = index);

    switch (index) {
      case 0:
        if (_hotEventData == null && _hotEventError == null) {
          blocContext.read<JobsBloc>().add(
            const GetTrainingCenterHotEventRequested(),
          );
        }
        if (_recentData == null && _recentError == null) {
          blocContext.read<JobsBloc>().add(
            const GetTrainingCenterFilterRequested(),
          );
        }
      case 1:
        if (_categoryData == null && _categoryError == null) {
          blocContext.read<JobsBloc>().add(
            const GetTrainingCenterCategoriesRequested(),
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorText = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(const GetTrainingCenterHotEventRequested())
        ..add(const GetTrainingCenterFilterRequested()),
      child: BlocListener<JobsBloc, JobsState>(
        listener: (context, state) {
          if (state is JobsRequestInProgress) {
            setState(() {
              if (_selectedIndex == 0) {
                if (_hotEventData == null) {
                  _hotEventLoading = true;
                  _hotEventError = null;
                } else if (_recentData == null) {
                  _recentLoading = true;
                  _recentError = null;
                }
              } else if (_selectedIndex == 1 && _categoryData == null) {
                _categoryLoading = true;
                _categoryError = null;
              }
            });
            return;
          }
          if (state is GetTrainingCenterHotEventSuccess) {
            setState(() {
              _hotEventData = state.trainingCenterHotEvents;
              _hotEventLoading = false;
              _hotEventError = null;
            });
          } else if (state is GetTrainingCenterFilterSuccess) {
            setState(() {
              _recentData = state.trainingCenterFilter;
              _recentLoading = false;
              _recentError = null;
            });
          } else if (state is GetTrainingCenterCategoriesSuccess) {
            setState(() {
              _categoryData = state.trainingCenterCategories;
              _categoryLoading = false;
              _categoryError = null;
            });
          } else if (state is JobsRequestFailure) {
            setState(() {
              if (_selectedIndex == 0) {
                if (_hotEventData == null) {
                  _hotEventLoading = false;
                  _hotEventError = state.message;
                } else if (_recentData == null) {
                  _recentLoading = false;
                  _recentError = state.message;
                }
              } else if (_selectedIndex == 1 && _categoryData == null) {
                _categoryLoading = false;
                _categoryError = state.message;
              }
            });
            // AppMessenger.showError(context, state.message);
          }
        },
        child: Builder(
          builder: (blocContext) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Filter tab bar ───────────────────────────────────────
                LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                        ),
                        child: Row(
                          children: [
                            TabBar.secondary(
                              controller: _tabController,
                              labelPadding: const EdgeInsets.fromLTRB(
                                Constants.paddingMedium,
                                Constants.paddingExtraSmall,
                                Constants.spacingZero,
                                Constants.paddingExtraSmall,
                              ),
                              indicatorColor: Colors.transparent,
                              dividerColor: Colors.transparent,
                              dividerHeight: 0.0,
                              splashFactory: NoSplash.splashFactory,
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              overlayColor:
                                  WidgetStateProperty.resolveWith<Color?>((
                                    states,
                                  ) {
                                    return states.contains(WidgetState.focused)
                                        ? null
                                        : Colors.transparent;
                                  }),
                              onTap: (index) => _onTabTap(blocContext, index),
                              tabs: [
                                _buildFilterTab(
                                  label: 'Actualites',
                                  index: 0,
                                  selected: _selectedIndex,
                                  theme: theme,
                                  colorText: colorText,
                                  isDark: isDark,
                                ),
                                _buildFilterTab(
                                  label: 'Categories',
                                  index: 1,
                                  selected: _selectedIndex,
                                  theme: theme,
                                  colorText: colorText,
                                  isDark: isDark,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                // ── Tab content (renders from local cache) ───────────────
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // Tab 0 — Zone
                      _buildTabContent(
                        isHotEventsLoading: _hotEventLoading,
                        isRecentLoading: _recentLoading,
                        hotEventData: _hotEventData,
                        trainingCenterFilterData: _recentData,
                        hotEventsError: _hotEventError,
                        recentError: _recentError,
                        onRetry: () {
                          blocContext.read<JobsBloc>()
                            ..add(const GetTrainingCenterHotEventRequested())
                            ..add(const GetTrainingCenterFilterRequested());
                        },
                        builder: (hotEvents, trainingCenterFilter) =>
                            TrainingCenterFilterScreen(
                              onRefresh: () async {
                                setState(() {
                                  _hotEventLoading = true;
                                  _hotEventData = null;
                                  _hotEventError = null;
                                  _recentLoading = true;
                                  _recentData = null;
                                  _recentError = null;
                                });
                                blocContext.read<JobsBloc>()
                                  ..add(
                                    const GetTrainingCenterFilterRequested(),
                                  )
                                  ..add(
                                    const GetTrainingCenterHotEventRequested(),
                                  );
                              },
                              children: [
                                ...hotEvents.map(
                                  (e) => TrainingCenterHorizontalSection(
                                    category: e.name,
                                    query: e.query,
                                    hotEvents: e.hotEvents,
                                  ),
                                ),
                                TrainingCenterVerticalSection(
                                  category: trainingCenterFilter.name,
                                  query: trainingCenterFilter.query,
                                  trainingCenters:
                                      trainingCenterFilter.trainingCenters,
                                ),
                              ],
                            ),
                      ),
                      // Tab 1 — Profession
                      _buildCategoryContent(
                        blocContext: blocContext,
                        isLoading: _categoryLoading,
                        data: _categoryData,
                        error: _categoryError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const GetTrainingCenterCategoriesRequested(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  /// Renders a loading spinner, an error screen, the cached [data], or an empty box.
  Widget _buildTabContent({
    required bool isHotEventsLoading,
    required bool isRecentLoading,
    required List<TrainingCenterHotEvent>? hotEventData,
    required TrainingCenterFilter? trainingCenterFilterData,
    required String? hotEventsError,
    required String? recentError,
    required VoidCallback onRetry,
    required Widget Function(
      List<TrainingCenterHotEvent> hotEvents,
      TrainingCenterFilter trainingCenterFilter,
    )
    builder,
  }) {
    if (isHotEventsLoading && hotEventData == null) {
      return const Center(child: CircularProgressIndicator());
    } else if (isRecentLoading && trainingCenterFilterData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (hotEventsError != null && hotEventData == null) {
      final message = hotEventsError.toLowerCase();
      if (message.contains('connection') ||
          message.contains('network') ||
          message.contains('socket')) {
        return NoConnectionScreen(onRetry: onRetry);
      }
      return ServerFailureScreen(onRetry: onRetry, message: hotEventsError);
    }
    if (recentError != null && trainingCenterFilterData == null) {
      final message = recentError.toLowerCase();
      if (message.contains('connection') ||
          message.contains('network') ||
          message.contains('socket')) {
        return NoConnectionScreen(onRetry: onRetry);
      }
      return ServerFailureScreen(onRetry: onRetry, message: recentError);
    }

    if (hotEventData != null && trainingCenterFilterData != null) {
      return builder(hotEventData, trainingCenterFilterData);
    }
    // Initial state before anything is dispatched — show spinner
    return const Center(child: CircularProgressIndicator());
  }

  /// Renders the profession tab content (Job Categories).
  Widget _buildCategoryContent({
    required BuildContext blocContext,
    required bool isLoading,
    required List<JobCategory>? data,
    required String? error,
    required VoidCallback onRetry,
  }) {
    if (isLoading && data == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (error != null && data == null) {
      final message = error.toLowerCase();
      if (message.contains('connection') ||
          message.contains('network') ||
          message.contains('socket')) {
        return NoConnectionScreen(onRetry: onRetry);
      }
      return ServerFailureScreen(onRetry: onRetry, message: error);
    }
    if (data != null) {
      final theme = Theme.of(context);
      final isDark = theme.brightness == Brightness.dark;
      final colorText = isDark
          ? AppColors.darkTextPrimary
          : AppColors.lightTextPrimary;

      return TrainingCenterFilterScreen(
        onRefresh: () async {
          setState(() {
            _categoryLoading = true;
            _categoryData = null;
            _categoryError = null;
          });
          blocContext.read<JobsBloc>().add(
            const GetTrainingCenterCategoriesRequested(),
          );
        },
        children: data.map((category) {
          Widget iconWidget;
          if (category.iconUrl.isEmpty) {
            iconWidget = Icon(Icons.work_outline, color: colorText);
          } else {
            iconWidget = CachedNetworkImage(
              imageUrl: category.iconUrl,
              width: 24,
              height: 24,
              errorWidget: (context, url, error) =>
                  Icon(Icons.work_outline, color: colorText),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingMedium,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: iconWidget,
              title: Text(category.name, style: theme.textTheme.titleSmall),
              trailing: Icon(
                Icons.chevron_right,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
              onTap: () {
                context.goNamed(
                  Routes.jobApplicantViewAll.name,
                  extra: {
                    'title': category.name,
                    'query': 'category_id=${category.id}',
                  },
                );
              },
            ),
          );
        }).toList(),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }

  /// Reusable pill-style filter tab.
  Tab _buildFilterTab({
    required String label,
    required int index,
    required int selected,
    required ThemeData theme,
    required Color colorText,
    required bool isDark,
  }) {
    final isSelected = selected == index;
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.paddingMedium,
          vertical: Constants.paddingExtraSmall,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.borderRadiusLarge),
          border: Border.all(
            color: isSelected
                ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                : (isDark ? AppColors.darkBorder : AppColors.lightBorder),
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(color: colorText),
        ),
      ),
    );
  }
}
