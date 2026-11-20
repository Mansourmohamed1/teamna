import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class CollaborationInfoBanner extends StatelessWidget {
  final String title;
  final String description;

  const CollaborationInfoBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.lg.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A162E),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            description,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: const Color(0xFF2D2A3E),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}