import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_filter.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/domain/usecases/get_job_applicant_zone/get_job_applicant_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/pages/job_applicant/job_applicant_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_applicants_horizontal_section.dart';
import 'package:kianja/routing/routes.dart';

class JobApplicantsScreen extends StatefulWidget {
  const JobApplicantsScreen({super.key});

  @override
  State<JobApplicantsScreen> createState() => _JobApplicantsScreenState();
}

class _JobApplicantsScreenState extends State<JobApplicantsScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  List<JobApplicantZone>? _zoneData;
  String? _zoneError;
  bool _zoneLoading = false;

  List<JobCategory>? _professionData;
  String? _professionError;
  bool _professionLoading = false;

  JobApplicantFilter? _filterData;
  String? _filterError;
  bool _filterLoading = false;

  final List<int> _selectedFilterLocations = [];
  final List<int> _selectedFilterProfessions = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        if (_zoneData == null && _zoneError == null) {
          blocContext.read<JobsBloc>().add(
            const JobsGroupByZoneFetchRequested(query: 'Zone'),
          );
        }
      case 1:
        if (_professionData == null && _professionError == null) {
          blocContext.read<JobsBloc>().add(
            const JobApplicantProfessionsFetchRequested(),
          );
        }
      case 2:
        if (_filterData == null && _filterError == null) {
          blocContext.read<JobsBloc>().add(
            const JobApplicantFiltersFetchRequested(),
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
        ..add(
          const JobApplicantsZoneFetchRequested(
            getJobApplicantParams: GetJobApplicantParams(query: 'Zone'),
          ),
        ),
      child: BlocListener<JobsBloc, JobsState>(
        listener: (context, state) {
          if (state is JobsRequestInProgress) {
            setState(() {
              if (_selectedIndex == 0 && _zoneData == null) {
                _zoneLoading = true;
                _zoneError = null;
              } else if (_selectedIndex == 1 && _professionData == null) {
                _professionLoading = true;
                _professionError = null;
              } else if (_selectedIndex == 2 && _filterData == null) {
                _filterLoading = true;
                _filterError = null;
              }
            });
            return;
          }
          if (state is JobApplicantsZoneFetchSuccess) {
            setState(() {
              _zoneData = state.jobApplicantsZone;
              _zoneLoading = false;
              _zoneError = null;
            });
          } else if (state is JobApplicantProfessionsFetchSuccess) {
            setState(() {
              _professionData = state.jobCategories;
              _professionLoading = false;
              _professionError = null;
            });
          } else if (state is JobApplicantFiltersFetchSuccess) {
            setState(() {
              _filterData = state.jobApplicantFilter;
              _filterLoading = false;
              _filterError = null;
            });
          } else if (state is JobsRequestFailure) {
            setState(() {
              if (_selectedIndex == 0 && _zoneData == null) {
                _zoneLoading = false;
                _zoneError = state.message;
              } else if (_selectedIndex == 1 && _professionData == null) {
                _professionLoading = false;
                _professionError = state.message;
              } else if (_selectedIndex == 2 && _filterData == null) {
                _filterLoading = false;
                _filterError = state.message;
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
                                  label: 'Zone',
                                  index: 0,
                                  selected: _selectedIndex,
                                  theme: theme,
                                  colorText: colorText,
                                  isDark: isDark,
                                ),
                                _buildFilterTab(
                                  label: 'Profession',
                                  index: 1,
                                  selected: _selectedIndex,
                                  theme: theme,
                                  colorText: colorText,
                                  isDark: isDark,
                                ),
                                _buildFilterTab(
                                  label: 'Filter',
                                  index: 2,
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
                        isLoading: _zoneLoading,
                        data: _zoneData,
                        error: _zoneError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const JobApplicantsZoneFetchRequested(
                              getJobApplicantParams: GetJobApplicantParams(
                                query: 'Zone',
                              ),
                            ),
                          );
                        },
                        builder: (filters) => JobApplicantFilterScreen(
                          onRefresh: () async {
                            setState(() {
                              _zoneLoading = true;
                              _zoneData = null;
                              _zoneError = null;
                            });
                            blocContext.read<JobsBloc>().add(
                              const JobApplicantsZoneFetchRequested(
                                getJobApplicantParams: GetJobApplicantParams(
                                  query: 'Zone',
                                ),
                              ),
                            );
                          },
                          children: filters
                              .map(
                                (f) => JobApplicantsHorizontalSection(
                                  category: f.name,
                                  query: f.query,
                                  jobApplicants: f.jobApplicants,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      // Tab 1 — Profession
                      _buildProfessionContent(
                        blocContext: blocContext,
                        isLoading: _professionLoading,
                        data: _professionData,
                        error: _professionError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const JobApplicantProfessionsFetchRequested(),
                          );
                        },
                      ),
                      // Tab 2 — Filter
                      _buildFilterContent(
                        blocContext: blocContext,
                        isLoading: _filterLoading,
                        data: _filterData,
                        error: _filterError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const JobApplicantFiltersFetchRequested(),
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
    required bool isLoading,
    required List<JobApplicantZone>? data,
    required String? error,
    required VoidCallback onRetry,
    required Widget Function(List<JobApplicantZone> zones) builder,
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
      return builder(data);
    }
    // Initial state before anything is dispatched — show spinner
    return const Center(child: CircularProgressIndicator());
  }

  /// Renders the profession tab content (Job Categories).
  Widget _buildProfessionContent({
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

      return JobApplicantFilterScreen(
        onRefresh: () async {
          setState(() {
            _professionLoading = true;
            _professionData = null;
            _professionError = null;
          });
          blocContext.read<JobsBloc>().add(
            const JobApplicantProfessionsFetchRequested(),
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

  /// Renders the filter tab content.
  Widget _buildFilterContent({
    required BuildContext blocContext,
    required bool isLoading,
    required JobApplicantFilter? data,
    required String? error,
    required VoidCallback onRetry,
  }) {
    final isDark = Theme.of(blocContext).brightness == Brightness.dark;
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

      return JobApplicantFilterScreen(
        onRefresh: () async {
          setState(() {
            _filterLoading = true;
            _filterData = null;
            _filterError = null;
          });
          blocContext.read<JobsBloc>().add(
            const JobApplicantFiltersFetchRequested(),
          );
        },
        children: [
          Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Zone',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: Constants.spacingSmall),
                Wrap(
                  spacing: Constants.spacingMedium,
                  children: data.locations.map((location) {
                    final isSelected = _selectedFilterLocations.contains(
                      location.id,
                    );
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedFilterLocations.remove(location.id);
                          } else {
                            _selectedFilterLocations.add(location.id);
                          }
                        });
                      },
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedFilterLocations.add(location.id);
                                    } else {
                                      _selectedFilterLocations.remove(
                                        location.id,
                                      );
                                    }
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: Constants.spacingExtraSmall),
                            Text(
                              location.name,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: Constants.spacingMedium),
                Text(
                  'Profession',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: Constants.spacingSmall),
                Wrap(
                  spacing: Constants.spacingMedium,
                  children: data.categories.map((category) {
                    final isSelected = _selectedFilterProfessions.contains(
                      category.id,
                    );
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedFilterProfessions.remove(category.id);
                          } else {
                            _selectedFilterProfessions.add(category.id);
                          }
                        });
                      },
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: isSelected,
                                onChanged: (value) {
                                  setState(() {
                                    if (value == true) {
                                      _selectedFilterProfessions.add(
                                        category.id,
                                      );
                                    } else {
                                      _selectedFilterProfessions.remove(
                                        category.id,
                                      );
                                    }
                                  });
                                },
                              ),
                            ),
                            const SizedBox(width: Constants.spacingExtraSmall),
                            Text(
                              category.name,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: Constants.spacingMedium),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        isDark ? AppColors.darkSurface : AppColors.lightSurface,
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Constants.borderRadiusMedium,
                          ),
                          side: BorderSide(
                            color: isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      String query = '';
                      if (_selectedFilterLocations.isNotEmpty) {
                        query +=
                            'location_id=${_selectedFilterLocations.join(',')}';
                      }
                      if (_selectedFilterProfessions.isNotEmpty) {
                        if (_selectedFilterLocations.isEmpty) {
                          query +=
                              'category_id=${_selectedFilterProfessions.join(',')}';
                        } else {
                          query +=
                              '&category_id=${_selectedFilterProfessions.join(',')}';
                        }
                      }
                      if (_selectedFilterLocations.isNotEmpty ||
                          _selectedFilterProfessions.isNotEmpty) {
                        context.goNamed(
                          Routes.jobApplicantViewAll.name,
                          extra: {'title': 'Filter', 'query': query},
                        );
                      }
                    },
                    child: Text(
                      'Apply',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: Constants.spacingSmall),
              ],
            ),
          ),
        ],
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
