import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class EditProfilePhotoRow extends StatelessWidget {
  final String initials;
  final VoidCallback onChangeTap;

  const EditProfilePhotoRow({
    super.key,
    required this.initials,
    required this.onChangeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 34.r,
              backgroundColor: const Color(0xFFDCE7F9),
              child: Text(
                initials,
                style: TextStyles.title2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: const Color(0xFF4A72B8),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              bottom: -2.h,
              right: -2.w,
              child: GestureDetector(
                onTap: onChangeTap,
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor, width: 1.5),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 13.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 14.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile photo',
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                'JPG or PNG, up to 5 MB',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontSize: 11.sp,
                  color: AppColors.blurcl,
                ),
              ),
            ],
          ),
        ),
        OutlinedButton(
          onPressed: onChangeTap,
          style: OutlinedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            foregroundColor: AppColors.primaryColor,
            side: BorderSide(
              color: AppColors.purple500.withValues(alpha: 0.35),
            ),
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            ),
          ),
          child: Text(
            'Change',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
