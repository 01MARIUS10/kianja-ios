import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/shared/widgets/loading/shimmer_job_detail_indicator.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/usecases/get_training_center_detail_usecase.dart';
import 'package:kianja/features/jobs/domain/entities/training/training_center.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/multi_photo_upload_widget.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_training_center/update_training_center_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';

class MyPostTrainingCenterEditScreen extends StatefulWidget {
  const MyPostTrainingCenterEditScreen({
    super.key,
    required this.trainingCenterId,
    this.initialTrainingCenter,
  });

  final int trainingCenterId;
  final TrainingCenter? initialTrainingCenter;

  @override
  State<MyPostTrainingCenterEditScreen> createState() =>
      _MyPostTrainingCenterEditScreenState();
}

class _MyPostTrainingCenterEditScreenState
    extends State<MyPostTrainingCenterEditScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  int? _selectedLocationId;
  int? _selectedActorId;

  JobFeatures? _jobFeatures;
  bool _isFormReady = false;

  // Existing images (from entity detail)
  final List<int> _existingImageIds = [];
  final List<String> _existingImageUrls = [];

  // New images (picked locally, will be uploaded to get ids)
  List<XFile> _newPhotos = [];
  bool _isUploadingImages = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialTrainingCenter != null) {
      _populateForm(widget.initialTrainingCenter!);
    }
  }

  void _populateForm(TrainingCenter trainingCenter) {
    _nameController.text = trainingCenter.name;
    _descriptionController.text = trainingCenter.description;
    _selectedLocationId = trainingCenter.location?.id;
    _selectedActorId = trainingCenter.actor?.id;

    _existingImageIds
      ..clear()
      ..addAll(trainingCenter.images.map((e) => e.id).where((id) => id > 0));
    _existingImageUrls
      ..clear()
      ..addAll(
        trainingCenter.images
            .map((e) => e.url)
            .where((url) => url.isNotEmpty),
      );

    // Some training centers may only have a single cover `imageUrl`.
    final cover = trainingCenter.imageUrl;
    if ((cover ?? '').isNotEmpty && !_existingImageUrls.contains(cover)) {
      _existingImageUrls.add(cover!);
    }

    _checkFormReady();
  }

  void _checkFormReady() {
    final hasBasics =
        _nameController.text.trim().isNotEmpty &&
        _descriptionController.text.trim().isNotEmpty;
    final hasSelections = _selectedLocationId != null && _selectedActorId != null;
    final hasAnyImage = _existingImageIds.isNotEmpty || _newPhotos.isNotEmpty;

    setState(() {
      _isFormReady = hasBasics && hasSelections && hasAnyImage;
    });
  }

  void _toggleLocation(int locationId) {
    setState(() {
      _selectedLocationId = _selectedLocationId == locationId ? null : locationId;
    });
    _checkFormReady();
  }

  void _toggleActor(int actorId) {
    setState(() {
      _selectedActorId = _selectedActorId == actorId ? null : actorId;
    });
    _checkFormReady();
  }

  void _removeExistingImageAt(int index) {
    setState(() {
      if (index < _existingImageIds.length) {
        _existingImageIds.removeAt(index);
      }
      if (index < _existingImageUrls.length) {
        _existingImageUrls.removeAt(index);
      }
    });
    _checkFormReady();
  }

  void _updateTrainingCenter(BuildContext context) {
    if (_nameController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a center name');
      return;
    }
    if (_descriptionController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a description');
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
    if (_existingImageIds.isEmpty && _newPhotos.isEmpty) {
      AppMessenger.showWarning(context, 'Please keep or upload at least 1 photo');
      return;
    }

    if (_newPhotos.isNotEmpty) {
      setState(() => _isUploadingImages = true);
      BlocProvider.of<JobsBloc>(
        context,
      ).add(JobsUploadMultipleImagesRequested(files: _newPhotos));
      return;
    }

    _submitUpdate(context, _existingImageIds);
  }

  void _submitUpdate(BuildContext context, List<int> imageIds) {
    BlocProvider.of<MyPostBloc>(context).add(
      MyPostUpdateTrainingCenterRequested(
        updateTrainingCenterParams: UpdateTrainingCenterParams(
          id: widget.trainingCenterId,
          name: _nameController.text.trim(),
          description: _descriptionController.text.trim(),
          imageIds: imageIds,
          actorId: _selectedActorId!,
          locationId: _selectedLocationId!,
          typeId: 1,
          tagId: 1,
          durationId: 1,
          status: 'published',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
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
            ..add(
              GetTrainingCenterDetailRequested(
                trainingCenterDetailParams: TrainingCenterDetailParams(
                  id: widget.trainingCenterId,
                ),
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
              } else if (state is GetTrainingCenterDetailSuccess) {
                _populateForm(state.trainingCenter);
              } else if (state is JobsUploadMultipleImagesSuccess) {
                final uploadedIds = state.jobImages.map((e) => e.id).toList();
                final merged = <int>[
                  ..._existingImageIds,
                  ...uploadedIds.where((id) => id > 0),
                ];

                setState(() {
                  _isUploadingImages = false;
                  _newPhotos = [];
                });
                _checkFormReady();
                _submitUpdate(context, merged);
              } else if (state is JobsRequestFailure) {
                setState(() => _isUploadingImages = false);
                AppMessenger.showError(context, state.message);
              }
            },
          ),
          BlocListener<MyPostBloc, MyPostState>(
            listener: (context, state) {
              if (state is MyPostUpdateTrainingCenterSuccess) {
                AppMessenger.showSuccess(
                  context,
                  'Training center updated successfully',
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
                (jobsState is JobsRequestInProgress || jobsState is JobsInitial);

            if (isJobsLoading) {
              return const BaseScreen(
                appBar: TitleHeader(title: 'Edit training center'),
                child: ShimmerJobDetailIndicator(),
              );
            }

            return BlocBuilder<MyPostBloc, MyPostState>(
              builder: (context, myPostState) {
                final isSaving = myPostState is MyPostRequestInProgress;
                final isBusy = isSaving || _isUploadingImages;

                return BaseScreen(
                  appBar: const TitleHeader(title: 'Edit training center'),
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
                          const LabelField(label: 'Center name *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _nameController,
                            hintText: 'Add center name',
                            maxLines: 3,
                            maxLength: 140,
                            onChanged: (_) => _checkFormReady(),
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          const LabelField(label: 'Photos *'),
                          const SizedBox(height: Constants.spacingSmall),
                          if (_existingImageUrls.isNotEmpty) ...[
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int i = 0;
                                      i < _existingImageUrls.length;
                                      i++)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: Constants.spacingSmall,
                                      ),
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              Constants.borderRadiusSmall,
                                            ),
                                            child: SizedBox(
                                              width: 80,
                                              height: 80,
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    '${EnvConfig.baseApiUrl}${_existingImageUrls[i]}',
                                                fit: BoxFit.cover,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Image.asset(
                                                  Assets.hiring,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: -8,
                                            right: -8,
                                            child: InkWell(
                                              onTap: isBusy
                                                  ? null
                                                  : () => _removeExistingImageAt(
                                                        i,
                                                      ),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: BoxDecoration(
                                                  color:
                                                      theme.colorScheme.error,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: theme
                                                        .scaffoldBackgroundColor,
                                                    width: 2,
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 14,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: Constants.spacingMedium),
                          ],
                          MultiPhotoUploadWidget(
                            maxPhotos: 5,
                            onPhotosChanged: (photos) {
                              setState(() => _newPhotos = photos);
                              _checkFormReady();
                            },
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          const LabelField(label: 'Description *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _descriptionController,
                            hintText: 'Add description',
                            maxLines: 8,
                            keyboardType: TextInputType.multiline,
                            onChanged: (_) => _checkFormReady(),
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          const LabelField(label: 'Location *'),
                          const SizedBox(height: Constants.spacingSmall),
                          if (_jobFeatures != null)
                            Wrap(
                              spacing: Constants.spacingMedium,
                              children: _jobFeatures!.locations.map((location) {
                                final isSelected =
                                    _selectedLocationId == location.id;
                                return InkWell(
                                  onTap: isBusy
                                      ? null
                                      : () => _toggleLocation(location.id),
                                  borderRadius: BorderRadius.circular(4),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Checkbox(
                                            value: isSelected,
                                            onChanged: isBusy
                                                ? null
                                                : (_) => _toggleLocation(
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

                          const LabelField(label: 'Actor *'),
                          const SizedBox(height: Constants.spacingSmall),
                          if (_jobFeatures != null)
                            Wrap(
                              spacing: Constants.spacingMedium,
                              children: _jobFeatures!.actors.map((actor) {
                                final isSelected = _selectedActorId == actor.id;
                                return InkWell(
                                  onTap: isBusy
                                      ? null
                                      : () => _toggleActor(actor.id),
                                  borderRadius: BorderRadius.circular(4),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 24,
                                          height: 24,
                                          child: Checkbox(
                                            value: isSelected,
                                            onChanged: isBusy
                                                ? null
                                                : (_) => _toggleActor(actor.id),
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
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: CircularProgressIndicator(),
                            ),

                          const SizedBox(height: Constants.spacingLarge),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: (!_isFormReady || isBusy)
                                  ? null
                                  : () => _updateTrainingCenter(context),
                              child: isBusy
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

