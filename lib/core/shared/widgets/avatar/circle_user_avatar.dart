import 'package:flutter/material.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class CircleUserAvatar extends StatelessWidget {
  const CircleUserAvatar({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: Constants.size100,
      height: Constants.size100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 2,
        ),
      ),
      child: ClipOval(
        child: user.photoUrl.isNotEmpty
            ? Image.network(
                user.photoUrl,
                fit: BoxFit.cover,
                width: Constants.size100,
                height: Constants.size100,
                errorBuilder: (_, _, _) =>
                    const DefaultAvatar(size: Constants.iconSizeLarge),
              )
            : const DefaultAvatar(size: Constants.iconSizeLarge),
      ),
    );
  }
}
