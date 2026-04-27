import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer_filter.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/pages/job_offer/job_offers_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_category_horizontal_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_category_vertical_section.dart';

class JobOffersScreen extends StatefulWidget {
  const JobOffersScreen({super.key});

  @override
  State<JobOffersScreen> createState() => _JobOffersScreenState();
}

class _JobOffersScreenState extends State<JobOffersScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

  // ── Local cache so each tab keeps its data once loaded ──────────────────
  List<JobOfferFilter>? _typeData;
  List<JobOfferFilter>? _dateData;
  List<JobOfferFilter>? _zoneData;

  String? _typeError;
  String? _dateError;
  String? _zoneError;

  // Track which tabs are currently loading
  bool _typeLoading = false;
  bool _dateLoading = false;
  bool _zoneLoading = false;

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
        // Only fetch if not already cached
        if (_typeData == null && _typeError == null) {
          blocContext.read<JobsBloc>().add(
            const JobsGroupByTypeFetchRequested(query: 'Type'),
          );
        }
      case 1:
        if (_dateData == null && _dateError == null) {
          blocContext.read<JobsBloc>().add(
            const JobsGroupByDateFetchRequested(query: 'Date'),
          );
        }
      case 2:
        if (_zoneData == null && _zoneError == null) {
          blocContext.read<JobsBloc>().add(
            const JobsGroupByZoneFetchRequested(query: 'Zone'),
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
      create: (context) =>
          GetIt.instance<JobsBloc>()
            ..add(const JobsGroupByTypeFetchRequested(query: 'Type')),
      child: BlocListener<JobsBloc, JobsState>(
        listener: (context, state) {
          if (state is JobsRequestInProgress) {
            // Mark the current tab as loading
            setState(() {
              if (_selectedIndex == 0) {
                _typeLoading = true;
                _typeError = null;
              } else if (_selectedIndex == 1) {
                _dateLoading = true;
                _dateError = null;
              } else if (_selectedIndex == 2) {
                _zoneLoading = true;
                _zoneError = null;
              }
            });
            return;
          }
          if (state is JobsGroupByTypeFetchSuccess) {
            setState(() {
              _typeData = state.jobOffersType;
              _typeLoading = false;
              _typeError = null;
            });
          } else if (state is JobsGroupByDateFetchSuccess) {
            setState(() {
              _dateData = state.jobOffersDate;
              _dateLoading = false;
              _dateError = null;
            });
          } else if (state is JobsGroupByZoneFetchSuccess) {
            setState(() {
              _zoneData = state.jobOffersZone;
              _zoneLoading = false;
              _zoneError = null;
            });
          } else if (state is JobsRequestFailure) {
            setState(() {
              if (_selectedIndex == 0) {
                _typeLoading = false;
                _typeError = state.message;
              } else if (_selectedIndex == 1) {
                _dateLoading = false;
                _dateError = state.message;
              } else if (_selectedIndex == 2) {
                _zoneLoading = false;
                _zoneError = state.message;
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
                                  label: 'Type',
                                  index: 0,
                                  selected: _selectedIndex,
                                  theme: theme,
                                  colorText: colorText,
                                  isDark: isDark,
                                ),
                                _buildFilterTab(
                                  label: 'Date',
                                  index: 1,
                                  selected: _selectedIndex,
                                  theme: theme,
                                  colorText: colorText,
                                  isDark: isDark,
                                ),
                                _buildFilterTab(
                                  label: 'Zone',
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
                      // Tab 0 — Type
                      _buildTabContent(
                        isLoading: _typeLoading,
                        data: _typeData,
                        error: _typeError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const JobsGroupByTypeFetchRequested(query: 'Type'),
                          );
                        },
                        builder: (filters) => JobOffersFilterScreen(
                          onRefresh: () async {
                            setState(() {
                              _typeLoading = true;
                              _typeData = null;
                              _typeError = null;
                            });
                            blocContext.read<JobsBloc>().add(
                              const JobsGroupByTypeFetchRequested(
                                query: 'Type',
                              ),
                            );
                          },
                          children: filters
                              .map(
                                (f) => JobCategoryHorizontalSection(
                                  category: f.name,
                                  query: f.query,
                                  jobOfferList: f.jobOffers,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      // Tab 1 — Date
                      _buildTabContent(
                        isLoading: _dateLoading,
                        data: _dateData,
                        error: _dateError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const JobsGroupByDateFetchRequested(query: 'Date'),
                          );
                        },
                        builder: (filters) => JobOffersFilterScreen(
                          onRefresh: () async {
                            setState(() {
                              _dateLoading = true;
                              _dateData = null;
                              _dateError = null;
                            });
                            blocContext.read<JobsBloc>().add(
                              const JobsGroupByDateFetchRequested(
                                query: 'Date',
                              ),
                            );
                          },
                          children: [
                            if (filters.isNotEmpty)
                              JobCategoryHorizontalSection(
                                category: filters[0].name,
                                query: filters[0].query,
                                jobOfferList: filters[0].jobOffers,
                              ),
                            if (filters.length > 1)
                              JobCategoryVerticalSection(
                                category: filters[1].name,
                                query: filters[1].query,
                                jobOfferList: filters[1].jobOffers,
                              ),
                          ],
                        ),
                      ),
                      // Tab 2 — Zone
                      _buildTabContent(
                        isLoading: _zoneLoading,
                        data: _zoneData,
                        error: _zoneError,
                        onRetry: () {
                          blocContext.read<JobsBloc>().add(
                            const JobsGroupByZoneFetchRequested(query: 'Zone'),
                          );
                        },
                        builder: (filters) => JobOffersFilterScreen(
                          onRefresh: () async {
                            setState(() {
                              _zoneLoading = true;
                              _zoneData = null;
                              _zoneError = null;
                            });
                            blocContext.read<JobsBloc>().add(
                              const JobsGroupByZoneFetchRequested(
                                query: 'Zone',
                              ),
                            );
                          },
                          children: filters
                              .map(
                                (f) => JobCategoryHorizontalSection(
                                  category: f.name,
                                  query: f.query,
                                  jobOfferList: f.jobOffers,
                                ),
                              )
                              .toList(),
                        ),
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
    required List<JobOfferFilter>? data,
    required String? error,
    required VoidCallback onRetry,
    required Widget Function(List<JobOfferFilter> filters) builder,
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
