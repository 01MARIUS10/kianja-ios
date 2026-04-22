import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/presentation/pages/job_offer/job_offers_filter_screen.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_category_horizontal_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/category/job_category_vertical_section.dart';

class JobOffersScreen extends StatefulWidget {
  const JobOffersScreen({super.key});

  @override
  State<JobOffersScreen> createState() => _JobOffersScreenState();
}

class _JobOffersScreenState extends State<JobOffersScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedIndex = 0;

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
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorText = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: maxWidth),
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
                        Set<WidgetState> states,
                      ) {
                        return states.contains(WidgetState.focused)
                            ? null
                            : Colors.transparent;
                      }),

                      onTap: (index) {
                        AppDebug.showPrint('Tab index: $index');
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      tabs: [
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.paddingMedium,
                              vertical: Constants.paddingExtraSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Constants.borderRadiusLarge,
                              ),
                              border: _selectedIndex == 0
                                  ? Border.all(
                                      color: isDark
                                          ? AppColors.darkPrimary
                                          : AppColors.lightPrimary,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: isDark
                                          ? AppColors.darkBorder
                                          : AppColors.lightBorder,
                                      width: 2,
                                    ),
                            ),
                            child: Text(
                              'Type',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: colorText,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.paddingMedium,

                              vertical: Constants.paddingExtraSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Constants.borderRadiusLarge,
                              ),
                              border: _selectedIndex == 1
                                  ? Border.all(
                                      color: isDark
                                          ? AppColors.darkPrimary
                                          : AppColors.lightPrimary,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: isDark
                                          ? AppColors.darkBorder
                                          : AppColors.lightBorder,
                                      width: 2,
                                    ),
                            ),
                            child: Text(
                              'Date',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: colorText,
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.paddingMedium,
                              vertical: Constants.paddingExtraSmall,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                Constants.borderRadiusLarge,
                              ),
                              border: _selectedIndex == 2
                                  ? Border.all(
                                      color: isDark
                                          ? AppColors.darkPrimary
                                          : AppColors.lightPrimary,
                                      width: 2,
                                    )
                                  : Border.all(
                                      color: isDark
                                          ? AppColors.darkBorder
                                          : AppColors.lightBorder,
                                      width: 2,
                                    ),
                            ),
                            child: Text(
                              'Zone',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: colorText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: Constants.paddingMedium),
                    Text(
                      'Jobs (160,066,555)',
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: colorText,
                      ),
                    ),
                    const SizedBox(width: Constants.paddingMedium),
                  ],
                ),
              ),
            );
          },
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              JobOffersFilterScreen(
                children: [
                  JobCategoryHorizontalSection(
                    category: 'Entreprise',
                    itemCount: 6,
                  ),
                  JobCategoryHorizontalSection(
                    category: 'Particular',
                    itemCount: 6,
                  ),
                  JobCategoryHorizontalSection(
                    category: 'Public organization',
                    itemCount: 6,
                  ),
                  JobCategoryHorizontalSection(category: 'ONG', itemCount: 6),
                ],
              ),
              JobOffersFilterScreen(
                children: [
                  JobCategoryHorizontalSection(
                    category: 'Recents',
                    itemCount: 6,
                  ),
                  JobCategoryVerticalSection(
                    category: 'Limit date',
                    itemCount: 6,
                  ),
                ],
              ),
              JobOffersFilterScreen(
                children: [
                  JobCategoryHorizontalSection(
                    category: 'Antananarivo',
                    itemCount: 6,
                  ),
                  JobCategoryHorizontalSection(
                    category: 'Toamasina',
                    itemCount: 2,
                  ),
                  JobCategoryHorizontalSection(
                    category: 'Fianarantsoa',
                    itemCount: 1,
                  ),
                  JobCategoryHorizontalSection(
                    category: 'Mahajanga',
                    itemCount: 3,
                  ),
                  JobCategoryHorizontalSection(
                    category: 'Toliara',
                    itemCount: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
