import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/leader_app_bar.dart';
import '../widgets/verification_progress_card.dart';

class VerificationGetStartedView extends StatelessWidget {
  const VerificationGetStartedView({super.key});

  List<VerificationStepData> get _steps => const [
    VerificationStepData(
      stepNumber: 1,
      title: 'Initiative and track',
      subtitle: 'DEPI · Round 7 · Flutter',
    ),
    VerificationStepData(
      stepNumber: 2,
      title: 'Upload proof of enrollment',
      subtitle: 'Certificate, enrollment letter or student card',
    ),
    VerificationStepData(
      stepNumber: 3,
      title: 'Identity check',
      subtitle: 'National ID, front and back',
    ),
    VerificationStepData(
      stepNumber: 4,
      title: 'Admin review',
      subtitle: 'Usually within 24 hours',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontalPadding.w,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSizes.sm.h),
              const LeaderAppBar(title: 'Verification'),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSizes.lg.h,
                    bottom: AppSizes.lg.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // شارة Not verified yet
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.purple500.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(
                            AppSizes.radiusRound,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              size: 14.sp,
                              color: AppColors.primaryColor,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Not verified yet',
                              style: TextStyles.caption2.copyWith(
                                fontFamily: AppFonts.Poppins,
                                fontSize: 11.sp,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSizes.md.h),

                      // العنوان الرئيسي
                      Text(
                        'Prove your DEPI badge',
                        style: TextStyles.headline2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.sm.h),

                      // النص التوضيحي
                      Text(
                        'Verified members are matched first and get a badge on every application.',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.lightPrimaryColor,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: AppSizes.xl.h),

                      VerificationProgressCard(currentStep: 2, steps: _steps),
                      SizedBox(height: AppSizes.md.h),

                      Container(
                        padding: EdgeInsets.all(AppSizes.lg.w),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(
                            AppSizes.radiusXl,
                          ),
                          border: Border.all(color: AppColors.bordercl),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.w,
                              decoration: BoxDecoration(
                                color: AppColors.lightGreenColor,
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusLg,
                                ),
                              ),
                              child: Icon(
                                Icons.lock_outline_rounded,
                                color: AppColors.greenColor,
                                size: AppSizes.iconMedium.sp,
                              ),
                            ),
                            SizedBox(width: AppSizes.md.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Private by design',
                                    style: TextStyles.caption.copyWith(
                                      fontFamily: AppFonts.Poppins,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    'Files are encrypted and only visible to t2mna admins. They are never shown on your profile.',
                                    style: TextStyles.caption2.copyWith(
                                      fontFamily: AppFonts.Poppins,
                                      color: AppColors.blurcl,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // الأزرار السفلية
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.md.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      text: 'Continue to upload',
                      width: double.infinity,
                      backgroundColor: AppColors.orangeColor,
                      foregroundColor: AppColors.whiteColor,
                      onPressed: () {
                        // الانتقال لشاشة رفع المستندات القادمة
                      },
                    ),
                    SizedBox(height: AppSizes.sm.h),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Maybe later',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
