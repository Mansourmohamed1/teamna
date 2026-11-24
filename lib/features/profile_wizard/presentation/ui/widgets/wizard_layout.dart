import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class WizardStepLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Widget> children;

  const WizardStepLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.headline2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(
            subtitle,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.greyColor,
            ),
          ),
          SizedBox(height: AppSizes.xl.h),
          ...children,
        ],
      ),
    );
  }
}