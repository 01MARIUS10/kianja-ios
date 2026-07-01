import 'package:flutter/material.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';

class SessionExpired extends StatelessWidget {
  const SessionExpired({
    super.key,
    required this.onConfirm,
    this.isLoading = false,
  });

  final VoidCallback onConfirm;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Dialog(
      backgroundColor: isDark
          ? AppColors.darkSurface
          : AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
      ),
      insetPadding: const EdgeInsets.all(Constants.paddingMedium),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(Constants.paddingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: Constants.spacingSmall),
            Text(
              'Session expired',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Constants.spacingMedium),
            Text(
              'Your session has expired. Please login again.',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Constants.spacingMedium),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: Constants.size50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : onConfirm,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: AppColors.success,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            Constants.borderRadiusMedium,
                          ),
                        ),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  isDark
                                      ? AppColors.darkPrimary
                                      : AppColors.lightPrimary,
                                ),
                              ),
                            )
                          : Text(
                              context.appLoc.sign_in,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// showDialog(
//   context: context,
//   barrierDismissible: false,
//   builder: (dialogContext) {
//     return BlocProvider.value(
//       value: BlocProvider.of<AppBloc>(context),
//       child: BlocBuilder<AppBloc, AppState>(
//         builder: (context, state) {
//           return SessionExpired(
//             isLoading:
//                 (state.userStatus == AppUserStatus.loading) ||
//                 (state.userStatus == AppUserStatus.deleted),
//             onConfirm: () {

//             },
//           );
//         },
//       ),
//     );
//   },
// );
