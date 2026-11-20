import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ConversationInfoCard extends StatelessWidget {
  final VoidCallback onTap;

  const ConversationInfoCard({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.lg.w,
          vertical: AppSizes.md.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: 0.02),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Conversation info',
                  style: TextStyles.caption.copyWith(
                    fontFamily: AppFonts.Poppins,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF1A162E),
                  ),
                ),
                SizedBox(width: 6.w),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 14.sp,
                  color: const Color(0xFF1A162E),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Text(
              'Profile, shared media and safety settings',
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                color: const Color(0xFF2D2A3E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}