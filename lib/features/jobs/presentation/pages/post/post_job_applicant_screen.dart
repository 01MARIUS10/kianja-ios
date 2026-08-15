import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_features_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_pdf_upload_widget.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/routing/routes.dart';

class PostJobApplicantScreen extends StatefulWidget {
  const PostJobApplicantScreen({super.key});

  @override
  State<PostJobApplicantScreen> createState() => _PostJobApplicantScreenState();
}

class _PostJobApplicantScreenState extends State<PostJobApplicantScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motivationController = TextEditingController();

  // ── Entity-ID selections (mirrors PostJobOfferScreen) ──────────────────
  final List<int> _selectedCategories = [];
  final List<int> _selectedLocations = [];
  // int? _selectedCategory; // single select for job applicant
  // int? _selectedLocation;
  int? _selectedGender;

  // ── Features fetched from bloc ─────────────────────────────────────────
  JobFeatures? _jobFeatures;
  List<PricePlan> _plans = [];

  // ── Selected plan fed back from PostFeaturesSection ────────────────────
  PricePlan? _selectedPlan;

  // ── Upload results ─────────────────────────────────────────────────────
  String? _uploadImageUrl;
  String? _uploadPdfUrl;

  // ── Toggles ───────────────────────────────────────────────────────────
  void _toggleCategories(int categoryId) {
    setState(() {
      if (_selectedCategories.contains(categoryId)) {
        _selectedCategories.remove(categoryId);
      } else {
        if (_selectedCategories.length < 3) {
          _selectedCategories.add(categoryId);
        }
      }
    });
  }

  void _toggleLocations(int locationId) {
    setState(() {
      if (_selectedLocations.contains(locationId)) {
        _selectedLocations.remove(locationId);
      } else {
        if (_selectedLocations.length < 3) {
          _selectedLocations.add(locationId);
        }
      }
    });
  }

  // void _toggleCategory(int categoryId) {
  //   setState(() {
  //     _selectedCategory = _selectedCategory == categoryId ? null : categoryId;
  //   });
  // }

  // void _toggleLocation(int locationId) {
  //   setState(() {
  //     _selectedLocation = _selectedLocation == locationId ? null : locationId;
  //   });
  // }

  void _toggleGender(int genderId) {
    setState(() {
      _selectedGender = _selectedGender == genderId ? null : genderId;
    });
  }

  // ── Clear ─────────────────────────────────────────────────────────────

  void _clearValues() {
    _titleController.clear();
    _motivationController.clear();
    setState(() {
      _selectedCategories.clear();
      _selectedLocations.clear();
      // _selectedCategory = null;
      // _selectedLocation = null;
      _selectedGender = null;
      _selectedPlan = null;
      _uploadImageUrl = null;
      _uploadPdfUrl = null;
    });
  }

  // ── Submit ────────────────────────────────────────────────────────────

  void _postJobApplicant(BuildContext context) {
    // if (_titleController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please add a job title');
    //   return;
    // }
    // if (_motivationController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please add a motivation');
    //   return;
    // }
    // if (_selectedCategories.isEmpty) {
    //   AppMessenger.showWarning(context, 'Please select a category');
    //   return;
    // }
    // if (_selectedLocations.isEmpty) {
    //   AppMessenger.showWarning(context, 'Please select a location');
    //   return;
    // }
    // // if (_selectedCategory == null) {
    // //   AppMessenger.showWarning(context, 'Please select a category');
    // //   return;
    // // }
    // // if (_selectedLocation == null) {
    // //   AppMessenger.showWarning(context, 'Please select a location');
    // //   return;
    // // }
    // if (_selectedGender == null) {
    //   AppMessenger.showWarning(context, 'Please select a gender');
    //   return;
    // }
    // if (_selectedPlan == null) {
    //   AppMessenger.showWarning(context, 'Please select a plan');
    //   return;
    // }
    if (_titleController.text.trim().isEmpty ||
        _motivationController.text.trim().isEmpty ||
        _selectedCategories.isEmpty ||
        _selectedLocations.isEmpty ||
        _selectedGender == null ||
        _selectedPlan == null) {
      AppMessenger.showWarning(
        context,
        context.appLoc.please_fill_all_required_fields,
      );
    }

    AppDebug.showPrint('title: ${_titleController.text.trim()}');
    AppDebug.showPrint('motivation: ${_motivationController.text.trim()}');
    // AppDebug.showPrint('categoryId: $_selectedCategory');
    // AppDebug.showPrint('locationId: $_selectedLocation');
    AppDebug.showPrint('genderId: $_selectedGender');
    AppDebug.showPrint('typeId: ${_selectedPlan!.type.id}');
    AppDebug.showPrint('durationId: ${_selectedPlan!.duration.id}');
    AppDebug.showPrint('imageUrl: $_uploadImageUrl');
    AppDebug.showPrint('pdfUrl: $_uploadPdfUrl');

    BlocProvider.of<JobsBloc>(context).add(
      JobCreateJobApplicantRequested(
        createJobApplicantParams: CreateJobApplicantParams(
          title: _titleController.text.trim(),
          motivation: _motivationController.text.trim(),
          photoUrl: _uploadImageUrl,
          pdfUrl: _uploadPdfUrl,
          categories: _selectedCategories,
          locations: _selectedLocations,
          // locationId: _selectedLocation!,
          genderId: _selectedGender!,
          typeId: _selectedPlan!.type.id,
          durationId: _selectedPlan!.duration.id,
          // categoryId: _selectedCategory!,
          status: 'published',
        ),
      ),
    );
  }

  // ── Lifecycle ──────────────────────────────────────────────────────────

  @override
  void dispose() {
    _titleController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  // ── Build ──────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(const JobFeaturesFetchRequested())
        ..add(
          const JobsGetPricePlanRequested(
            getPricePlanParams: GetPricePlanParams(plan: 'job-applicant'),
          ),
        ),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _jobFeatures = state.jobFeatures);
              } else if (state is JobsGetPricePlanSuccess) {
                setState(() => _plans = state.pricePlans);
              } else if (state is JobsUploadImageSuccess) {
                setState(() => _uploadImageUrl = state.jobImage.url);
                // AppMessenger.showSuccess(
                //   context,
                //   'Photo uploaded successfully',
                // );
              } else if (state is JobsUploadPdfSuccess) {
                setState(() => _uploadPdfUrl = state.jobPdf.url);
                // AppMessenger.showSuccess(
                //   context,
                //   'Resume uploaded successfully',
                // );
              } else if (state is JobsCreateJobApplicantSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.postJobApplicantSuccessful.name,
                  pathParameters: {'id': state.jobApplicant.id.toString()},
                );
              } else if (state is JobsRequestFailure) {
                if (state.message == 'Unprocessable entity') {
                  AppMessenger.showError(
                    context,
                    context.appLoc.no_enough_kara,
                  );
                } else {
                  AppMessenger.showError(context, state.message);
                }
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);
              // final isDark = theme.brightness == Brightness.dark;

              return BaseScreen(
                appBar: TitleHeader(title: context.appLoc.post_job_applicant),
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Constants.paddingMedium,
                      vertical: Constants.paddingMedium,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Title ────────────────────────────────────────
                        LabelField(label: '${context.appLoc.job_title} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _titleController,
                          hintText: context.appLoc.add_job_title,
                          maxLines: 3,
                          maxLength: 130,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Motivation ───────────────────────────────────
                        LabelField(label: '${context.appLoc.motivation} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _motivationController,
                          hintText: context.appLoc.add_motivation,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Photo ───────────────────────────────────
                        LabelField(label: context.appLoc.photo_optional),
                        const SizedBox(height: Constants.spacingSmall),
                        SinglePhotoUploadWidget(
                          onPhotoChanged: (photo) {
                            if (photo != null) {
                              BlocProvider.of<JobsBloc>(
                                context,
                              ).add(JobsUploadImageRequested(file: photo));
                            }
                          },
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Resume ───────────────────────────────────────
                        LabelField(label: context.appLoc.resume_optional),
                        const SizedBox(height: Constants.spacingSmall),
                        SinglePdfUploadWidget(
                          text: context.appLoc.upload_resume_pdf,
                          onPdfChanged: (pdf) {
                            if (pdf != null) {
                              BlocProvider.of<JobsBloc>(
                                context,
                              ).add(JobsUploadPdfRequested(file: pdf));
                            }
                          },
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Category (single select) ─────────────────────
                        // Text(
                        //   '${context.appLoc.category} *',
                        //   style: theme.textTheme.titleSmall!.copyWith(
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // const SizedBox(height: Constants.spacingSmall),
                        // if (_jobFeatures != null)
                        //   Wrap(
                        //     spacing: Constants.spacingMedium,
                        //     children: _jobFeatures!.categories.map((category) {
                        //       final isSelected =
                        //           _selectedCategory == category.id;
                        //       return InkWell(
                        //         onTap: () => _toggleCategory(category.id),
                        //         borderRadius: BorderRadius.circular(4),
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //             vertical: 6,
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.max,
                        //             children: [
                        //               SizedBox(
                        //                 width: 24,
                        //                 height: 24,
                        //                 child: Checkbox(
                        //                   value: isSelected,
                        //                   onChanged: (_) =>
                        //                       _toggleCategory(category.id),
                        //                 ),
                        //               ),
                        //               const SizedBox(
                        //                 width: Constants.spacingExtraSmall,
                        //               ),
                        //               Text(
                        //                 category.name,
                        //                 style: theme.textTheme.bodyMedium,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   )
                        // else
                        //   const Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 8.0),
                        //     child: CircularProgressIndicator(),
                        //   ),
                        Row(
                          children: [
                            Text(
                              '${context.appLoc.categories} * ',
                              style: theme.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              context.appLoc.max_3,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white54 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.categories.map((category) {
                              final isSelected = _selectedCategories.contains(
                                category.id,
                              );
                              return InkWell(
                                onTap: () => _toggleCategories(category.id),
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: isSelected,
                                          onChanged: (value) =>
                                              _toggleCategories(category.id),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constants.spacingExtraSmall,
                                      ),
                                      Text(
                                        category.name,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Location ─────────────────────────────────────
                        // LabelField(
                        //   label: '${context.appLoc.zone_by_province} *',
                        // ),
                        // const SizedBox(height: Constants.spacingSmall),
                        // if (_jobFeatures != null)
                        //   Wrap(
                        //     spacing: Constants.spacingMedium,
                        //     children: _jobFeatures!.locations.map((location) {
                        //       final isSelected =
                        //           _selectedLocation == location.id;
                        //       return InkWell(
                        //         onTap: () => _toggleLocation(location.id),
                        //         borderRadius: BorderRadius.circular(4),
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //             vertical: 6,
                        //           ),
                        //           child: Row(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               SizedBox(
                        //                 width: 24,
                        //                 height: 24,
                        //                 child: Checkbox(
                        //                   value: isSelected,
                        //                   onChanged: (_) =>
                        //                       _toggleLocation(location.id),
                        //                 ),
                        //               ),
                        //               const SizedBox(
                        //                 width: Constants.spacingExtraSmall,
                        //               ),
                        //               Text(
                        //                 location.name,
                        //                 style: theme.textTheme.bodyMedium,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   ),
                        Row(
                          children: [
                            Text(
                              '${context.appLoc.location} * ',
                              style: theme.textTheme.titleSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              context.appLoc.max_3,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white54 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.locations.map((location) {
                              final isSelected = _selectedLocations.contains(
                                location.id,
                              );
                              return InkWell(
                                onTap: () => _toggleLocations(location.id),
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: isSelected,
                                          onChanged: (value) =>
                                              _toggleLocations(location.id),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constants.spacingExtraSmall,
                                      ),
                                      Text(
                                        location.name,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Gender ───────────────────────────────────────
                        LabelField(label: '${context.appLoc.gender} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.genders.map((gender) {
                              final isSelected = _selectedGender == gender.id;
                              return InkWell(
                                onTap: () => _toggleGender(gender.id),
                                borderRadius: BorderRadius.circular(4),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 6,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Checkbox(
                                          value: isSelected,
                                          onChanged: (_) =>
                                              _toggleGender(gender.id),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constants.spacingExtraSmall,
                                      ),
                                      Text(
                                        gender.name,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                        const SizedBox(height: Constants.spacingLarge),
                        const Divider(),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Post Features Section ────────────────────────
                        PostFeaturesSection(
                          plans: _plans,
                          isLoading: isLoading,
                          onPlanSelected: (plan) {
                            _selectedPlan = plan;
                          },
                          onPost: () => _postJobApplicant(context),
                          postButtonLabel: context.appLoc.post.toUpperCase(),
                        ),
                        const SizedBox(height: Constants.spacingLarge),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
