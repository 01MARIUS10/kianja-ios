import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/account/domain/usecases/complaints_suggestions/complaints_suggestions_params.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/multi_photo_upload_widget.dart';
import 'package:kianja/routing/routes.dart';

class ComplaintsSuggestionsScreen extends StatefulWidget {
  const ComplaintsSuggestionsScreen({super.key});

  @override
  State<ComplaintsSuggestionsScreen> createState() =>
      _ComplaintsSuggestionsScreenState();
}

class _ComplaintsSuggestionsScreenState
    extends State<ComplaintsSuggestionsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<XFile> _photos = [];

  void _clearValues() {
    _titleController.clear();
    _descriptionController.clear();
    setState(() {
      _photos = [];
    });
  }

  void _sendComplaintsSuggestions(BuildContext context) {
    if (_titleController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty) {
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
      _submitComplaintsSuggestions(context, []);
    }
  }

  void _submitComplaintsSuggestions(BuildContext context, List<int> imageIds) {
    BlocProvider.of<AccountBloc>(context).add(
      AccountSendComplaintsSuggestionsRequested(
        complaintsSuggestionsParams: ComplaintsSuggestionsParams(
          title: _titleController.text.trim(),
          description: _descriptionController.text.trim(),
          imageIds: imageIds,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetIt.instance<JobsBloc>()),
        BlocProvider(create: (context) => GetIt.instance<AccountBloc>()),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<AccountBloc, AccountState>(
            listener: (context, state) {
              if (state is AccountSendComplaintsSuggestionsSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.complaintsAndSuggestionsSent.name,
                );
              } else if (state is AccountRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            child: BlocConsumer<JobsBloc, JobsState>(
              listener: (context, state) {
                if (state is JobsUploadMultipleImagesSuccess) {
                  final imageIds = state.jobImages.map((e) => e.id).toList();
                  _submitComplaintsSuggestions(context, imageIds);
                } else if (state is JobsRequestFailure) {
                  AppMessenger.showError(context, state.message);
                }
              },
              builder: (context, state) {
                final isLoading = state is JobsRequestInProgress;

                return BaseScreen(
                  appBar: TitleHeader(
                    title: context.appLoc.complaints_and_suggestions,
                  ),
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
                          const LabelField(label: 'Title *'),
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
                            maxPhotos: 3,
                            onPhotosChanged: (photos) {
                              setState(() => _photos = photos);
                            },
                            hintText:
                                'Vous pouvez télécharger jusqu\'à 3 photos',
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

                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: isLoading
                                  ? null
                                  : () => _sendComplaintsSuggestions(context),
                              child: isLoading
                                  ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(
                                      context.appLoc.send.toUpperCase(),
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
            ),
          );
        },
      ),
    );
  }
}
