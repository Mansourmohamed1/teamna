import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class TermSelectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final bool isSelected;
  final VoidCallback onTap;

  const TermSelectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: isSelected ? AppColors.purple500 : AppColors.bordercl,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              ),
              child: Icon(
                icon,
                color: iconColor,
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
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSizes.sm.w),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.orangeColor
                    : AppColors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.orangeColor
                      : AppColors.purple500.withValues(alpha: 0.4),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 14.sp,
                      color: AppColors.whiteColor,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}