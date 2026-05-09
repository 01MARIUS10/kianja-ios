import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/phone_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/jobs/domain/entities/jobs/jobs_features/job_category.dart';
import 'package:kianja/features/jobs/presentation/bloc/jobs_bloc.dart';

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
  List<JobCategory> _professions = [];

  // ── Domain toggles ───────────────────────────────────────────────────────
  void _toggleDomain(int id) {
    setState(() {
      if (_selectedDomainIds.contains(id)) {
        _selectedDomainIds.remove(id);
      } else {
        _selectedDomainIds.add(id);
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
    if (_firstNameController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please enter your first name');
      return;
    }
    if (_lastNameController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please enter your last name');
      return;
    }
    if (_birthDateController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please select your birth date');
      return;
    }
    if (_addressController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please enter your address');
      return;
    }
    if (_selectedDomainIds.isEmpty) {
      AppMessenger.showWarning(
        context,
        'Please select at least one professional domain',
      );
      return;
    }
    if (_presentationController.text.trim().isEmpty) {
      AppMessenger.showWarning(context, 'Please add a brief presentation');
      return;
    }

    // TODO: dispatch subscription event when backend is ready
    AppMessenger.showSuccess(context, 'Subscription submitted successfully!');
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
        ..add(const JobApplicantProfessionsFetchRequested()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<JobsBloc, JobsState>(
            listener: (context, state) {
              if (state is JobApplicantProfessionsFetchSuccess) {
                setState(() => _professions = state.jobCategories);
              } else if (state is JobsRequestFailure) {
                AppMessenger.showError(context, state.message);
              }
            },
            builder: (context, state) {
              final isLoading = state is JobsRequestInProgress;
              final theme = Theme.of(context);
              final isDark = theme.brightness == Brightness.dark;

              return BaseScreen(
                appBar: const TitleHeader(
                  title: 'Subscribe to Expert & Executive',
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
                        const LabelField(label: 'First name *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _firstNameController,
                          hintText: 'Add your first name',
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Last name ───────────────────────────────────
                        const LabelField(label: 'Last name *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _lastNameController,
                          hintText: 'Add your last name',
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Birth of date ───────────────────────────────
                        const LabelField(label: 'Birth of date *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _birthDateController,
                          hintText: 'Select date',
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
                        const LabelField(label: 'Address *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _addressController,
                          hintText: 'Add your address',
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Phone ───────────────────────────────────────
                        const LabelField(label: 'Phone'),
                        const SizedBox(height: Constants.spacingSmall),
                        PhoneInputField(controller: _phoneController),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Email ───────────────────────────────────────
                        Row(
                          children: [
                            Text(
                              'Email ',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '(optional)',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: isDark
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _emailController,
                          hintText: 'jobapplication@gmail.com',
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Professional domain (checkbox wrap, same as
                        //    category in PostJobApplicantScreen) ──────────
                        const LabelField(label: 'Professional domain *'),
                        const SizedBox(height: Constants.spacingSmall),
                        if (_professions.isNotEmpty)
                          Wrap(
                            spacing: Constants.spacingMedium,
                            children: _professions.map((profession) {
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
                        const LabelField(label: 'Brief presentation *'),
                        const SizedBox(height: Constants.spacingSmall),
                        TextInputField(
                          controller: _presentationController,
                          hintText: 'Add a brief presentation',
                          maxLines: 5,
                          keyboardType: TextInputType.multiline,
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Note info box ───────────────────────────────
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(Constants.paddingMedium),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.darkBrandTint
                                : AppColors.lightBrandTint,
                            borderRadius: BorderRadius.circular(
                              Constants.borderRadiusSmall,
                            ),
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: isDark
                                    ? AppColors.darkTextSecondary
                                    : AppColors.lightTextSecondary,
                              ),
                              children: [
                                const TextSpan(
                                  text:
                                      'Please send your CV, photo and other documents to ',
                                ),
                                TextSpan(
                                  text: 'contact@mips.mg',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: isDark
                                        ? AppColors.darkTextPrimary
                                        : AppColors.lightTextPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: Constants.spacingLarge),
                        const Divider(),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Subscription needs (static) ─────────────────
                        Text(
                          'Subscription needs',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: Constants.spacingSmall),
                        Row(
                          children: [
                            Text(
                              'KARA : ',
                              style: theme.textTheme.bodyMedium,
                            ),
                            Image.asset(
                              Assets.kara,
                              height: 20,
                              width: 20,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: Constants.spacingExtraSmall),
                            Text(
                              '250 000',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: Constants.spacingMedium),

                        // ── Subscribe button ────────────────────────────
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () => _subscribe(context),
                            child: isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                    ),
                                  )
                                : Text(
                                    'Subscribe',
                                    style: theme.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
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
