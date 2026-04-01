import 'package:flutter/material.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/auth/presentation/widgets/contact_tile.dart';
import 'package:url_launcher/url_launcher.dart';

enum ContactMethod { phone, email }

class ForgotPasswordBottomSheet extends StatefulWidget {
  const ForgotPasswordBottomSheet({super.key});

  @override
  State<ForgotPasswordBottomSheet> createState() =>
      _ForgotPasswordBottomSheetState();
}

class _ForgotPasswordBottomSheetState extends State<ForgotPasswordBottomSheet> {
  ContactMethod _selectedMethod = ContactMethod.phone;

  static const String _phoneNumber = '+261 38 28 309 29';
  static const String _emailAddress = 'contact@mips.mg';

  Future<void> _handleAction(BuildContext context) async {
    try {
      if (_selectedMethod == ContactMethod.phone) {
        final Uri url = Uri(scheme: 'tel', path: _phoneNumber);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            AppMessenger.showError(context, 'Could not launch phone app');
          }
        }
      } else {
        final Uri url = Uri(
          scheme: 'mailto',
          path: _emailAddress,
          query: 'subject=Forgot Password Request',
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          if (context.mounted) {
            AppMessenger.showError(context, 'Could not launch email app');
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        AppMessenger.showError(context, 'Error launching app: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text('Forgot Password ?', style: theme.textTheme.titleMedium),
          const SizedBox(height: Constants.spacingSmall),

          // Subtitle
          Text(
            'Please contact us via phone or email to help you to reset your password',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: Constants.spacingLarge),

          // Phone Tile
          ContactTile(
            icon: Icons.phone_outlined,
            title: 'Via phone',
            subtitle: _phoneNumber,
            isSelected: _selectedMethod == ContactMethod.phone,
            isDark: isDark,
            theme: theme,
            onTap: () {
              setState(() {
                _selectedMethod = ContactMethod.phone;
              });
            },
          ),
          const SizedBox(height: Constants.spacingMedium),

          // Email Tile
          ContactTile(
            icon: Icons.email_outlined,
            title: 'Via email',
            subtitle: _emailAddress,
            isSelected: _selectedMethod == ContactMethod.email,
            isDark: isDark,
            theme: theme,
            onTap: () {
              setState(() {
                _selectedMethod = ContactMethod.email;
              });
            },
          ),
          const SizedBox(height: Constants.spacingLarge),

          // Action Button
          SizedBox(
            width: double.infinity,
            height: Constants.size50,
            child: ElevatedButton(
              onPressed: () => _handleAction(context),
              child: Text(
                _selectedMethod == ContactMethod.phone ? 'CALL' : 'SEND',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
