import 'package:flutter/material.dart';
import 'package:kianja/core/config/assets.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class JobItemWidget extends StatelessWidget {
  const JobItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Brightness.dark == Theme.of(context).brightness;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Constants.paddingSmall,
        horizontal: Constants.paddingMedium,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          ClipOval(
            child: Image.asset(
              Assets.rabbitAvatar,
              fit: BoxFit.cover,
              cacheWidth: Constants.size70.toInt(),
              cacheHeight: Constants.size70.toInt(),
              width: Constants.size50,
              height: Constants.size50,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.person,
                color: isDark
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
                size: Constants.iconSizeSmall,
              ),
            ),
          ),
          // CircleAvatar(
          //   backgroundImage: Image.asset(
          //     Assets.rabbitAvatar,
          //     // fit: BoxFit.cover,
          //     // cacheWidth: Constants.size150.toInt(),
          //     // cacheHeight: Constants.size150.toInt(),
          //     // width: Constants.size70,
          //     // height: Constants.size70,
          //     errorBuilder: (context, error, stackTrace) => Icon(
          //       Icons.restaurant,
          //       color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
          //       // size: Constants.iconSizeSmall,
          //     ),
          //   ).image,
          // ),
          const SizedBox(width: Constants.spacingSmall),

          // Texts
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Full Name',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    children: [
                      TextSpan(
                        text: ' : ',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.2,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Lorem Ipsum is simply dummy text of the lorem ipsum dolor sit amet consectetur adipiscing elit',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   'Full Name',
                //   style: theme.textTheme.titleSmall?.copyWith(
                //     fontWeight: FontWeight.bold,
                //     height: 1.2,
                //   ),
                // ),
                // Text(
                //   'Lorem Ipsum is simply dummy text of the lorem ipsum dolor sit amet consectetur adipiscing elit',
                //   style: theme.textTheme.bodyMedium?.copyWith(height: 1.2),
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
          ),

          // Time
          const SizedBox(width: Constants.spacingSmall),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('• 1h', style: theme.textTheme.bodySmall)],
          ),
        ],
      ),
    );
  }
}
