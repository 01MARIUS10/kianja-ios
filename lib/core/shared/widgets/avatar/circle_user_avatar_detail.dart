import 'package:flutter/material.dart';
import 'package:kianja/core/shared/app_feature/domain/entities/user.dart';
import 'package:kianja/core/shared/widgets/avatar/default_avatar.dart';
import 'package:kianja/core/themes/app_colors.dart';
import 'package:kianja/core/utils/constants.dart';

class CircleUserAvatarDetail extends StatelessWidget {
  const CircleUserAvatarDetail({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: Constants.size30,
      height: Constants.size30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1,
        ),
      ),
      child: ClipOval(
        child: user.photoUrl.isNotEmpty
            ? Image.network(
                user.photoUrl,
                fit: BoxFit.cover,
                width: Constants.size30,
                height: Constants.size30,
                errorBuilder: (_, _, _) => const DefaultAvatar(),
              )
            : const DefaultAvatar(),
      ),
    );
  }
}
