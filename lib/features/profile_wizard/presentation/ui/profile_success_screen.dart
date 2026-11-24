import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/routes/routes_name.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/success_badge.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/verification_status.dart';

class ProfileSuccessScreen extends StatelessWidget {
  const ProfileSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.screenHorizontalPadding),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    const SuccessBadge(),
                    SizedBox(height: AppSizes.xl.h),
                    Text(
                      'You are all set!',
                      style: TextStyles.headline2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    Text(
                      'We are reviewing your DEPI proof. You can start exploring projects while we verify.',
                      textAlign: TextAlign.center,
                      style: TextStyles.caption2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(height: AppSizes.xxl.h),
                    const VerificationStatusCard(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.xl.h),
              child: AppButton(
                text: 'Start exploring',
                backgroundColor: AppColors.orangeColor,
                onPressed: () {
                 Navigator.pushReplacementNamed(context, RouteNames.mainApp);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}