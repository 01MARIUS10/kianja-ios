import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_features.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/usecases/create_training_center/create_training_center_params.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/multi_photo_upload_widget.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_features_training_center.dart';
import 'package:kianja/routing/routes.dart';

class PostTrainingCenterScreen extends StatefulWidget {
  const PostTrainingCenterScreen({super.key});

  @override
  State<PostTrainingCenterScreen> createState() =>
      _PostTrainingCenterScreenState();
}

class _PostTrainingCenterScreenState extends State<PostTrainingCenterScreen> {
  final TextEditingController _centerNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // ── domain (multi-select, max 5) ──────────────────────────────────────
  // final List<int> _selectedDomainIds = [];
  int? _selectedDomainId;

  // ── Single-select IDs ────────────────────────────────────────────────────
  int? _selectedLocationId;
  // int? _selectedActorId;

  // ── Photos ───────────────────────────────────────────────────────────────
  List<XFile> _photos = [];

  // ── Features fetched from bloc ─────────────────────────────────────────
  JobFeatures? _jobFeatures;
  List<PricePlan> _plans = [];

  // ── Selected plan fed back from PostFeaturesSection ────────────────────
  PricePlan? _selectedPlan;

  // ── Toggles ──────────────────────────────────────────────────────────────
  void _toggleDomain(BuildContext context, int domainId) {
    BlocProvider.of<JobsBloc>(context).add(
      JobsGetPricePlanRequested(
        getPricePlanParams: GetPricePlanParams(
          plan: 'training-center',
          id: domainId,
        ),
      ),
    );
    setState(() {
      setState(() {
        if (_selectedDomainId == domainId) {
          _selectedDomainId = null;
        } else {
          _selectedDomainId = domainId;
        }
      });
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

  // void _toggleActor(int actorId) {
  //   setState(() {
  //     if (_selectedActorId == actorId) {
  //       _selectedActorId = null;
  //     } else {
  //       _selectedActorId = actorId;
  //     }
  //   });
  // }

  // ── Clear ─────────────────────────────────────────────────────────────────
  void _clearValues() {
    _centerNameController.clear();
    _descriptionController.clear();
    setState(() {
      _selectedDomainId == null;
      _selectedLocationId = null;
      // _selectedActorId = null;
      _photos = [];
    });
  }

  // ── Submit ────────────────────────────────────────────────────────────────
  void _post(BuildContext context) {
    // if (_centerNameController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please add a center name');
    //   return;
    // }
    // if (_descriptionController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please add a description');
    //   return;
    // }
    // if (_selectedDomainId == null) {
    //   AppMessenger.showWarning(context, 'Please select at least one domain');
    //   return;
    // }
    // if (_selectedLocationId == null) {
    //   AppMessenger.showWarning(context, 'Please select a location');
    //   return;
    // }
    // // if (_selectedActorId == null) {
    // //   AppMessenger.showWarning(context, 'Please select an actor');
    // //   return;
    // // }
    if (_centerNameController.text.trim().isEmpty ||
        _descriptionController.text.trim().isEmpty ||
        _selectedDomainId == null ||
        _selectedLocationId == null) {
      AppMessenger.showWarning(
        context,
        context.appLoc.please_fill_all_required_fields,
      );
    }

    if (_photos.isNotEmpty) {
      AppDebug.showPrint('Uploading ${_photos.length} photos...');
      BlocProvider.of<JobsBloc>(
        context,
      ).add(JobsUploadMultipleImagesRequested(files: _photos));
    } else {
      _submitTrainingCenter(context, []);
    }
  }

  void _submitTrainingCenter(BuildContext context, List<int> imageIds) {
    BlocProvider.of<JobsBloc>(context).add(
      CreateTrainingCenterRequested(
        createtrainingCenterParams: CreateTrainingCenterParams(
          name: _centerNameController.text.trim(),
          description: _descriptionController.text.trim(),
          imageIds: imageIds,
          domainId: _selectedDomainId!,
          locationId: _selectedLocationId!,
          typeId: _selectedPlan!.type.id,
          // tagId: _selectedPlan!.type.id,
          durationId: _selectedPlan!.duration.id,
          status: 'published',
        ),
      ),
    );
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
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(const JobFeaturesFetchRequested())
        ..add(
          const JobsGetPricePlanRequested(
            getPricePlanParams: GetPricePlanParams(plan: 'training-center'),
          ),
        ),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _jobFeatures = state.jobFeatures);
              } else if (state is JobsGetPricePlanSuccess) {
                setState(() => _plans = state.pricePlans);
              } else if (state is JobsUploadMultipleImagesSuccess) {
                final imageIds = state.jobImages.map((e) => e.id).toList();
                _submitTrainingCenter(context, imageIds);
              } else if (state is JobsCreateTrainingCenterSuccess) {
                _clearValues();
                context.pushReplacementNamed(
                  Routes.postTrainingCenterSuccessful.name,
                  pathParameters: {'id': state.trainingCenter.id.toString()},
                );
              } else if (state is JobsRequestFailure) {
                if (state.message == 'Unprocessable entity') {
                  AppMessenger.showError(
                    context,
                    context.appLoc.no_enough_kara,
                  );
                } else {
                  AppMessenger.showError(context, state.message);
                }
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);
              // final isDark = theme.brightness == Brightness.dark;

              return BaseScreen(
                appBar: TitleHeader(title: context.appLoc.post_training_center),
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
                        LabelField(label: '${context.appLoc.center_name} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _centerNameController,
                          hintText: context.appLoc.add_center_name,
                          maxLines: 3,
                          maxLength: 140,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Images (multi upload) ─────────────────────────
                        LabelField(label: context.appLoc.photo),
                        const SizedBox(height: Constants.spacingSmall),
                        MultiPhotoUploadWidget(
                          maxPhotos: 5,
                          onPhotosChanged: (photos) {
                            setState(() => _photos = photos);
                          },
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── More description ──────────────────────────────
                        LabelField(
                          label: '${context.appLoc.more_description} *',
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _descriptionController,
                          hintText: context.appLoc.add_more_description,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Domain (max 5, checkbox wrap) ───────────────
                        Row(
                          children: [
                            Text(
                              '${context.appLoc.domain} * ',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Text(
                            //   '(${context.appLoc.max_5})',
                            //   style: theme.textTheme.bodyMedium?.copyWith(
                            //     fontWeight: FontWeight.bold,
                            //     color: isDark ? Colors.white54 : Colors.black54,
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_jobFeatures != null)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _jobFeatures!.domains.map((domain) {
                              final isSelected = _selectedDomainId == domain.id;
                              return InkWell(
                                onTap: () => _toggleDomain(context, domain.id),
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
                                              _toggleDomain(context, domain.id),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constants.spacingExtraSmall,
                                      ),
                                      Text(
                                        domain.name,
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          )
                        // Wrap(
                        //   spacing: Constants.spacingMedium,
                        //   children: _jobFeatures!.domains.map((domain) {
                        //     final isSelected = _selectedDomainId.contains(
                        //       domain.id,
                        //     );
                        //     return InkWell(
                        //       onTap: () => _toggleDomain(domain.id),
                        //       borderRadius: BorderRadius.circular(4),
                        //       child: Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //           vertical: 6,
                        //         ),
                        //         child: Row(
                        //           mainAxisSize: MainAxisSize.min,
                        //           children: [
                        //             SizedBox(
                        //               width: 24,
                        //               height: 24,
                        //               child: Checkbox(
                        //                 value: isSelected,
                        //                 onChanged: (_) =>
                        //                     _toggleDomain(domain.id),
                        //               ),
                        //             ),
                        //             const SizedBox(
                        //               width: Constants.spacingExtraSmall,
                        //             ),
                        //             Text(
                        //               domain.name,
                        //               style: theme.textTheme.bodyMedium,
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     );
                        //   }).toList(),
                        // )
                        else
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: CircularProgressIndicator(),
                          ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Location ─────────────────────────────────────
                        LabelField(label: '${context.appLoc.location} *'),
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

                        // // ── Actor ────────────────────────────────────────
                        // LabelField(
                        //   label: '${context.appLoc.about_center_publisher} *',
                        // ),
                        // const SizedBox(height: Constants.spacingSmall),
                        // if (_jobFeatures != null)
                        //   Wrap(
                        //     spacing: Constants.spacingMedium,
                        //     children: _jobFeatures!.actors.map((actor) {
                        //       final isSelected = _selectedActorId == actor.id;
                        //       return InkWell(
                        //         onTap: () => _toggleActor(actor.id),
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
                        //                       _toggleActor(actor.id),
                        //                 ),
                        //               ),
                        //               const SizedBox(
                        //                 width: Constants.spacingExtraSmall,
                        //               ),
                        //               Text(
                        //                 actor.name,
                        //                 style: theme.textTheme.bodyMedium,
                        //               ),
                        //             ],
                        //           ),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   )
                        // else
                        //   const Padding(
                        //     padding: EdgeInsets.symmetric(vertical: 8.0),
                        //     child: CircularProgressIndicator(),
                        //   ),
                        // const SizedBox(height: Constants.spacingLarge),

                        // ── Post Features Section ────────────────────────
                        PostFeaturesTrainingCenter(
                          plans: _plans,
                          isLoading: isLoading,
                          onPlanSelected: (plan) {
                            _selectedPlan = plan;
                          },
                          onPost: isLoading ? null : () => _post(context),
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
