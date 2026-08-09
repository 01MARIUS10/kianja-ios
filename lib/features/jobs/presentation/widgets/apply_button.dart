import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/shared/app_feature/bloc/app/app_bloc.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/features/jobs/presentation/bloc/apply_to_offer/apply_to_offer_bloc.dart';
import 'package:kianja/routing/routes.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key, required this.jobId});
  final int jobId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => GetIt.instance<ApplyToOfferBloc>(),
      child: Builder(
        builder: (context) {
          return BlocBuilder<AppBloc, AppState>(
            builder: (context, appState) {
              return ElevatedButton(
                onPressed: appState.isAuthenticated
                    ? () {
                        BlocProvider.of<ApplyToOfferBloc>(
                          context,
                        ).add(ApplyToOfferStarted(id: jobId));
                      }
                    : () {
                        context.goNamed(Routes.signIn.name);
                      },
                child: BlocConsumer<ApplyToOfferBloc, ApplyToOfferState>(
                  listener: (context, state) {
                    if (state is ApplyToOfferFailure) {
                      AppMessenger.showError(context, state.error);
                    }
                    if (state is ApplyToOfferSuccess) {
                      // AppMessenger.showSuccess(context, state.message);
                      context.pushNamed(
                        Routes.appliedJobOfferSuccessful.name,
                        pathParameters: {
                          'id': jobId.toString(),
                          'matchedLocation': GoRouterState.of(
                            context,
                          ).matchedLocation,
                        },
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ApplyToOfferInProgress) {
                      return const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      );
                    }
                    return Text(
                      context.appLoc.apply_to.toUpperCase(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
