import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class ProfileHeaderBar extends StatelessWidget {
  final VoidCallback onNotificationsTap;
  final VoidCallback onSettingsTap;
  final bool hasUnreadNotifications;

  const ProfileHeaderBar({
    super.key,
    required this.onNotificationsTap,
    required this.onSettingsTap,
    this.hasUnreadNotifications = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Profile',
          style: TextStyles.headline2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.blackColor,
          ),
        ),
        const Spacer(),
        _CircleActionIcon(
          icon: Icons.notifications_none_rounded,
          onTap: onNotificationsTap,
          showBadge: hasUnreadNotifications,
        ),
        SizedBox(width: 10.w),
        _CircleActionIcon(
          icon: Icons.settings_outlined,
          onTap: onSettingsTap,
        ),
      ],
    );
  }
}

class _CircleActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool showBadge;

  const _CircleActionIcon({
    required this.icon,
    required this.onTap,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusRound),
      child: Container(
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.bordercl),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              icon,
              size: AppSizes.iconMedium.sp,
              color: AppColors.blackColor,
            ),
            if (showBadge)
              Positioned(
                top: 10.h,
                right: 11.w,
                child: Container(
                  width: 7.w,
                  height: 7.w,
                  decoration: const BoxDecoration(
                    color: AppColors.orangeColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}