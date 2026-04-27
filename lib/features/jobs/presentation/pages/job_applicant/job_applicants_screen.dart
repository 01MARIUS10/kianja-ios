import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/pages/job_applicant/job_applicant_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_template_horizontal_section.dart';

class JobApplicantsScreen extends StatefulWidget {
  const JobApplicantsScreen({super.key});

  @override
  State<JobApplicantsScreen> createState() => _JobApplicantsScreenState();
}

class _JobApplicantsScreenState extends State<JobApplicantsScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Filter tab bar ───────────────────────────────────────
        LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
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
                      overlayColor: WidgetStateProperty.resolveWith<Color?>((
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
            children: const [
              JobApplicantFilterScreen(
                children: [
                  JobTemplateHorizontalSection(
                    category: 'Antananarivo',
                    itemCount: 5,
                  ),
                  JobTemplateHorizontalSection(
                    category: 'Fianarantsoa',
                    itemCount: 5,
                  ),
                  JobTemplateHorizontalSection(
                    category: 'Toliara',
                    itemCount: 5,
                  ),
                ],
              ),
              JobApplicantFilterScreen(
                children: [Center(child: Text('Profession'))],
              ),
              JobApplicantFilterScreen(
                children: [Center(child: Text('Filter'))],
              ),
            ],
          ),
        ),
      ],
    );
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
