import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_assets.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import '../widgets/project_live_animation.dart';
import '../widgets/project_share_link_card.dart';

class BuildTeamPublishedView extends StatelessWidget {
  final String projectName;
  final String projectUrl;

  const BuildTeamPublishedView({
    super.key,
    this.projectName = 'Campus Carpool',
    this.projectUrl = 'teamna.app/p/campus-carpool',
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

              const ProjectLiveAnimation(
                lottieAssetPath: AppAssets.successJson,
              ),
              SizedBox(height: AppSizes.xxl.h),

              Text(
                'Your project is live!',
                textAlign: TextAlign.center,
                style: TextStyles.headline2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: AppSizes.md.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.md.w),
                child: Text(
                  '$projectName is now visible to matching developers. We will notify you when someone applies.',
                  textAlign: TextAlign.center,
                  style: TextStyles.caption.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.lightPrimaryColor,
                    height: 1.5,
                  ),
                ),
              ),
              SizedBox(height: AppSizes.xxl.h),

              ProjectShareLinkCard(projectUrl: projectUrl),

              const Spacer(flex: 3),

              AppButton(
                text: 'Go to workspace',
                width: double.infinity,
                backgroundColor: AppColors.orangeColor,
                foregroundColor: AppColors.whiteColor,
                onPressed: () {},
              ),
              SizedBox(height: AppSizes.md.h),
              AppButton(
                text: 'Back to home',
                width: double.infinity,
                backgroundColor: AppColors.whiteColor,
                foregroundColor: AppColors.primaryColor,
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
