import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import '../../data/models/user_profile_model.dart';

class ProfileRecentActivityCard extends StatelessWidget {
  final List<ProfileActivityItem> activities;
  final VoidCallback onSeeAllTap;

  const ProfileRecentActivityCard({
    super.key,
    required this.activities,
    required this.onSeeAllTap,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent activity',
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: onSeeAllTap,
                child: Text(
                  'See all',
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.orangeColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.md.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: activities.length,
            separatorBuilder: (_, __) => SizedBox(height: 14.h),
            itemBuilder: (context, index) {
              final item = activities[index];
              return Row(
                children: [
                  Container(
                    width: 38.w,
                    height: 38.w,
                    decoration: BoxDecoration(
                      color: item.iconBgColor,
                      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    ),
                    child: Icon(
                      item.icon,
                      color: item.iconColor,
                      size: AppSizes.iconSmall.sp,
                    ),
                  ),
                  SizedBox(width: AppSizes.md.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: TextStyles.caption.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          item.subtitle,
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
            },
          ),
        ],
      ),
    );
  }
}
