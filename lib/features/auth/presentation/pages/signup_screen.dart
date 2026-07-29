import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/birth_date_field.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/password_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/phone_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/residence_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/auth/domain/usecases/signup/signup_params.dart';
import 'package:kianja/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kianja/features/auth/presentation/widgets/gender_field.dart';
import 'package:kianja/routing/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _residenceController = TextEditingController();
  final _genderController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  String _fullPhone = '';
  bool _agreeToTerms = false;

  late final List<String> _genders = [
    context.appLoc.male,
    context.appLoc.female,
  ];
  final List<String> _genderValues = ['Male', 'Female'];

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _birthDateController.dispose();
    _residenceController.dispose();
    _genderController.dispose();
    _passwordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = Brightness.dark == theme.brightness;

    return BlocProvider(
      create: (context) => GetIt.instance<AuthBloc>(),
      child: BaseScreen(
        appBar: TitleHeader(title: context.appLoc.sign_up),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: Constants.spacingMedium),
                  Text(
                    context.appLoc.sign_up,
                    style: theme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  Text(
                    context.appLoc.please_sign_in_to_start,
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: Constants.spacingLarge),

                  // First Name Field
                  LabelField(label: context.appLoc.first_name.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  TextInputField(
                    controller: _firstNameController,
                    hintText: 'John',
                  ),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Last Name Field
                  LabelField(label: context.appLoc.last_name.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  TextInputField(
                    controller: _lastNameController,
                    hintText: 'doe',
                  ),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Phone Field
                  LabelField(label: context.appLoc.phone.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  PhoneInputField(
                    controller: _phoneController,
                    onChanged: (fullNumber) {
                      _fullPhone = fullNumber;
                    },
                  ),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Email Field
                  LabelField(
                    label: context.appLoc.email_optional.toUpperCase(),
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  TextInputField(
                    controller: _emailController,
                    hintText: 'example@gmail.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Birth Date Field
                  BirthDateField(birthDateController: _birthDateController),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Residence Field
                  ResidenceField(residenceController: _residenceController),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Gender Field
                  GenderField(genderController: _genderController),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Password Field
                  LabelField(label: context.appLoc.password.toUpperCase()),
                  const SizedBox(height: Constants.spacingSmall),
                  PasswordInputField(controller: _passwordController),
                  const SizedBox(height: Constants.paddingMediumLarge),

                  // Re-type Password Field
                  LabelField(
                    label: context.appLoc.retype_password.toUpperCase(),
                  ),
                  const SizedBox(height: Constants.spacingSmall),
                  PasswordInputField(controller: _retypePasswordController),
                  const SizedBox(height: Constants.spacingLarge),

                  // Terms and Conditions
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: InkWell(
                          onTap: () =>
                              context.pushNamed(Routes.termsOfUse.name),
                          child: RichText(
                            text: TextSpan(
                              style: theme.textTheme.bodyMedium,
                              children: [
                                TextSpan(text: context.appLoc.agree_with),
                                TextSpan(
                                  text: ' ${context.appLoc.terms_use}',
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: isDark
                                        ? AppColors.darkPrimary
                                        : AppColors.lightPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Constants.spacingLarge),

                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    height: Constants.size50,
                    child: BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is AuthSignUpSuccess) {
                          BlocProvider.of<AppBloc>(context)
                            ..add(
                              const AppAuthenticated(
                                isAuthenticated: true,
                                token: '',
                              ),
                            )
                            ..add(const AppUserLoaded());
                          context.goNamed(Routes.account.name);
                        } else if (state is AuthRequestFailure) {
                          if (state.message.contains('Unprocessable entity')) {
                            AppMessenger.showInfo(
                              context,
                              context.appLoc.phone_already_exists,
                            );
                          } else {
                            AppMessenger.showError(context, state.message);
                          }
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed:
                              (state is AuthRequestInProgress) ||
                                  (state is AuthSignUpSuccess) ||
                                  !_agreeToTerms
                              ? null
                              : () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }
                                  AppDebug.showPrint(
                                    'Sign up with phone: $_fullPhone',
                                  );
                                  AppDebug.showPrint(
                                    'firstname: ${_firstNameController.text}',
                                  );
                                  AppDebug.showPrint(
                                    'lastname: ${_lastNameController.text}',
                                  );
                                  AppDebug.showPrint(
                                    'genre: ${_genderController.text}',
                                  );
                                  AppDebug.showPrint(
                                    'birthDate: ${_birthDateController.text.split('-').first}',
                                  );
                                  AppDebug.showPrint(
                                    'residence: ${_residenceController.text}',
                                  );
                                  AppDebug.showPrint(
                                    'email: ${_emailController.text}',
                                  );
                                  AppDebug.showPrint(
                                    'password: ${_passwordController.text}',
                                  );
                                  BlocProvider.of<AuthBloc>(context).add(
                                    AuthSignUpRequested(
                                      signUpParams: SignUpParams(
                                        firstName: _firstNameController.text,
                                        lastName: _lastNameController.text,
                                        genre:
                                            _genderValues[_genders.indexOf(
                                              _genderController.text,
                                            )],
                                        phone: _fullPhone,
                                        birthDate:
                                            int.tryParse(
                                              _birthDateController.text
                                                  .split('-')
                                                  .first,
                                            ) ??
                                            0,
                                        residence: _residenceController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      ),
                                    ),
                                  );
                                },
                          child:
                              (state is AuthRequestInProgress) ||
                                  (state is AuthSignUpSuccess)
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  context.appLoc.sign_up.toUpperCase(),
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: Constants.spacingLarge),

                  // Already have an account link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${context.appLoc.already_have_account} ',
                        style: theme.textTheme.bodyMedium,
                      ),
                      GestureDetector(
                        onTap: () => context.goNamed(Routes.signIn.name),
                        child: Text(
                          context.appLoc.login.toUpperCase(),
                          style: theme.textTheme.bodyMedium!.copyWith(
                            color: isDark
                                ? AppColors.darkPrimary
                                : AppColors.lightPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: Constants.spacingLarge),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
