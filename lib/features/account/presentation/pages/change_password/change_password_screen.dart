import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/widgets/base_screen/base_screen.dart';
import 'package:kianja/core/shared/widgets/fields/label_field.dart';
import 'package:kianja/core/shared/widgets/fields/password_input_field.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/features/account/presentation/widgets/account_header.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _retypePasswordController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    if (_oldPasswordController.text.isEmpty ||
        _newPasswordController.text.isEmpty ||
        _retypePasswordController.text.isEmpty) {
      AppMessenger.showError(context, 'Please fill all fields');
      return;
    }

    if (_newPasswordController.text != _retypePasswordController.text) {
      AppMessenger.showError(context, 'New passwords do not match');
      return;
    }

    BlocProvider.of<AccountBloc>(context).add(
      AccountChangePasswordRequested(
        oldPassword: _oldPasswordController.text,
        newPassword: _newPasswordController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocProvider(
      create: (context) => GetIt.instance<AccountBloc>(),
      child: BaseScreen(
        appBar: const AccountHeader(title: 'Change Password'),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.paddingMedium),
            child: Column(
              children: [
                const SizedBox(height: Constants.spacingMedium),
                Text(
                  'Create a new secure password',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: Constants.spacingLarge),

                // Old Password Field
                const LabelField(label: 'OLD PASSWORD'),
                const SizedBox(height: Constants.spacingSmall),
                PasswordInputField(controller: _oldPasswordController),
                const SizedBox(height: Constants.paddingMediumLarge),

                // New Password Field
                const LabelField(label: 'NEW PASSWORD'),
                const SizedBox(height: Constants.spacingSmall),
                PasswordInputField(controller: _newPasswordController),
                const SizedBox(height: Constants.paddingMediumLarge),

                // Re-type Password Field
                const LabelField(label: 'RE-TYPE PASSWORD'),
                const SizedBox(height: Constants.spacingSmall),
                PasswordInputField(controller: _retypePasswordController),
                const SizedBox(height: Constants.spacingLarge),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  height: Constants.size50,
                  child: BlocConsumer<AccountBloc, AccountState>(
                    listener: (context, state) {
                      if (state is AccountChangePasswordSuccess) {
                        AppMessenger.showSuccess(context, state.message);
                        if (context.canPop()) {
                          context.pop();
                        }
                      } else if (state is AccountRequestFailure) {
                        AppMessenger.showError(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            (state is AccountRequestInProgress) ||
                                (state is AccountChangePasswordSuccess)
                            ? null
                            : () => _submit(context),
                        child:
                            (state is AccountRequestInProgress) ||
                                (state is AccountChangePasswordSuccess)
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                'UPDATE PASSWORD',
                                style: theme.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    },
                  ),
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
