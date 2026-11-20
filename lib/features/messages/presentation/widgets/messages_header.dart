import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class MessagesHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onBackPressed;

  const MessagesHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onBackPressed ?? () => Navigator.maybePop(context),
          child: Padding(
            padding: EdgeInsets.only(top: 4.h, right: AppSizes.md.w),
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.primaryColor,
              size: AppSizes.iconLarge.sp,
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.headline2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: const Color(0xFF1A162E),
                ),
              ),
              SizedBox(height: AppSizes.xs.h),
              Text(
                subtitle,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}