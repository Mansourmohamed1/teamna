import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class ProfileStatsCard extends StatelessWidget {
  final int projectsCount;
  final int applicationsCount;
  final int avgMatchPercentage;

  const ProfileStatsCard({
    super.key,
    required this.projectsCount,
    required this.applicationsCount,
    required this.avgMatchPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _StatColumn(
                value: '$projectsCount',
                label: 'Projects',
                valueColor: AppColors.blackColor,
              ),
            ),
            VerticalDivider(
              color: AppColors.bordercl,
              thickness: 1,
              width: 1.w,
            ),
            Expanded(
              child: _StatColumn(
                value: '$applicationsCount',
                label: 'Applications',
                valueColor: AppColors.blackColor,
              ),
            ),
            VerticalDivider(
              color: AppColors.bordercl,
              thickness: 1,
              width: 1.w,
            ),
            Expanded(
              child: _StatColumn(
                value: '$avgMatchPercentage%',
                label: 'Avg. match',
                valueColor: AppColors.greenColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String value;
  final String label;
  final Color valueColor;

  const _StatColumn({
    required this.value,
    required this.label,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyles.title2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: valueColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 2.h),
        Text(
          label,
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.blurcl,
          ),
        ),
      ],
    );
  }
}