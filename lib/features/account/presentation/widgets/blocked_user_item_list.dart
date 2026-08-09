import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_messenger.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/features/account/domain/usecases/unblock_user/unblock_user_params.dart';
import 'package:kianja/features/account/presentation/bloc/account_bloc.dart';
import 'package:kianja/routing/routes.dart';

class BlockedUserItemList extends StatelessWidget {
  const BlockedUserItemList({super.key, required this.user, this.onTap});

  final User user;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;
    final textSecondary = isDark
        ? AppColors.darkTextSecondary
        : AppColors.lightTextSecondary;
    final fullName = '${user.firstName} ${user.lastName}'.trim();

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Constants.paddingSmall,
          horizontal: Constants.paddingMedium,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusSmall),
              child: SizedBox(
                width: 80,
                height: 80,
                child: user.photoUrl.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: '${EnvConfig.baseApiUrl}${user.photoUrl}',
                        fit: BoxFit.cover,
                        errorWidget: (_, _, _) =>
                            const DefaultAvatar(size: Constants.size60),
                        progressIndicatorBuilder: (_, _, _) => Container(
                          color: isDark
                              ? AppColors.darkBorder
                              : AppColors.lightBorder,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      )
                    : const DefaultAvatar(size: Constants.size60),
              ),
            ),
            const SizedBox(width: Constants.spacingSmall),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName.toUpperCase(),
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (user.residence.isNotEmpty) ...[
                          const SizedBox(height: Constants.spacingSmall),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: Constants.iconSizeExtraSmall,
                                color: textSecondary,
                              ),
                              const SizedBox(width: 2),
                              Expanded(
                                child: Text(
                                  user.residence,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: textSecondary,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<AccountBloc>(context).add(
                            AccountUnblockUserRequested(
                              unblockUserParams: UnblockUserParams(id: user.id),
                            ),
                          );
                        },
                        child: BlocConsumer<AccountBloc, AccountState>(
                          listener: (context, state) {
                            if (state is AccountUnblockUserSuccess) {
                              context.pushReplacementNamed(Routes.jobs.name);
                              AppMessenger.showSuccess(
                                context,
                                'Utilisateur debloqué avec succès',
                              );
                            } else if (state is AccountRequestFailure) {
                              AppMessenger.showError(context, state.message);
                            }
                          },
                          builder: (context, state) {
                            if (state is AccountRequestInProgress) {
                              return const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                            }
                            return Text(
                              'Debloquer'.toUpperCase(),
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: isDark
                                    ? AppColors.darkTextPrimary
                                    : AppColors.lightTextPrimary,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
