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
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/usecases/create_hot_event/create_hot_event_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/routing/routes.dart';

class CreateHotEventScreen extends StatefulWidget {
  const CreateHotEventScreen({
    super.key,
    required this.trainingCenterId,
    required this.type,
  });
  final int trainingCenterId;
  final String type;

  @override
  State<CreateHotEventScreen> createState() => _CreateHotEventScreenState();
}

class _CreateHotEventScreenState extends State<CreateHotEventScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  int? _uploadImageId;

  void _clearValues() {
    _titleController.clear();
    _descriptionController.clear();
    _startDateController.clear();
    _endDateController.clear();
    setState(() {
      _uploadImageId = null;
    });
  }

  void _postJobOffer(BuildContext context) {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _startDateController.text.trim().isEmpty ||
        _endDateController.text.trim().isEmpty) {
      AppMessenger.showWarning(
        context,
        'Please fill all required fields and upload a photo',
      );
      return;
    }
    AppDebug.showPrint('title ${_titleController.text.trim()}');
    AppDebug.showPrint('description ${_descriptionController.text.trim()}');
    AppDebug.showPrint('start date ${_startDateController.text.trim()}');
    AppDebug.showPrint('end date ${_endDateController.text.trim()}');
    AppDebug.showPrint('imageUrl $_uploadImageId');
    BlocProvider.of<JobsBloc>(context).add(
      CreateHotEventRequested(
        createHotEventParams: CreateHotEventParams(
          id: -1,
          trainingCenterId: widget.trainingCenterId,
          type: widget.type.toLowerCase(),
          title: _titleController.text.trim(),
          imageId: _uploadImageId,
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

    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>(),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobsUploadImageSuccess) {
                setState(() {
                  _uploadImageId = state.jobImage.id;
                });
                AppMessenger.showSuccess(
                  context,
                  'Photo uploaded successfully',
                );
              } else if (state is CreateHotEventSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.createHotEventSuccessful.name,
                  pathParameters: {
                    'trainingCenterId': widget.trainingCenterId.toString(),
                    'id': state.hotEvent.id.toString(),
                  },
                );
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;

              return BaseScreen(
                appBar: widget.type == context.appLoc.hot
                    ? TitleHeader(title: context.appLoc.post_hot)
                    : TitleHeader(title: context.appLoc.post_event),
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
                          onPhotoChanged: (photo) {
                            if (photo != null) {
                              BlocProvider.of<JobsBloc>(
                                context,
                              ).add(JobsUploadImageRequested(file: photo));
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
