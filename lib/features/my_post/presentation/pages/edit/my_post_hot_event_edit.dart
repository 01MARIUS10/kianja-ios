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
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/training/hot_event.dart';
import 'package:kianja/features/jobs/domain/usecases/get_hot_event_detail/get_hot_event_detail_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/features/my_post/domain/usecases/update/update_hot_event/update_hot_event_params.dart';
import 'package:kianja/features/my_post/presentation/bloc/my_post_bloc.dart';

class MyPostHotEventEditScreen extends StatefulWidget {
  const MyPostHotEventEditScreen({
    super.key,
    required this.hotEventId,
    required this.type,
    this.initialHotEvent,
  });

  final int hotEventId;
  final String type;
  final HotEvent? initialHotEvent;

  @override
  State<MyPostHotEventEditScreen> createState() =>
      _MyPostHotEventEditScreenState();
}

class _MyPostHotEventEditScreenState extends State<MyPostHotEventEditScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  int? _uploadImageId;
  int _existingImageId = -1;
  String? _initialImageUrl;
  bool _isFormReady = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialHotEvent != null) {
      _populateForm(widget.initialHotEvent!);
      _isFormReady = true;
    }
  }

  void _populateForm(HotEvent hotEvent) {
    _titleController.text = hotEvent.title;
    _descriptionController.text = hotEvent.description;
    _startDateController.text = _formatDateLimit(hotEvent.startDate);
    _endDateController.text = _formatDateLimit(hotEvent.endDate);
    _existingImageId = hotEvent.image?.id ?? -1;
    _initialImageUrl = hotEvent.image?.url;
  }

  String _formatDateLimit(String dateLimit) {
    if (dateLimit.isEmpty) return '';
    return dateLimit.split('T').first.split(' ').first;
  }

  int? get _resolvedImageId {
    final imageId = _uploadImageId ?? _existingImageId;
    return imageId > 0 ? imageId : null;
  }

  void _updateHotEvent(BuildContext context) {
    AppDebug.showPrint(
      'Updating job offer with title: ${_titleController.text}',
    );
    AppDebug.showPrint(
      'Updating job offer with description: ${_descriptionController.text}',
    );
    AppDebug.showPrint('Updating job offer with image : $_resolvedImageId');

    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _startDateController.text.trim().isEmpty ||
        _endDateController.text.trim().isEmpty ||
        _resolvedImageId == null) {
      AppMessenger.showWarning(
        context,
        'Please fill all required fields and keep or upload a photo',
      );
      return;
    }

    BlocProvider.of<MyPostBloc>(context).add(
      MyPostUpdateHotEventRequested(
        updateHotEventParams: UpdateHotEventParams(
          trainingCenterId: -1,
          id: widget.hotEventId,
          type: widget.type,
          title: _titleController.text.trim(),
          imageId: _resolvedImageId!,
          description: _descriptionController.text.trim(),
          startDate: _startDateController.text.trim(),
          endDate: _endDateController.text.trim(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
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
            ..add(
              GetHotEventDetailRequested(
                getHotEventDetailParams: GetHotEventDetailParams(
                  query: widget.type == 'hot' ? '/hots' : '/events',
                  id: widget.hotEventId,
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
              if (state is GetHotEventDetailSuccess) {
                setState(() {
                  _populateForm(state.hotEvent);
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
              if (state is MyPostUpdateHotEventSuccess) {
                AppMessenger.showSuccess(
                  context,
                  'Job offer updated successfully',
                );
                context.pop(state.hotEvent);
              } else if (state is MyPostRequestFailure) {
                if (state.message.contains('Unprocessable entity')) {
                  AppMessenger.showWarning(
                    context,
                    "La date limite doit être aujourd'hui ou une date future.",
                  );
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
                appBar: TitleHeader(title: context.appLoc.edit_offer),
                child: const ShimmerJobDetailIndicator(),
              );
            }

            return BlocBuilder<MyPostBloc, MyPostState>(
              builder: (context, myPostState) {
                final isSaving = myPostState is MyPostRequestInProgress;

                return BaseScreen(
                  appBar: TitleHeader(title: context.appLoc.edit_offer),
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
                          LabelField(label: '${context.appLoc.title} *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _titleController,
                            hintText: context.appLoc.add_title,
                            maxLines: 3,
                            maxLength: 130,
                          ),
                          const SizedBox(height: Constants.spacingMedium),
                          LabelField(label: context.appLoc.photo),
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
                          LabelField(label: '${context.appLoc.description} *'),
                          const SizedBox(height: Constants.spacingSmall),
                          TextInputField(
                            controller: _descriptionController,
                            hintText: context.appLoc.add_description,
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                          ),
                          const SizedBox(height: Constants.spacingMedium),

                          Text(
                            '${context.appLoc.start_offer} *',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          DateField(dateController: _startDateController),
                          const SizedBox(height: Constants.spacingMedium),

                          Text(
                            '${context.appLoc.end_offer} *',
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: Constants.spacingSmall),
                          DateField(dateController: _endDateController),
                          const SizedBox(height: Constants.spacingMedium),

                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: isSaving
                                  ? null
                                  : () => _updateHotEvent(context),
                              child: isSaving
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      context.appLoc.save.toUpperCase(),
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
