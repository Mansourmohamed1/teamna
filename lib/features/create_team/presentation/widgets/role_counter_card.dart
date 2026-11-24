import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/create_team/data/model/team_role_model.dart';
class RoleCounterCard extends StatelessWidget {
  final TeamRoleModel role;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const RoleCounterCard({
    super.key,
    required this.role,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = role.count > 0;

    return AnimatedContainer(
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
          Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              color: role.iconBgColor,
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            ),
            child: Icon(
              role.icon,
              color: role.iconColor,
              size: AppSizes.iconMedium.sp,
            ),
          ),
          SizedBox(width: AppSizes.md.w),

          // اسم الدور والتقنيات
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  role.title,
                  style: TextStyles.caption.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  role.subtitle,
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.blurcl,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              _CounterCircleButton(
                icon: Icons.remove,
                onTap: isSelected ? onDecrement : null,
                backgroundColor: AppColors.whiteColor,
                iconColor: isSelected
                    ? AppColors.lightPrimaryColor
                    : AppColors.blurcl,
                hasBorder: true,
              ),
              SizedBox(width: 12.w),

              SizedBox(
                width: 16.w,
                child: Text(
                  '${role.count}',
                  textAlign: TextAlign.center,
                  style: TextStyles.caption.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: isSelected
                        ? AppColors.blackColor
                        : AppColors.lightPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 12.w),

              _CounterCircleButton(
                icon: Icons.add,
                onTap: onIncrement,
                backgroundColor: isSelected
                    ? AppColors.primaryColor
                    : AppColors.purple500.withValues(alpha: 0.2),
                iconColor: isSelected
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                hasBorder: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CounterCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color iconColor;
  final bool hasBorder;

  const _CounterCircleButton({
    required this.icon,
    required this.onTap,
    required this.backgroundColor,
    required this.iconColor,
    required this.hasBorder,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusRound),
      child: Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
          border: hasBorder ? Border.all(color: AppColors.bordercl) : null,
        ),
        child: Icon(
          icon,
          size: AppSizes.iconSmall.sp,
          color: iconColor,
        ),
      ),
    );
  }
}