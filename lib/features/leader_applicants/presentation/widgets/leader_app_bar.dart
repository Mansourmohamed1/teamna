import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class LeaderAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final Widget? trailing;

  const LeaderAppBar({
    super.key,
    required this.title,
    this.onBackTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onBackTap ?? () => Navigator.pop(context),
          borderRadius: BorderRadius.circular(AppSizes.radiusRound),
          child: Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.bordercl),
            ),
            child: Icon(
              Icons.arrow_back,
              size: AppSizes.iconMedium.sp,
              color: AppColors.blackColor,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyles.subtitle.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing ?? SizedBox(width: 40.w),
      ],
    );
  }
}