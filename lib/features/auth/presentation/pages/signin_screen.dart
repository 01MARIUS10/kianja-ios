import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/password_input_field.dart';
import 'package:kianja/core/shared/widgets/fields/phone_input_field.dart';
import 'package:kianja/core/shared/widgets/headers/title_header.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:kianja/features/auth/presentation/widgets/forgot_password_bottom_sheet.dart';
import 'package:kianja/routing/routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  String _fullPhone = '';
  // bool _rememberMe = false;
  bool _rememberMe = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    return BlocProvider(
      create: (context) => GetIt.instance<AuthBloc>(),
      child: BaseScreen(
        appBar: const TitleHeader(title: 'Sign In'),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Column(
              children: [
                const SizedBox(height: Constants.spacingMedium),

                Text('Log In', style: theme.textTheme.headlineLarge),

                const SizedBox(height: Constants.spacingSmall),

                Text(
                  'Please sign in to your existing account',
                  style: theme.textTheme.titleMedium,
                ),

                const SizedBox(height: Constants.spacingLarge),

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

                // Password Field
                const LabelField(label: 'PASSWORD'),
                const SizedBox(height: Constants.spacingSmall),
                PasswordInputField(controller: _passwordController),

                const SizedBox(height: Constants.spacingMedium),

                // Remember Me and Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value ?? false;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text('Remember me', style: theme.textTheme.bodyMedium),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor:
                              theme.bottomSheetTheme.backgroundColor,
                          showDragHandle: true,
                          useRootNavigator: true,
                          shape: theme.bottomSheetTheme.shape,
                          builder: (context) =>
                              const ForgotPasswordBottomSheet(),
                        );
                      },
                      child: Text(
                        'Forgot Password',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: isDark
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: Constants.spacingLarge),

                // Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: Constants.size50,
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSignInSuccess) {
                        BlocProvider.of<AppBloc>(context)
                          ..add(const AppAuthenticated(isAuthenticated: true))
                          ..add(const AppUserLoaded());
                        context.goNamed(Routes.account.name);
                      } else if (state is AuthRequestFailure) {
                        AppMessenger.showError(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            (state is AuthRequestInProgress) ||
                                (state is AuthSignInSuccess)
                            ? null
                            : () {
                                BlocProvider.of<AuthBloc>(context).add(
                                  AuthSignInRequested(
                                    phone: _fullPhone,
                                    password: _passwordController.text,
                                    stayLogged: _rememberMe,
                                  ),
                                );
                              },
                        child:
                            (state is AuthRequestInProgress) ||
                                (state is AuthSignInSuccess)
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'LOG IN',
                                style: theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: Constants.spacingLarge),

                // Register Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: theme.textTheme.bodyMedium,
                    ),
                    GestureDetector(
                      // onTap: () => context.push(Routes.signUp),
                      onTap: () => context.pushNamed(Routes.signUp.name),
                      child: Text(
                        'SIGN UP',
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
