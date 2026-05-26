import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/date_field.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/job_offer.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_job_offer/update_job_offer_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';

class MyPostJobOfferEditScreen extends StatefulWidget {
  const MyPostJobOfferEditScreen({
    super.key,
    required this.jobOfferId,
    this.initialJobOffer,
  });

  final int jobOfferId;
  final JobOffer? initialJobOffer;

  @override
  State<MyPostJobOfferEditScreen> createState() =>
      _MyPostJobOfferEditScreenState();
}

class _MyPostJobOfferEditScreenState extends State<MyPostJobOfferEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _limitDateController = TextEditingController();

  final List<int> _selectedCategories = [];
  int? _selectedLocation;
  int? _selectedGender;
  int? _selectedActor;

  int? _uploadImageId;
  int _existingImageId = -1;
  String _status = 'published';
  String? _initialImageUrl;
  JobFeatures? _jobFeatures;
  bool _isFormReady = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialJobOffer != null) {
      _populateForm(widget.initialJobOffer!);
      _isFormReady = true;
    }
  }

  void _populateForm(JobOffer jobOffer) {
    _titleController.text = jobOffer.title;
    _descriptionController.text = jobOffer.description;
    _limitDateController.text = _formatDateLimit(jobOffer.dateLimit);
    _selectedCategories
      ..clear()
      ..addAll(jobOffer.categories.map((category) => category.id));
    _selectedLocation = jobOffer.location?.id;
    _selectedGender = jobOffer.gender?.id;
    _selectedActor = jobOffer.actor?.id;
    _existingImageId = jobOffer.image?.id ?? -1;
    _initialImageUrl = jobOffer.image?.url;
    _status = jobOffer.status.isNotEmpty ? jobOffer.status : 'published';
  }

  String _formatDateLimit(String dateLimit) {
    if (dateLimit.isEmpty) return '';
    return dateLimit.split('T').first.split(' ').first;
  }

  int? get _resolvedImageId {
    final imageId = _uploadImageId ?? _existingImageId;
    return imageId > 0 ? imageId : null;
  }

  void _updateJobOffer(BuildContext context) {
    AppDebug.showPrint(
      'Updating job offer with title: ${_titleController.text}',
    );
    AppDebug.showPrint(
      'Updating job offer with description: ${_descriptionController.text}',
    );
    AppDebug.showPrint(
      'Updating job offer with limit date: ${_limitDateController.text}',
    );
    AppDebug.showPrint(
      'Updating job offer with categories: $_selectedCategories',
    );
    AppDebug.showPrint('Updating job offer with location: $_selectedLocation');
    AppDebug.showPrint('Updating job offer with gender : $_selectedGender');
    AppDebug.showPrint('Updating job offer with actor : $_selectedActor');

    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _limitDateController.text.trim().isEmpty ||
        _selectedCategories.isEmpty ||
        _selectedLocation == null ||
        _selectedGender == null ||
        _selectedActor == null ||
        _resolvedImageId == null) {
      AppMessenger.showWarning(
        context,
        'Please fill all required fields and keep or upload a photo',
      );
      return;
    }

    BlocProvider.of<MyPostBloc>(context).add(
      MyPostUpdateJobOfferRequested(
        updateJobOfferParams: UpdateJobOfferParams(
          id: widget.jobOfferId,
          title: _titleController.text.trim(),
          imageId: _resolvedImageId!,
          description: _descriptionController.text.trim(),
          categories: List<int>.from(_selectedCategories),
          location: _selectedLocation!,
          gender: _selectedGender!,
          actor: _selectedActor!,
          limitDate: _limitDateController.text.trim(),
          status: _status,
        ),
      ),
    );
  }

  void _toggleCategory(int categoryId) {
    setState(() {
      if (_selectedCategories.contains(categoryId)) {
        _selectedCategories.remove(categoryId);
      } else if (_selectedCategories.length < 3) {
        _selectedCategories.add(categoryId);
      }
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

  void _toggleActor(int actorId) {
    setState(() {
      _selectedActor = _selectedActor == actorId ? null : actorId;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _limitDateController.dispose();
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
            ..add(JobsGetJobOfferDetailRequested(id: widget.jobOfferId)),
        ),
        BlocProvider(create: (_) => GetIt.instance<MyPostBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _jobFeatures = state.jobFeatures);
              } else if (state is JobsGetJobOfferDetailSuccess) {
                setState(() {
                  _populateForm(state.jobOffer);
                  _isFormReady = true;
                });
              } else if (state is JobsUploadImageSuccess) {
                setState(() => _uploadImageId = state.jobImage.id);
                AppMessenger.showSuccess(
                  context,
                  'Photo uploaded successfully',
                );
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
          ),
          BlocListener<MyPostBloc, MyPostState>(
            listener: (context, state) {
              if (state is MyPostUpdateJobOfferSuccess) {
                AppMessenger.showSuccess(
                  context,
                  'Job offer updated successfully',
                );
                context.pop(true);
              } else if (state is MyPostRequestFailure) {
                AppMessenger.showError(context, state.message);
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
                appBar: TitleHeader(title: 'Edit job offer'),
                child: ShimmerJobDetailIndicator(),
              );
            }

            return BlocBuilder<MyPostBloc, MyPostState>(
              builder: (context, myPostState) {
                final isSaving = myPostState is MyPostRequestInProgress;

                return BaseScreen(
                  appBar: const TitleHeader(title: 'Edit job offer'),
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
                          const LabelField(label: 'Photo'),
                          const SizedBox(height: Constants.spacingSmall),
                          SinglePhotoUploadWidget(
                            initialNetworkImageUrl: _initialImageUrl,
                            onPhotoChanged: (photo) {
                              if (photo != null) {
                                BlocProvider.of<JobsBloc>(
                                  context,
                                ).add(JobsUploadImageRequested(file: photo));
                              } else {
                                setState(() {
                                  _uploadImageId = null;
                                  _existingImageId = -1;
                                  _initialImageUrl = null;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          const LabelField(label: 'Description *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _descriptionController,
                            hintText: 'Add description',
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          Row(
                            children: [
                              Text(
                                'Category * ',
                                style: theme.textTheme.titleSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '(3 max)',
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
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: CircularProgressIndicator(),
                            ),
                          const SizedBox(height: Constants.spacingMedium),
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
                          const SizedBox(height: Constants.spacingMedium),
                          const LabelField(label: 'Actor *'),
                          const SizedBox(height: Constants.spacingSmall),
                          if (_jobFeatures != null)
                            Wrap(
                              spacing: Constants.spacingMedium,
                              children: _jobFeatures!.actors.map((actor) {
                                final isSelected = _selectedActor == actor.id;
                                return InkWell(
                                  onTap: () => _toggleActor(actor.id),
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
                                                _toggleActor(actor.id),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: Constants.spacingExtraSmall,
                                        ),
                                        Text(
                                          actor.name,
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
                          Text(
                            'Post features',
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          Text(
                            'Date limite de canditature *',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          DateField(birthDateController: _limitDateController),
                          const SizedBox(height: Constants.spacingMedium),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: isSaving
                                  ? null
                                  : () => _updateJobOffer(context),
                              child: isSaving
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      'SAVE',
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
