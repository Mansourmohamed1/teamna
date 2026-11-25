import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ProfileVerifiedBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ProfileVerifiedBanner({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.lightGreenColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              ),
              child: Icon(
                Icons.verified_user_outlined,
                color: AppColors.greenColor,
                size: AppSizes.iconMedium.sp,
              ),
            ),
            SizedBox(width: AppSizes.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.greenColor.withValues(alpha: 0.85),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: AppColors.greenColor,
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
