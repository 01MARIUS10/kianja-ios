import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/config/env_config.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/app_function.dart';
import 'package:kianja/core/utils/constants.dart';
import 'package:kianja/core/utils/extensions.dart';
import 'package:kianja/routing/routes.dart';

class CandidateItemList extends StatelessWidget {
  const CandidateItemList({super.key, required this.user, this.onTap});

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
                width: 120,
                height: 120,
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
                height: 120,
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
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '• ${AppFunction.dateTimeCounter(user.dateCandidature, context)}',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (user.cvUrl.isNotEmpty)
                          InkWell(
                            onTap: () {
                              context.pushNamed(
                                Routes.viewCandidatePdf.name,
                                extra: {
                                  'pdfUrl':
                                      '${EnvConfig.baseApiUrl}${user.cvUrl}',
                                },
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${context.appLoc.view} ${context.appLoc.resume}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: AppColors.info,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  width: Constants.spacingExtraSmall,
                                ),
                                Image.asset(
                                  Assets.pdf,
                                  height: Constants.iconSizeExtraSmall,
                                ),
                              ],
                            ),
                          ),
                      ],
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
