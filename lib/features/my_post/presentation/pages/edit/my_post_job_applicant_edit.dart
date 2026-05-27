import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_applicant_plan.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_features_section.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_pdf_upload_widget.dart';
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

  int? _selectedCategory;
  int? _selectedLocation;
  int? _selectedGender;

  JobFeatures? _jobFeatures;
  List<JobApplicantPlan> _plans = [];
  JobApplicantPlan? _selectedPlan;

  String? _existingPdfUrl;
  String? _uploadPdfUrl;

  bool _isFormReady = false;

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
    _selectedCategory = applicant.category?.id;
    _selectedLocation = applicant.location.id;
    _selectedGender = applicant.gender?.id;
    _existingPdfUrl = applicant.pdfUrl;
    _uploadPdfUrl = null;
    _checkFormReady();
  }

  void _checkFormReady() {
    final hasBasics =
        _titleController.text.trim().isNotEmpty &&
        _motivationController.text.trim().isNotEmpty;
    final hasSelections =
        _selectedCategory != null &&
        _selectedLocation != null &&
        _selectedGender != null &&
        _plans.isNotEmpty;
    setState(() {
      _isFormReady = hasBasics && hasSelections;
    });
  }

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

  void _updateJobApplicant(BuildContext context) {
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

    final pdfUrlToSend = _uploadPdfUrl ?? _existingPdfUrl ?? '';

    BlocProvider.of<MyPostBloc>(context).add(
      MyPostUpdateJobApplicantRequested(
        updateJobApplicantParams: UpdateJobApplicantParams(
          id: widget.jobApplicantId,
          title: _titleController.text.trim(),
          motivation: _motivationController.text.trim(),
          imageUrl: '', // Photo upload is currently disabled in create flow.
          pdfUrl: pdfUrlToSend,
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

  @override
  void dispose() {
    _titleController.dispose();
    _motivationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetIt.instance<JobsBloc>()
            ..add(const JobFeaturesFetchRequested())
            ..add(JobsGetJobApplicantDetailRequested(id: widget.jobApplicantId))
            ..add(const JobsGetJobApplicantPlanRequested()),
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
              } else if (state is JobsGetJobApplicantPlanSuccess) {
                setState(() => _plans = state.jobApplicantPlans);
                _checkFormReady();
              } else if (state is JobsUploadPdfSuccess) {
                setState(() => _uploadPdfUrl = state.jobPdf.url);
                AppMessenger.showSuccess(
                  context,
                  'Resume uploaded successfully',
                );
              } else if (state is JobsRequestFailure) {
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
                context.pop(true);
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
              return const BaseScreen(
                appBar: TitleHeader(title: 'Edit job applicant'),
                child: ShimmerJobDetailIndicator(),
              );
            }

            return BlocBuilder<MyPostBloc, MyPostState>(
              builder: (context, myPostState) {
                final isSaving = myPostState is MyPostRequestInProgress;

                return BaseScreen(
                  appBar: const TitleHeader(title: 'Edit job applicant'),
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
                          const LabelField(label: 'Job title *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _titleController,
                            hintText: 'Add job title',
                            maxLines: 3,
                            maxLength: 130,
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          const LabelField(label: 'Motivation *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _motivationController,
                            hintText: 'Add motivation',
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                          ),
                          const SizedBox(height: Constants.spacingMedium),

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
                          Text(
                            'Category *',
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          if (_jobFeatures != null)
                            Wrap(
                              spacing: Constants.spacingMedium,
                              children: _jobFeatures!.categories.map((
                                category,
                              ) {
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
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
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
                          const SizedBox(height: Constants.spacingLarge),
                          const Divider(),
                          const SizedBox(height: Constants.spacingMedium),

                          PostFeaturesSection(
                            plans: _plans,
                            isLoading: isSaving,
                            onPlanSelected: (plan) {
                              _selectedPlan = plan;
                            },
                            onPost: () => _updateJobApplicant(context),
                            postButtonLabel: 'UPDATE',
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
      ),
    );
  }
}
