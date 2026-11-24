import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class SwitchSettingCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchSettingCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: Row(
        children: [
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
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: AppColors.whiteColor,
            activeTrackColor: AppColors.orangeColor,
            inactiveThumbColor: AppColors.whiteColor,
            inactiveTrackColor: AppColors.blurcl.withValues(alpha: 0.4),
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}