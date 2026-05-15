import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/multi_photo_upload_widget.dart';

class PostTrainingCenterScreen extends StatefulWidget {
  const PostTrainingCenterScreen({super.key});

  @override
  State<PostTrainingCenterScreen> createState() =>
      _PostTrainingCenterScreenState();
}

class _PostTrainingCenterScreenState extends State<PostTrainingCenterScreen> {
  final TextEditingController _centerNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // ── Category (multi-select, max 5) ──────────────────────────────────────
  final List<int> _selectedCategories = [];

  // ── Single-select IDs ────────────────────────────────────────────────────
  int? _selectedLocationId;
  int? _selectedActorId;

  // ── Photos ───────────────────────────────────────────────────────────────
  // List<XFile> _photos = [];

  // ── Features from bloc ───────────────────────────────────────────────────
  JobFeatures? _jobFeatures;

  // ── Toggles ──────────────────────────────────────────────────────────────
  void _toggleCategory(int categoryId) {
    setState(() {
      if (_selectedCategories.contains(categoryId)) {
        _selectedCategories.remove(categoryId);
      } else {
        if (_selectedCategories.length < 5) {
          _selectedCategories.add(categoryId);
        }
      }
    });
  }

  void _toggleLocation(int locationId) {
    setState(() {
      if (_selectedLocationId == locationId) {
        _selectedLocationId = null;
      } else {
        _selectedLocationId = locationId;
      }
    });
  }

  void _toggleActor(int actorId) {
    setState(() {
      if (_selectedActorId == actorId) {
        _selectedActorId = null;
      } else {
        _selectedActorId = actorId;
      }
    });
  }

  // ── Clear ─────────────────────────────────────────────────────────────────
  void _clearValues() {
    _centerNameController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedCategories.clear();
      _selectedLocationId = null;
      _selectedActorId = null;
      // _photos = [];
    });
  }

  // ── Submit ────────────────────────────────────────────────────────────────
  void _post(BuildContext context) {
    if (_centerNameController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a center name');
      return;
    }
    if (_descriptionController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a description');
      return;
    }
    if (_selectedCategories.isEmpty) {
      AppMessenger.showWarning(context, 'Please select at least one category');
      return;
    }
    if (_selectedLocationId == null) {
      AppMessenger.showWarning(context, 'Please select a location');
      return;
    }
    if (_selectedActorId == null) {
      AppMessenger.showWarning(context, 'Please select an actor');
      return;
    }

    // TODO: dispatch post training center event when backend is ready
    AppMessenger.showSuccess(context, 'Training center posted successfully!');
    _clearValues();
  }

  @override
  void dispose() {
    _centerNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.instance<JobsBloc>()..add(const JobFeaturesFetchRequested()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _jobFeatures = state.jobFeatures);
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);
              final isDark = theme.brightness == Brightness.dark;

              return BaseScreen(
                appBar: const TitleHeader(title: 'Post a training center'),
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
                        // ── Center name ──────────────────────────────────
                        const LabelField(label: 'Center name *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _centerNameController,
                          hintText: 'Add job title',
                          maxLines: 3,
                          maxLength: 140,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Images (multi upload) ─────────────────────────
                        const LabelField(label: 'Photo'),
                        const SizedBox(height: Constants.spacingSmall),
                        MultiPhotoUploadWidget(
                          maxPhotos: 5,
                          onPhotosChanged: (photos) {
                            // setState(() => _photos = photos);
                          },
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── More description ──────────────────────────────
                        const LabelField(label: 'More description *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _descriptionController,
                          hintText: 'Add description',
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Category (max 5, checkbox wrap) ───────────────
                        Row(
                          children: [
                            Text(
                              'Category * ',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '(max 5)',
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
                                  _selectedLocationId == location.id;
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
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Actor ────────────────────────────────────────
                        const LabelField(label: 'Actor *'),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.actors.map((actor) {
                              final isSelected = _selectedActorId == actor.id;
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
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(height: Constants.spacingLarge),

                        // ── Post button ───────────────────────────────────
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: isLoading ? null : () => _post(context),
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
