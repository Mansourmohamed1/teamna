import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ProfileSuccessScreen extends StatelessWidget {
  const ProfileSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: AppSizes.avatarMedium,
              color: AppColors.greenColor,
            ),
            SizedBox(height: AppSizes.md.h),
            Text(
              'Profile submitted for verification',
              style: TextStyles.title1.copyWith(
                fontFamily: AppFonts.Poppins,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSizes.sm.h),
            Text(
              'Your profile is under review. You will be notified once it is verified.',
              textAlign: TextAlign.center,
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
