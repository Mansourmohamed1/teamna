import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import '../../data/models/user_profile_model.dart';

class ProfileInfoCard extends StatelessWidget {
  final UserProfileModel profile;
  final VoidCallback onEditTap;

  const ProfileInfoCard({
    super.key,
    required this.profile,
    required this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الأفاتار مع علامة التوثيق الخضراء
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 34.r,
                    backgroundColor: const Color(0xFFDCE7F9),
                    child: Text(
                      profile.initials,
                      style: TextStyles.title2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: const Color(0xFF4A72B8),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  if (profile.isVerified)
                    Positioned(
                      bottom: -2.h,
                      right: -2.w,
                      child: Container(
                        width: 24.w,
                        height: 24.w,
                        decoration: BoxDecoration(
                          color: AppColors.greenColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          size: 14.sp,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 14.w),

              // الاسم والتخصص والشارات
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.fullName,
                      style: TextStyles.subtitle.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      profile.roleAndCity,
                      style: TextStyles.caption2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.blurcl,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Expanded(
                          child: _TagPill(
                            text: profile.batchTag,
                            bgColor: AppColors.purple500.withValues(alpha: 0.14),
                            textColor: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: _TagPill(
                            text: profile.trackTag,
                            bgColor: AppColors.orangeColor.withValues(alpha: 0.2),
                            textColor: AppColors.orangeColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),

              // زر التعديل الدائري
              InkWell(
                onTap: onEditTap,
                borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                child: Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.bordercl),
                  ),
                  child: Icon(
                    Icons.edit_outlined,
                    size: 18.sp,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.md.h),

          // صندوق النبذة التعريفية
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            ),
            child: Text(
              profile.bio,
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.lightPrimaryColor,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;

  const _TagPill({
    required this.text,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusRound),
      ),
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyles.caption2.copyWith(
          fontFamily: AppFonts.Poppins,
          fontSize: 10.sp,
          color: textColor,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }
}