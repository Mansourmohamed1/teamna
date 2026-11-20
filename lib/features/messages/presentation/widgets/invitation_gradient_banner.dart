import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class InvitationGradientBanner extends StatelessWidget {
  final String title;
  final String subtitle;

  const InvitationGradientBanner({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.xl.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        gradient: const LinearGradient(
          colors: [
            AppColors.primaryColor,
            Color(0xFF9E7AE8),
            Color(0xFFF6B196),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.mail_outline_rounded,
            color: AppColors.whiteColor,
            size: AppSizes.iconLarge.sp,
          ),
          SizedBox(height: AppSizes.md.h),
          Text(
            title,
            style: TextStyles.title2.copyWith(
              fontFamily: AppFonts.Poppins,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.whiteColor.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
