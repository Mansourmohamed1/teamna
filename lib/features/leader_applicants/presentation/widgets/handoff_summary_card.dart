import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class HandoffSummaryCard extends StatelessWidget {
  final String roleAndProject;
  final String leaderName;

  const HandoffSummaryCard({
    super.key,
    this.roleAndProject = 'Flutter Developer · Campus Carpool',
    this.leaderName = 'Sara',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.xl.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          SummaryCheckItem(
            title: 'Your role moved to Departed',
            subtitle: roleAndProject,
          ),
          SizedBox(height: AppSizes.lg.h),
          const SummaryCheckItem(
            title: 'The seat is open again',
            subtitle: 'Re-listed on the marketplace',
          ),
          SizedBox(height: AppSizes.lg.h),
          SummaryCheckItem(
            title: '$leaderName received your summary',
            subtitle: 'Branch, tasks and blocker notes',
          ),
        ],
      ),
    );
  }
}

class SummaryCheckItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const SummaryCheckItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: const BoxDecoration(
            color: AppColors.lightGreenColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check_rounded,
            color: AppColors.greenColor,
            size: AppSizes.iconSmall.sp,
          ),
        ),
        SizedBox(width: AppSizes.md.w),
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
                  color: AppColors.blurcl,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
