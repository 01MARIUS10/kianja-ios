import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/phone_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_domain.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/price_plan.dart';
import 'package:kianja/features/jobs/domain/usecases/get_price_plan/get_price_plan_params.dart';
import 'package:kianja/features/jobs/domain/usecases/subscribe_expert_executive/subscribe_expert_executive_params.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/post_features_expert_executive.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_pdf_upload_widget.dart';
import 'package:kianja/features/jobs/presentation/widgets/post/single_photo_upload_widget.dart';
import 'package:kianja/routing/routes.dart';

class SubscribeExpertsExecutivesScreen extends StatefulWidget {
  const SubscribeExpertsExecutivesScreen({super.key});

  @override
  State<SubscribeExpertsExecutivesScreen> createState() =>
      _SubscribeExpertsExecutivesScreenState();
}

class _SubscribeExpertsExecutivesScreenState
    extends State<SubscribeExpertsExecutivesScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _presentationController = TextEditingController();

  // ── Professional domain selections ──────────────────────────────────────
  final List<int> _selectedDomainIds = [];

  // ── Professions from bloc ────────────────────────────────────────────────
  List<JobDomain> _domains = [];
  List<PricePlan> _plans = [];
  PricePlan? _selectedPlan;

  PlatformFile? _resumeFile;

  // ── Upload results ─────────────────────────────────────────────────────
  String? _uploadImageUrl;

  // ── Domain toggles ───────────────────────────────────────────────────────
  void _toggleDomain(int id) {
    setState(() {
      if (_selectedDomainIds.contains(id)) {
        _selectedDomainIds.remove(id);
      } else {
        if (_selectedDomainIds.isEmpty) {
          _selectedDomainIds.add(id);
        }
      }
    });
  }

  // ── Date picker ──────────────────────────────────────────────────────────
  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text = '${picked.toLocal()}'.split(' ')[0];
      });
    }
  }

  // ── Validation & submit ──────────────────────────────────────────────────
  void _subscribe(BuildContext context) {
    // if (_firstNameController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please enter your first name');
    //   return;
    // }
    // if (_lastNameController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please enter your last name');
    //   return;
    // }
    // if (_birthDateController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please select your birth date');
    //   return;
    // }
    // if (_addressController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please enter your address');
    //   return;
    // }
    // if (_phoneController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please enter your phone number');
    //   return;
    // }
    // if (_emailController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please enter your email');
    //   return;
    // }
    // if (_selectedDomainIds.isEmpty) {
    //   AppMessenger.showWarning(
    //     context,
    //     'Please select at least one professional domain',
    //   );
    //   return;
    // }
    // if (_presentationController.text.trim().isEmpty) {
    //   AppMessenger.showWarning(context, 'Please add a brief presentation');
    //   return;
    // }
    // if (_resumeFile == null) {
    //   AppMessenger.showWarning(
    //     context,
    //     'Please upload your resume in PDF format',
    //   );
    //   return;
    // }
    // if (_selectedPlan == null) {
    //   AppMessenger.showWarning(context, 'Please select a subscription plan');
    //   return;
    // }
    if (_firstNameController.text.trim().isEmpty ||
        _lastNameController.text.trim().isEmpty ||
        _birthDateController.text.trim().isEmpty ||
        _addressController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _selectedDomainIds.isEmpty ||
        _presentationController.text.trim().isEmpty ||
        _resumeFile == null ||
        _selectedPlan == null) {
      AppMessenger.showWarning(
        context,
        context.appLoc.please_fill_all_required_fields,
      );
    }

    BlocProvider.of<JobsBloc>(
      context,
    ).add(JobsUploadPdfRequested(file: _resumeFile!));
  }

  void _submitSubscription(BuildContext context, int pdfId) {
    BlocProvider.of<JobsBloc>(context).add(
      SubscribeExpertExecutiveRequested(
        subscribeExpertExecutiveParams: SubscribeExpertExecutiveParams(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          dateOfBirth: _birthDateController.text.trim(),
          email: _emailController.text.trim(),
          phoneNumber: _phoneController.text.trim(),
          address: _addressController.text.trim(),
          photoUrl: _uploadImageUrl,
          biography: _presentationController.text.trim(),
          domainId: _selectedDomainIds.first,
          cvPdfId: pdfId,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _presentationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<JobsBloc>()
        ..add(const JobFeaturesFetchRequested())
        ..add(
          const JobsGetPricePlanRequested(
            getPricePlanParams: GetPricePlanParams(plan: 'expert-cadre'),
          ),
        ),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobFeaturesFetchSuccess) {
                setState(() => _domains = state.jobFeatures.domains);
              } else if (state is JobsGetPricePlanSuccess) {
                setState(() => _plans = state.pricePlans);
              } else if (state is JobsUploadImageSuccess) {
                setState(() => _uploadImageUrl = state.jobImage.url);
              } else if (state is JobsUploadPdfSuccess) {
                _submitSubscription(context, state.jobPdf.id);
              } else if (state is SubscribeExpertExecutiveSuccess) {
                // _clearValues();
                context.pushReplacementNamed(
                  Routes.postExpertExecutive.name,
                  pathParameters: {'id': state.expertExecutive.id.toString()},
                );
              } else if (state is JobsRequestFailure) {
                if (state.message == context.appLoc.unprocessable_entity) {
                  AppMessenger.showError(
                    context,
                    context.appLoc.not_enough_kara_or_email_already_used,
                  );
                } else {
                  AppMessenger.showError(context, state.message);
                }
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);

              return BaseScreen(
                appBar: TitleHeader(
                  title: context.appLoc.subscribe_expert_executive,
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
                        // ── First name ──────────────────────────────────
                        LabelField(label: '${context.appLoc.first_name} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _firstNameController,
                          hintText: context.appLoc.add_first_name,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Last name ───────────────────────────────────
                        LabelField(label: '${context.appLoc.last_name} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _lastNameController,
                          hintText: context.appLoc.add_last_name,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Birth of date ───────────────────────────────
                        LabelField(label: '${context.appLoc.birth_date} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _birthDateController,
                          hintText: context.appLoc.select_date,
                          readOnly: true,
                          onTap: () => _selectBirthDate(context),
                          prefixIcon: const Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.icon,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Address ─────────────────────────────────────
                        LabelField(label: '${context.appLoc.address} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _addressController,
                          hintText: context.appLoc.add_address,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Phone ───────────────────────────────────────
                        LabelField(label: '${context.appLoc.phone} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        PhoneInputField(controller: _phoneController),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Email ───────────────────────────────────────
                        // Row(
                        //   children: [
                        //     Text(
                        //       'Email ',
                        //       style: theme.textTheme.titleSmall?.copyWith(
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //     Text(
                        //       '(optional)',
                        //       style: theme.textTheme.bodyMedium?.copyWith(
                        //         color: isDark
                        //             ? AppColors.darkTextSecondary
                        //             : AppColors.lightTextSecondary,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        LabelField(label: '${context.appLoc.email} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _emailController,
                          hintText: 'jobapplication@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Expertise domain (checkbox wrap, same as
                        //    category in PostJobApplicantScreen) ──────────
                        LabelField(
                          label: '${context.appLoc.expertise_domain} *',
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_domains.isNotEmpty)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _domains.map((profession) {
                              final isSelected = _selectedDomainIds.contains(
                                profession.id,
                              );
                              return InkWell(
                                onTap: () => _toggleDomain(profession.id),
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
                                              _toggleDomain(profession.id),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: Constants.spacingExtraSmall,
                                      ),
                                      Text(
                                        profession.name,
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

                        // ── Brief presentation ──────────────────────────
                        LabelField(
                          label: '${context.appLoc.brief_presentation} *',
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _presentationController,
                          hintText: context.appLoc.add_brief_presentation,
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Photo ───────────────────────────────────
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

                        // ── Resume ───────────────────────────────────────
                        LabelField(label: '${context.appLoc.resume} *'),
                        const SizedBox(height: Constants.spacingSmall),
                        SinglePdfUploadWidget(
                          text: context.appLoc.upload_resume_pdf,
                          onPdfChanged: (pdf) {
                            if (pdf != null) {
                              setState(() {
                                _resumeFile = pdf;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: Constants.spacingLarge),

                        const Divider(),
                        const SizedBox(height: Constants.spacingMedium),

                        PostFeaturesExpertExecutive(
                          plans: _plans,
                          isLoading: isLoading,
                          onPlanSelected: (plan) {
                            _selectedPlan = plan;
                            AppDebug.showPrint('Seleted plan : $plan');
                          },
                          onSubscribe: () => _subscribe(context),
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
