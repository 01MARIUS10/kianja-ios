import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/phone_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/residence_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/account/domain/usecases/upate_user_info/update_user_info_params.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/camera_image_picker.dart';
import 'package:kianja/routing/routes.dart';

/// Edit profile screen — mirrors the fields shown in the design mockup.
/// Fields:  First Name · Last Name · Email · Phone · Residence
/// Photo:   tap the avatar badge to pick from gallery or camera.
class UpdatePersonalInfoScreen extends StatefulWidget {
  const UpdatePersonalInfoScreen({super.key});

  @override
  State<UpdatePersonalInfoScreen> createState() =>
      _UpdatePersonalInfoScreenState();
}

class _UpdatePersonalInfoScreenState extends State<UpdatePersonalInfoScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _residenceController = TextEditingController();
  final _pseudoController = TextEditingController();

  File? _pickedImage;

  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;
    // Pre-fill from current user state
    final user = BlocProvider.of<AppBloc>(context).state.user;
    _firstNameController.text = user.firstName;
    _lastNameController.text = user.lastName;
    _emailController.text = user.email;
    _phoneController.text = AppFunction.formatPhoneNumber(user.phone);
    _residenceController.text = user.residence;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _residenceController.dispose();
    _pseudoController.dispose();
    super.dispose();
  }

  // ── Save ──────────────────────────────────────────────────────────
  void _onSave(BuildContext context) {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final residence = _residenceController.text.trim();
    final pseudo = _pseudoController.text.trim();

    if (firstName.isEmpty || lastName.isEmpty) {
      AppMessenger.showError(context, 'First name and last name are required');
      return;
    }
    AppDebug.showPrint('residence: $residence');

    BlocProvider.of<AccountBloc>(context).add(
      AccountUpdateUserInfoRequested(
        updateUserInfoParams: UpdateUserInfoParams(
          firstName: firstName,
          lastName: lastName,
          email: email,
          residence: residence,
          pseudo: pseudo,
          photo: '',
        ),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => GetIt.instance<AccountBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          final user = state.user;
          return BaseScreen(
            appBar: TitleHeader(title: context.appLoc.edit_profile),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                Constants.paddingMedium,
                Constants.spacingMedium,
                Constants.paddingMedium,
                Constants.spacingLarge,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: Constants.spacingMedium),

                  // ── Avatar with camera badge ───────────────────────
                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Avatar circle
                        Container(
                          width: Constants.size100,
                          height: Constants.size100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDark
                                  ? AppColors.darkBorder
                                  : AppColors.lightBorder,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: _pickedImage != null
                                ? Image.file(
                                    _pickedImage!,
                                    fit: BoxFit.cover,
                                    width: Constants.size100,
                                    height: Constants.size100,
                                  )
                                : user.photoUrl.isNotEmpty
                                ? Image.network(
                                    '${EnvConfig.baseApiUrl}${user.photoUrl}',
                                    fit: BoxFit.cover,
                                    width: Constants.size100,
                                    height: Constants.size100,
                                    errorBuilder: (_, _, _) =>
                                        const DefaultAvatar(),
                                  )
                                : const DefaultAvatar(),
                          ),
                        ),

                        // Camera badge
                        CameraImagePicker(
                          onImagePicked: (file) {
                            setState(() {
                              _pickedImage = file;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: Constants.spacingLarge),

                  // ── FIRST NAME ─────────────────────────────────────
                  LabelField(label: context.appLoc.first_name.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  TextInputField(
                    controller: _firstNameController,
                    hintText: 'John',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: Constants.spacingMedium),

                  // ── LAST NAME ──────────────────────────────────────
                  LabelField(label: context.appLoc.last_name.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  TextInputField(
                    controller: _lastNameController,
                    hintText: 'Doe',
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: Constants.spacingMedium),

                  // ── EMAIL ──────────────────────────────────────────
                  LabelField(label: context.appLoc.email.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  TextInputField(
                    controller: _emailController,
                    hintText: 'example@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: Constants.spacingMedium),

                  // ── PHONE ──────────────────────────────────────────
                  LabelField(label: context.appLoc.phone),
                  const SizedBox(height: Constants.spacingSmall),
                  GestureDetector(
                    onTap: () {
                      AppMessenger.showInfo(
                        context,
                        context.appLoc.phone_number_cannot_be_changed,
                      );
                    },
                    child: PhoneInputField(
                      controller: _phoneController,
                      readOnly: true,
                      enabled: false,
                    ),
                  ),
                  const SizedBox(height: Constants.spacingMedium),

                  // ── RESIDENCE ──────────────────────────────────────
                  ResidenceField(residenceController: _residenceController),
                  const SizedBox(height: Constants.spacingLarge),

                  // ── SAVE button ────────────────────────────────────
                  BlocConsumer<AccountBloc, AccountState>(
                    listener: (context, state) {
                      if (state is AccountUpdateUserInfoSuccess) {
                        BlocProvider.of<AppBloc>(
                          context,
                        ).add(AppUserUpdated(user: state.user));
                        AppMessenger.showSuccess(
                          context,
                          'Profile updated successfully',
                        );
                        context.goNamed(Routes.personalInfo.name);
                      } else if (state is AccountRequestFailure) {
                        AppMessenger.showError(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      final isLoading =
                          (state is AccountRequestInProgress) ||
                          (state is AccountUpdateUserInfoSuccess);
                      return SizedBox(
                        height: Constants.size50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : () => _onSave(context),
                          child: isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  context.appLoc.save.toUpperCase(),
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: Constants.spacingLarge),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
