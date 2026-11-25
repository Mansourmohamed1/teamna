import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'step_progress_indicator.dart';

class BuildTeamAppBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final IconData leadingIcon;
  final VoidCallback onLeadingTap;
  final VoidCallback onDraftTap;

  const BuildTeamAppBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
    this.leadingIcon = Icons.close,
    required this.onLeadingTap,
    required this.onDraftTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onLeadingTap,
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
                  leadingIcon,
                  size: AppSizes.iconMedium.sp,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Text(
              'Build my team · $currentStep/$totalSteps',
              style: TextStyles.caption.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.lightPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: onDraftTap,
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Draft',
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.orangeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.lg.h),
        StepProgressIndicator(totalSteps: totalSteps, currentStep: currentStep),
      ],
    );
  }
}
