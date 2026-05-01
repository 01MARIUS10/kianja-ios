import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/error_screen/no_connection_screen.dart';
import 'package:kianja/core/shared/widgets/error_screen/server_failure_screen.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_zone.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/pages/job_applicant/job_applicant_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_applicants_horizontal_section.dart';

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
            ..add(const JobApplicantsZoneFetchRequested()),
      child: BlocListener<JobsBloc, JobsState>(
        listener: (context, state) {
          if (state is JobsRequestInProgress) {
            setState(() {
              if (_selectedIndex == 0) {
                _zoneLoading = true;
                _zoneError = null;
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
          } else if (state is JobsRequestFailure) {
            setState(() {
              if (_selectedIndex == 0) {
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
                              onTap: (index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
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
                            const JobApplicantsZoneFetchRequested(),
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
                              const JobApplicantsZoneFetchRequested(),
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
                      const JobApplicantFilterScreen(
                        children: [Center(child: Text('Profession'))],
                      ),
                      const JobApplicantFilterScreen(
                        children: [Center(child: Text('Filter'))],
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
