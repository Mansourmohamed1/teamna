import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ProfileSkillsCard extends StatelessWidget {
  final List<String> skills;
  final String primarySkill;

  const ProfileSkillsCard({
    super.key,
    required this.skills,
    required this.primarySkill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.lg.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyles.caption.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: AppSizes.md.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: skills.map((skill) {
              final isPrimary = skill == primarySkill;
              return Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: isPrimary
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                  border: Border.all(
                    color: isPrimary
                        ? AppColors.primaryColor
                        : AppColors.purple500.withValues(alpha: 0.35),
                  ),
                ),
                child: Text(
                  skill,
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: isPrimary
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    fontWeight: isPrimary ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}