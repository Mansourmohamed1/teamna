import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/leader_applicants/data/models/team_member_model.dart';

class LeaderMemberSelectionCard extends StatelessWidget {
  final TeamMemberModel member;
  final bool isSelected;
  final VoidCallback onTap;

  const LeaderMemberSelectionCard({
    super.key,
    required this.member,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: isSelected ? AppColors.purple500 : AppColors.bordercl,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23.r,
              backgroundColor: member.avatarBgColor,
              child: Text(
                member.initials,
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: member.avatarColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(width: AppSizes.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    member.name,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${member.role} · ${member.completedTasks} tasks done',
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.blurcl,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSizes.sm.w),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.orangeColor
                    : AppColors.whiteColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.orangeColor
                      : AppColors.purple500.withValues(alpha: 0.4),
                  width: 1.5,
                ),
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 14.sp,
                      color: AppColors.whiteColor,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}