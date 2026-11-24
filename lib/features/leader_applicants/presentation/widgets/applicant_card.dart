import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import '../../data/models/applicant_model.dart';

class ApplicantCard extends StatelessWidget {
  final ApplicantModel applicant;
  final VoidCallback onReject;
  final VoidCallback onAccept;
  final VoidCallback? onTap;

  const ApplicantCard({
    super.key,
    required this.applicant,
    required this.onReject,
    required this.onAccept,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.lg.w),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 23.r,
                  backgroundColor: applicant.avatarBgColor,
                  child: Text(
                    applicant.initials,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: applicant.avatarColor,
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
                        applicant.name,
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Wrap(
                        spacing: 6.w,
                        runSpacing: 4.h,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            applicant.roleTitle,
                            style: TextStyles.caption2.copyWith(
                              fontFamily: AppFonts.Poppins,
                              color: AppColors.blurcl,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.purple500.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusRound,
                              ),
                            ),
                            child: Text(
                              applicant.batchTag,
                              style: TextStyles.caption2.copyWith(
                                fontFamily: AppFonts.Poppins,
                                fontSize: 10.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.xs.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.lightGreenColor,
                    borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                  ),
                  child: Text(
                    '${applicant.matchPercentage}%',
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.greenColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            // صندوق نبذة المتقدم
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.md.w),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor.withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              ),
              child: Text(
                applicant.pitch,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.lightPrimaryColor,
                  height: 1.45,
                ),
              ),
            ),
            SizedBox(height: AppSizes.md.h),
            Row(
              children: [
                Icon(
                  Icons.code_rounded,
                  size: AppSizes.iconSmall.sp,
                  color: AppColors.blurcl,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    applicant.githubUrl,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.blurcl,
                    ),
                  ),
                ),
                Icon(
                  Icons.access_time_rounded,
                  size: AppSizes.iconSmall.sp,
                  color: AppColors.blurcl,
                ),
                SizedBox(width: 4.w),
                Text(
                  applicant.availability,
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.blurcl,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),

            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: 'Reject',
                    height: 42.h,
                    backgroundColor: AppColors.lighRedColor,
                    foregroundColor: AppColors.redColor,
                    textStyle: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.redColor,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: onReject,
                  ),
                ),
                SizedBox(width: AppSizes.md.w),
                Expanded(
                  child: AppButton(
                    text: 'Accept',
                    height: 42.h,
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    textStyle: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: onAccept,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}