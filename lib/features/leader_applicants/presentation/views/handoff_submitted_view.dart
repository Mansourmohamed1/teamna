import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/leader_applicants/presentation/widgets/handoff_submitted_animation.dart';
import 'package:teamna/features/leader_applicants/presentation/widgets/handoff_summary_card.dart';


class HandoffSubmittedView extends StatelessWidget {
  final String lottieAssetPath;
  final String roleAndProject;
  final String leaderName;

  const HandoffSubmittedView({
    super.key,
    this.lottieAssetPath = 'assets/animations/project_published.json',
    this.roleAndProject = 'Flutter Developer · Campus Carpool',
    this.leaderName = 'Sara',
  });

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
              const Spacer(flex: 2),

              HandoffSubmittedAnimation(
                lottieAssetPath: lottieAssetPath,
              ),
              SizedBox(height: AppSizes.xxl.h),

              Text(
                'Handoff submitted',
                textAlign: TextAlign.center,
                style: TextStyles.headline2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: AppSizes.sm.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.md.w),
                child: Text(
                  'Thank you for leaving things tidy. Your team has everything it needs.',
                  textAlign: TextAlign.center,
                  style: TextStyles.caption.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.lightPrimaryColor,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.xxl.h),

              HandoffSummaryCard(
                roleAndProject: roleAndProject,
                leaderName: leaderName,
              ),

              const Spacer(flex: 3),

              AppButton(
                text: 'Back to home',
                width: double.infinity,
                backgroundColor: AppColors.orangeColor,
                foregroundColor: AppColors.whiteColor,
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
              ),
              SizedBox(height: AppSizes.lg.h),
            ],
          ),
        ),
      ),
    );
  }
}