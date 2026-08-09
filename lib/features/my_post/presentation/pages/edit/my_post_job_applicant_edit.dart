import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_pdf_upload_widget.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_applicant/update_job_applicant_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';

class MyPostJobApplicantEditScreen extends StatefulWidget {
  const MyPostJobApplicantEditScreen({
    super.key,
    required this.jobApplicantId,
    this.initialJobApplicant,
  });

  final int jobApplicantId;
  final JobApplicant? initialJobApplicant;

  @override
  State<MyPostJobApplicantEditScreen> createState() =>
      _MyPostJobApplicantEditScreenState();
}

class _MyPostJobApplicantEditScreenState
    extends State<MyPostJobApplicantEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _motivationController = TextEditingController();

  final List<int> _selectedCategories = [];
  final List<int> _selectedLocations = [];
  // int? _selectedCategory;
  // int? _selectedLocation;
  int? _selectedGender;

  JobFeatures? _jobFeatures;
  // List<PricePlan> _plans = [];
  // PricePlan? _selectedPlan;

  String? _existingPdfUrl;
  String? _uploadPdfUrl;

  String? _existingPhotoUrl;
  String? _uploadPhotoUrl;

  bool _isFormReady = false;
  bool _isUploadingImages = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialJobApplicant != null) {
      _populateFromJobApplicant(widget.initialJobApplicant!);
    }
  }

  void _populateFromJobApplicant(JobApplicant applicant) {
    _titleController.text = applicant.title;
    _motivationController.text = applicant.motivation;
    _selectedCategories
      ..clear()
      ..addAll(applicant.categories.map((category) => category.id));
    _selectedLocations
      ..clear()
      ..addAll(applicant.locations.map((location) => location.id));
    // _selectedCategory = applicant.category?.id;
    // _selectedLocation = applicant.location.id;
    _selectedGender = applicant.gender?.id;
    _existingPdfUrl = applicant.pdfUrl;
    _uploadPdfUrl = null;
    _existingPhotoUrl = applicant.photoUrl;
    _checkFormReady();
  }

  void _checkFormReady() {
    final hasBasics =
        _titleController.text.trim().isNotEmpty &&
        _motivationController.text.trim().isNotEmpty;
    final hasSelections =
        // _selectedCategory != null &&
        // _selectedLocation != null &&
        _selectedGender != null &&
        _selectedCategories.isNotEmpty &&
        _selectedLocations.isNotEmpty;
    // _plans.isNotEmpty;
    setState(() {
      _isFormReady = hasBasics && hasSelections;
    });
  }

  void _toggleCategories(int categoryId) {
    setState(() {
      if (_selectedCategories.contains(categoryId)) {
        _selectedCategories.remove(categoryId);
      } else if (_selectedCategories.length < 3) {
        _selectedCategories.add(categoryId);
      }
    });
  }

  void _toggleLocations(int locationId) {
    setState(() {
      if (_selectedLocations.contains(locationId)) {
        _selectedLocations.remove(locationId);
      } else if (_selectedLocations.length < 3) {
        _selectedLocations.add(locationId);
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

  void _updateJobApplicant(BuildContext context) {
    if (_titleController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a job title');
      return;
    }
    if (_motivationController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a motivation');
      return;
    }
    if (_selectedCategories.isEmpty) {
      AppMessenger.showWarning(context, 'Please select a category');
      return;
    }
    if (_selectedLocations.isEmpty) {
      AppMessenger.showWarning(context, 'Please select a location');
      return;
    }
    // if (_selectedCategory == null) {
    //   AppMessenger.showWarning(context, 'Please select a category');
    //   return;
    // }
    // if (_selectedLocation == null) {
    //   AppMessenger.showWarning(context, 'Please select a location');
    //   return;
    // }
    if (_selectedGender == null) {
      AppMessenger.showWarning(context, 'Please select a gender');
      return;
    }
    // if (_selectedPlan == null) {
    //   AppMessenger.showWarning(context, 'Please select a plan');
    //   return;
    // }

    final pdfUrlToSend = _uploadPdfUrl ?? _existingPdfUrl ?? '';
    final photoUrlToSend = _uploadPhotoUrl ?? _existingPhotoUrl ?? '';

    AppDebug.showPrint('PHoto : $photoUrlToSend');

    BlocProvider.of<MyPostBloc>(context).add(
      MyPostUpdateJobApplicantRequested(
        updateJobApplicantParams: UpdateJobApplicantParams(
          id: widget.jobApplicantId,
          title: _titleController.text.trim(),
          motivation: _motivationController.text.trim(),
          photoUrl: photoUrlToSend,
          pdfUrl: pdfUrlToSend,
          categories: _selectedCategories,
          locations: _selectedLocations,
          // locationId: _selectedLocation!,
          genderId: _selectedGender!,
          // typeId: _selectedPlan!.type.id,
          // durationId: _selectedPlan!.duration.id,
          // categoryId: _selectedCategory!,
          status: 'published',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.instance<JobsBloc>()
            ..add(const JobFeaturesFetchRequested())
            ..add(JobsGetJobApplicantDetailRequested(id: widget.jobApplicantId))
            ..add(
              const JobsGetPricePlanRequested(
                getPricePlanParams: GetPricePlanParams(plan: 'job-applicant'),
              ),
            ),
        ),
        BlocProvider(create: (_) => GetIt.instance<MyPostBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _jobFeatures = state.jobFeatures);
                _checkFormReady();
              } else if (state is JobsGetJobApplicantDetailSuccess) {
                _populateFromJobApplicant(state.jobApplicant);
              }
              // else if (state is JobsGetPricePlanSuccess) {
              //   setState(() => _plans = state.pricePlans);
              //   _checkFormReady();
              // }
              else if (state is JobsUploadImageSuccess) {
                setState(() {
                  _isUploadingImages = true;
                  _uploadPhotoUrl = state.jobImage.url;
                });
                AppMessenger.showSuccess(
                  context,
                  'Photo uploaded successfully',
                );
              } else if (state is JobsUploadPdfSuccess) {
                setState(() => _uploadPdfUrl = state.jobPdf.url);
                AppMessenger.showSuccess(
                  context,
                  'Resume uploaded successfully',
                );
              } else if (state is JobsRequestFailure) {
                setState(() => _isUploadingImages = false);
                AppMessenger.showError(context, state.message);
              }
            },
          ),
          BlocListener<MyPostBloc, MyPostState>(
            listener: (context, state) {
              if (state is MyPostUpdateJobApplicantSuccess) {
                AppMessenger.showSuccess(
                  context,
                  'Job applicant updated successfully',
                );
                context.pop(state.jobApplicant);
              } else if (state is MyPostRequestFailure) {
                if (state.message.contains('Unprocessable entity')) {
                  AppMessenger.showWarning(context, state.message);
                } else {
                  AppMessenger.showError(context, state.message);
                }
              }
            },
          ),
        ],
        child: BlocBuilder<JobsBloc, JobsState>(
          builder: (context, jobsState) {
            final isJobsLoading =
                !_isFormReady &&
                (jobsState is JobsRequestInProgress ||
                    jobsState is JobsInitial);

            if (isJobsLoading) {
              return BaseScreen(
                appBar: TitleHeader(title: context.appLoc.edit_job_applicant),
                child: const ShimmerJobDetailIndicator(),
              );
            }

            return BlocBuilder<MyPostBloc, MyPostState>(
              builder: (context, myPostState) {
                final isSaving = myPostState is MyPostRequestInProgress;
                final isBusy = isSaving || _isUploadingImages;

                return BaseScreen(
                  appBar: TitleHeader(title: context.appLoc.edit_job_applicant),
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
                          LabelField(label: '${context.appLoc.job_title} *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _titleController,
                            hintText: context.appLoc.add_job_title,
                            maxLines: 3,
                            maxLength: 130,
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          LabelField(label: '${context.appLoc.motivation} *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _motivationController,
                            hintText: context.appLoc.add_motivation,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          LabelField(label: context.appLoc.photo_optional),
                          const SizedBox(height: Constants.spacingSmall),
                          SinglePhotoUploadWidget(
                            onPhotoChanged: (photo) {
                              if (photo != null) {
                                setState(() => _isUploadingImages = true);
                                BlocProvider.of<JobsBloc>(
                                  context,
                                ).add(JobsUploadImageRequested(file: photo));
                              } else {
                                setState(() {
                                  _uploadPhotoUrl = null;
                                  _existingPhotoUrl = null;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          LabelField(label: context.appLoc.resume_optional),
                          const SizedBox(height: Constants.spacingSmall),
                          SinglePdfUploadWidget(
                            text: context.appLoc.upload_resume_pdf,
                            onPdfChanged: (pdf) {
                              if (pdf != null) {
                                BlocProvider.of<JobsBloc>(
                                  context,
                                ).add(JobsUploadPdfRequested(file: pdf));
                              } else {
                                setState(() {
                                  _uploadPdfUrl = null;
                                  _existingPdfUrl = null;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          // ── Category (single select) ─────────────────────
                          // Text(
                          //   '${context.appLoc.category} *',
                          //   style: Theme.of(context).textTheme.titleSmall!
                          //       .copyWith(fontWeight: FontWeight.bold),
                          // ),
                          // const SizedBox(height: Constants.spacingSmall),
                          // if (_jobFeatures != null)
                          //   Wrap(
                          //     spacing: Constants.spacingMedium,
                          //     children: _jobFeatures!.categories.map((
                          //       category,
                          //     ) {
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
                          //                 style: Theme.of(
                          //                   context,
                          //                 ).textTheme.bodyMedium,
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
                                '(${context.appLoc.max_3})',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? Colors.white54
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          if (_jobFeatures != null)
                            Wrap(
                              spacing: Constants.spacingMedium,
                              children: _jobFeatures!.categories.map((
                                category,
                              ) {
                                final isSelected = _selectedCategories.contains(
                                  category.id,
                                );
                                return InkWell(
                                  onTap: isBusy
                                      ? null
                                      : () => _toggleCategories(category.id),
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
                                            onChanged: isBusy
                                                ? null
                                                : (_) => _toggleCategories(
                                                    category.id,
                                                  ),
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
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: CircularProgressIndicator(),
                            ),
                          const SizedBox(height: Constants.spacingMedium),

                          // ── Location ─────────────────────────────────────
                          // LabelField(label: '${context.appLoc.location} *'),
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
                          //                 style: Theme.of(
                          //                   context,
                          //                 ).textTheme.bodyMedium,
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
                                '(${context.appLoc.max_3})',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? Colors.white54
                                      : Colors.black54,
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
                                  onTap: isBusy
                                      ? null
                                      : () => _toggleLocations(location.id),
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
                                            onChanged: isBusy
                                                ? null
                                                : (_) => _toggleLocations(
                                                    location.id,
                                                  ),
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
                              padding: EdgeInsets.symmetric(vertical: 8),
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
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),

                          const SizedBox(height: Constants.spacingMedium),

                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () => _updateJobApplicant(context),
                              child: isSaving
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      context.appLoc.update,
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1.2,
                                            color: isDark
                                                ? AppColors.darkTextPrimary
                                                : AppColors.lightTextPrimary,
                                          ),
                                    ),
                            ),
                          ),

                          // PostFeaturesSection(
                          //   plans: _plans,
                          //   isLoading: isSaving,
                          //   onPlanSelected: (plan) {
                          //     _selectedPlan = plan;
                          //   },
                          //   onPost: () => _updateJobApplicant(context),
                          //   postButtonLabel: context.appLoc.update,
                          // ),
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
      ),
    );
  }
}
