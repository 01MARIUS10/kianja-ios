import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/date_field.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/password_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/phone_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/text_input_field.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_debug.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kianja/features/auth/presentation/widgets/auth_header.dart';
import 'package:kianja/features/auth/presentation/widgets/gender_field.dart';
import 'package:kianja/features/auth/presentation/widgets/residence_field.dart';
import 'package:kianja/routing/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        appBar: const AuthHeader(title: 'Sign Up'),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Column(
              children: [
                const SizedBox(height: Constants.spacingMedium),
                Text('Sign Up', style: theme.textTheme.headlineLarge),
                const SizedBox(height: Constants.spacingSmall),
                Text(
                  'Please sign up to get started',
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: Constants.spacingLarge),

                // First Name Field
                const LabelField(label: 'FIRST NAME'),
                const SizedBox(height: Constants.spacingSmall),
                TextInputField(
                  controller: _firstNameController,
                  hintText: 'John',
                ),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Last Name Field
                const LabelField(label: 'LAST NAME'),
                const SizedBox(height: Constants.spacingSmall),
                TextInputField(
                  controller: _lastNameController,
                  hintText: 'doe',
                ),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Phone Field
                const LabelField(label: 'PHONE'),
                const SizedBox(height: Constants.spacingSmall),
                PhoneInputField(
                  controller: _phoneController,
                  onChanged: (fullNumber) {
                    _fullPhone = fullNumber;
                  },
                ),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Email Field
                const LabelField(label: 'EMAIL (OPTIONAL)'),
                const SizedBox(height: Constants.spacingSmall),
                TextInputField(
                  controller: _emailController,
                  hintText: 'example@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Birth Date Field
                const LabelField(label: 'BIRTH DATE'),
                const SizedBox(height: Constants.spacingSmall),
                DateField(birthDateController: _birthDateController),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Residence Field
                ResidenceField(residenceController: _residenceController),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Gender Field
                GenderField(genderController: _genderController),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Password Field
                const LabelField(label: 'PASSWORD'),
                const SizedBox(height: Constants.spacingSmall),
                PasswordInputField(controller: _passwordController),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Re-type Password Field
                const LabelField(label: 'RE-TYPE PASSWORD'),
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
                      child: RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium,
                          children: [
                            const TextSpan(text: 'I Agree with '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: isDark
                                    ? AppColors.darkPrimary
                                    : AppColors.lightPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
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
                        BlocProvider.of<AppBloc>(
                          context,
                        ).add(const AppAuthenticated(isAuthenticated: true));
                        context.goNamed(Routes.jobs.name);
                      } else if (state is AuthRequestFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            state is AuthRequestInProgress || !_agreeToTerms
                            ? null
                            : () {
                                AppDebug.showPrint(
                                  'Sign up with phone: $_fullPhone',
                                );
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthSignUpRequested(
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    genre: _genderController.text,
                                    phone: _fullPhone,
                                    birthDate:
                                        int.tryParse(
                                          _birthDateController.text,
                                        ) ??
                                        0,
                                    residence: _residenceController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                        child: state is AuthRequestInProgress
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'SIGN UP',
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
                      'Already have an account? ',
                      style: theme.textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () => context.goNamed(Routes.signIn.name),
                      child: Text(
                        'LOG IN',
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
    );
  }
}
