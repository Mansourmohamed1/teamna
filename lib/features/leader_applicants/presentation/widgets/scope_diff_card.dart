import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ScopeDiffCard extends StatelessWidget {
  final String label;
  final String oldValue;
  final String newValue;

  const ScopeDiffCard({
    super.key,
    required this.label,
    required this.oldValue,
    required this.newValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              fontSize: 11.sp,
              color: AppColors.blurcl,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 6.h),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.w,
            runSpacing: 4.h,
            children: [
              Text(
                oldValue,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blurcl,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.blurcl,
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 16.sp,
                color: AppColors.orangeColor,
              ),
              Text(
                newValue,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}