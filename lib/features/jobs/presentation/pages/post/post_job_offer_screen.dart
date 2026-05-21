import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/date_field.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/routing/routes.dart';

class PostJobOfferScreen extends StatefulWidget {
  const PostJobOfferScreen({super.key});

  @override
  State<PostJobOfferScreen> createState() => _PostJobOfferScreenState();
}

class _PostJobOfferScreenState extends State<PostJobOfferScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();

  final List<int> _selectedCategories = [];
  int? _selectedLocation;
  int? _selectedGender;
  int? _selectedActor;

  int? _uploadImageId;
  JobFeatures? _jobFeatures;

  void _clearValues() {
    _titleController.clear();
    _descriptionController.clear();
    _birthDateController.clear();
    setState(() {
      _selectedCategories.clear();
      _selectedLocation = null;
      _selectedGender = null;
      _selectedActor = null;
      _uploadImageId = null;
    });
  }

  void _postJobOffer(BuildContext context) {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _birthDateController.text.trim().isEmpty ||
        _selectedCategories.isEmpty ||
        _selectedLocation == null ||
        _selectedGender == null ||
        _selectedActor == null ||
        _uploadImageId == null) {
      AppMessenger.showWarning(
        context,
        'Please fill all required fields and upload a photo',
      );
      return;
    }
    AppDebug.showPrint('title ${_titleController.text.trim()}');
    AppDebug.showPrint('description ${_descriptionController.text.trim()}');
    AppDebug.showPrint('limitDate ${_birthDateController.text.trim()}');
    AppDebug.showPrint('categories $_selectedCategories');
    AppDebug.showPrint('location $_selectedLocation');
    AppDebug.showPrint('gender $_selectedGender');
    AppDebug.showPrint('actor $_selectedActor');
    AppDebug.showPrint('imageUrl $_uploadImageId');
    BlocProvider.of<JobsBloc>(context).add(
      JobsCreateJobOfferRequested(
        createJobOfferParams: CreateJobOfferParams(
          title: _titleController.text.trim(),
          imageId: _uploadImageId!,
          description: _descriptionController.text.trim(),
          categories: _selectedCategories,
          location: _selectedLocation!,
          gender: _selectedGender!,
          actor: _selectedActor!,
          limitDate: _birthDateController.text.trim(),
          status: 'published',
        ),
      ),
    );
  }

  void _toggleCategory(int categoryId) {
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

  void _toggleLocation(int locationId) {
    setState(() {
      if (_selectedLocation == locationId) {
        _selectedLocation = null;
      } else {
        _selectedLocation = locationId;
      }
    });
  }

  void _toggleGender(int genderId) {
    setState(() {
      if (_selectedGender == genderId) {
        _selectedGender = null;
      } else {
        _selectedGender = genderId;
      }
    });
  }

  void _toggleActor(int actorId) {
    setState(() {
      if (_selectedActor == actorId) {
        _selectedActor = null;
      } else {
        _selectedActor = actorId;
      }
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) =>
          GetIt.instance<JobsBloc>()..add(const JobFeaturesFetchRequested()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() {
                  _jobFeatures = state.jobFeatures;
                });
              } else if (state is JobsUploadImageSuccess) {
                setState(() {
                  _uploadImageId = state.jobImage.id;
                });
                AppMessenger.showSuccess(
                  context,
                  'Photo uploaded successfully',
                );
              } else if (state is JobsCreateJobOfferSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.postJobOfferSuccessful.name,
                  pathParameters: {'id': state.jobOffer.id.toString()},
                );
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;

              return BaseScreen(
                appBar: const TitleHeader(title: 'Post a job offer'),
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
                          onPhotoChanged: (photo) {
                            if (photo != null) {
                              BlocProvider.of<JobsBloc>(
                                context,
                              ).add(JobsUploadImageRequested(file: photo));
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
                                          onChanged: (value) =>
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
                                          onChanged: (value) =>
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
                                          onChanged: (value) =>
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
                                          onChanged: (value) =>
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
                        DateField(birthDateController: _birthDateController),
                        const SizedBox(height: Constants.spacingMedium),

                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () => _postJobOffer(context),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'POST',
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
    );
  }
}
