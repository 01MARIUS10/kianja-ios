import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/date_field.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/usecases/create_job_offer/create_job_offer_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/multi_photo_upload_widget.dart';
import 'package:kianja/routing/routes.dart';

class PostJobOfferScreen extends StatefulWidget {
  const PostJobOfferScreen({super.key});

  @override
  State<PostJobOfferScreen> createState() => _PostJobOfferScreenState();
}

class _PostJobOfferScreenState extends State<PostJobOfferScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final List<int> _selectedCategories = [];
  final List<int> _selectedLocations = [];
  // int? _selectedLocation;
  int? _selectedGender;
  int? _selectedActor;
  bool _isShowPostButtonActived = false;

  List<XFile> _photos = [];
  JobFeatures? _jobFeatures;

  void _clearValues() {
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    setState(() {
      _selectedCategories.clear();
      _selectedLocations.clear();
      // _selectedLocation = null;
      _selectedGender = null;
      _selectedActor = null;
      _isShowPostButtonActived = false;
      _photos = [];
    });
  }

  void _postJobOffer(BuildContext context) {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _dateController.text.trim().isEmpty ||
        _selectedCategories.isEmpty ||
        _selectedLocations.isEmpty ||
        // _selectedLocation == null ||
        _selectedGender == null ||
        _selectedActor == null) {
      AppMessenger.showWarning(
        context,
        context.appLoc.please_fill_all_required_fields,
      );
      return;
    }
    if (_photos.isNotEmpty) {
      AppDebug.showPrint('Uploading ${_photos.length} photos...');
      BlocProvider.of<JobsBloc>(
        context,
      ).add(JobsUploadMultipleImagesRequested(files: _photos));
    } else {
      _submitJobOffer(context, []);
    }
  }

  void _submitJobOffer(BuildContext context, List<int> imageIds) {
    BlocProvider.of<JobsBloc>(context).add(
      JobsCreateJobOfferRequested(
        createJobOfferParams: CreateJobOfferParams(
          title: _titleController.text.trim(),
          imageIds: imageIds,
          description: _descriptionController.text.trim(),
          categories: _selectedCategories,
          locations: _selectedLocations,
          // location: _selectedLocation!,
          gender: _selectedGender!,
          actor: _selectedActor!,
          showPostButton: _isShowPostButtonActived,
          limitDate: _dateController.text.trim(),
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

  // void _toggleLocation(int locationId) {
  //   setState(() {
  //     if (_selectedLocation == locationId) {
  //       _selectedLocation = null;
  //     } else {
  //       _selectedLocation = locationId;
  //     }
  //   });
  // }

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

  void _toggleShowPostButton(bool value) {
    AppDebug.showPrint('IS ACTIVE : $value');
    setState(() {
      _isShowPostButtonActived = value;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
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
              } else if (state is JobsUploadMultipleImagesSuccess) {
                final imageIds = state.jobImages.map((e) => e.id).toList();
                _submitJobOffer(context, imageIds);
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
                appBar: TitleHeader(title: context.appLoc.post_job_offer),
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

                        LabelField(label: context.appLoc.photo),
                        const SizedBox(height: Constants.spacingSmall),
                        MultiPhotoUploadWidget(
                          maxPhotos: 5,
                          onPhotosChanged: (photos) {
                            setState(() => _photos = photos);
                          },
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        LabelField(label: '${context.appLoc.description} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _descriptionController,
                          hintText: context.appLoc.add_description,
                          maxLines: 10,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

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
                                onTap: () => _toggleCategory(category.id),
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
                        //                   onChanged: (value) =>
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

                        LabelField(label: '${context.appLoc.actor} *'),
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
                          context.appLoc.post_features,
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        Text(
                          '${context.appLoc.applicant_deadline} *',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        DateField(dateController: _dateController),
                        const SizedBox(height: Constants.spacingMedium),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                context.appLoc.enable_apply_button,
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                width: Constants.spacingExtraSmall,
                              ),
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: _isShowPostButtonActived,
                                  onChanged: (value) {
                                    _toggleShowPostButton(value!);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
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
                                    context.appLoc.post.toUpperCase(),
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
