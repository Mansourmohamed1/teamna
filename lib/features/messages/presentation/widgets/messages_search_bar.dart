import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class MessagesSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  const MessagesSearchBar({
    super.key,
    this.hintText = 'Search conversations',
    this.controller,
    this.onChanged,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.inputHeight,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.lg.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusRound),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.circle_outlined,
            color: AppColors.primaryColor,
            size: AppSizes.iconLarge.sp,
          ),
          SizedBox(width: AppSizes.md.w),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyles.caption.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.blackColor,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blurcl,
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          GestureDetector(
            onTap: onFilterTap,
            child: Icon(
              Icons.tune_rounded,
              color: AppColors.primaryColor,
              size: AppSizes.iconLarge.sp,
            ),
          ),
        ],
      ),
    );
  }
}