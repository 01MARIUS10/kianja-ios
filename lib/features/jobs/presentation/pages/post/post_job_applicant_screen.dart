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
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_plan.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_applicant/create_job_applicant_params.dart';
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
  int? _selectedCategory; // single select for job applicant
  int? _selectedLocation;
  int? _selectedGender;

  // ── Features fetched from bloc ─────────────────────────────────────────
  JobFeatures? _jobFeatures;
  List<JobApplicantPlan> _plans = [];

  // ── Selected plan fed back from PostFeaturesSection ────────────────────
  JobApplicantPlan? _selectedPlan;

  // ── Upload results ─────────────────────────────────────────────────────
  String? _uploadImageUrl;
  String? _uploadPdfUrl;

  // ── Toggles ───────────────────────────────────────────────────────────

  void _toggleCategory(int categoryId) {
    setState(() {
      _selectedCategory = _selectedCategory == categoryId ? null : categoryId;
    });
  }

  void _toggleLocation(int locationId) {
    setState(() {
      _selectedLocation = _selectedLocation == locationId ? null : locationId;
    });
  }

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
      _selectedCategory = null;
      _selectedLocation = null;
      _selectedGender = null;
      _selectedPlan = null;
      _uploadImageUrl = null;
      _uploadPdfUrl = null;
    });
  }

  // ── Submit ────────────────────────────────────────────────────────────

  void _postJobApplicant(BuildContext context) {
    if (_titleController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a job title');
      return;
    }
    if (_motivationController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a motivation');
      return;
    }
    if (_selectedCategory == null) {
      AppMessenger.showWarning(context, 'Please select a category');
      return;
    }
    if (_selectedLocation == null) {
      AppMessenger.showWarning(context, 'Please select a location');
      return;
    }
    if (_selectedGender == null) {
      AppMessenger.showWarning(context, 'Please select a gender');
      return;
    }
    if (_selectedPlan == null) {
      AppMessenger.showWarning(context, 'Please select a plan');
      return;
    }

    AppDebug.showPrint('title: ${_titleController.text.trim()}');
    AppDebug.showPrint('motivation: ${_motivationController.text.trim()}');
    AppDebug.showPrint('categoryId: $_selectedCategory');
    AppDebug.showPrint('locationId: $_selectedLocation');
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
          imageUrl: _uploadImageUrl ?? '',
          pdfUrl: _uploadPdfUrl ?? '',
          locationId: _selectedLocation!,
          genderId: _selectedGender!,
          typeId: _selectedPlan!.type.id,
          durationId: _selectedPlan!.duration.id,
          categoryId: _selectedCategory!,
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
    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(const JobFeaturesFetchRequested())
        ..add(const JobsGetJobApplicantPlanRequested()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _jobFeatures = state.jobFeatures);
              } else if (state is JobsGetJobApplicantPlanSuccess) {
                setState(() => _plans = state.jobApplicantPlans);
              } else if (state is JobsUploadImageSuccess) {
                setState(() => _uploadImageUrl = state.jobImage.url);
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
              } else if (state is JobsCreateJobApplicantSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.postJobApplicantSuccessful.name,
                  pathParameters: {'id': state.jobApplicant.id.toString()},
                );
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);
              // final isDark = theme.brightness == Brightness.dark;

              return BaseScreen(
                appBar: const TitleHeader(title: 'Post a job applicant'),
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
                        const LabelField(label: 'Job title *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _titleController,
                          hintText: 'Add job title',
                          maxLines: 3,
                          maxLength: 130,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Motivation ───────────────────────────────────
                        const LabelField(label: 'Motivation *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _motivationController,
                          hintText: 'Add motivation',
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Photo ────────────────────────────────────────
                        const LabelField(label: 'Recent photo (optional)'),
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
                        const LabelField(label: 'Resume (optional)'),
                        const SizedBox(height: Constants.spacingSmall),
                        SinglePdfUploadWidget(
                          text:
                              'Upload your Resume and\nlet members look at it.\nIn PDF format.',
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
                        Text(
                          'Category *',
                          style: theme.textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.categories.map((category) {
                              final isSelected =
                                  _selectedCategory == category.id;
                              return InkWell(
                                onTap: () => _toggleCategory(category.id),
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
                                              _toggleCategory(category.id),
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
                        const LabelField(label: 'Location *'),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.locations.map((location) {
                              final isSelected =
                                  _selectedLocation == location.id;
                              return InkWell(
                                onTap: () => _toggleLocation(location.id),
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
                                              _toggleLocation(location.id),
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
                          ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Gender ───────────────────────────────────────
                        const LabelField(label: 'Gender *'),
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
