import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/create_team/presentation/views/build_team_published_view.dart';
import '../widgets/build_team_app_bar.dart';
import '../widgets/project_review_summary_card.dart';
import '../widgets/tip_info_card.dart';

class BuildTeamReviewView extends StatelessWidget {
  final String projectName;
  final String domain;
  final String stack;
  final String openSeats;
  final String commitment;
  final String terms;
  final String exitHandoff;

  const BuildTeamReviewView({
    super.key,
    this.projectName = 'Campus Carpool',
    this.domain = 'Transport',
    this.stack = 'Flutter · Firebase · BLoC',
    this.openSeats = '2 Flutter · 1 Back-End · 1 UI/UX',
    this.commitment = '5–10h · 8 weeks',
    this.terms = 'Learning project',
    this.exitHandoff = 'Required',
  });

  void _onPublishProject(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const BuildTeamPublishedView()),
      (route) => route.isFirst,
    );
  }

  void _onSaveAsDraft(BuildContext context) {}

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
              BuildTeamAppBar(
                currentStep: 5,
                totalSteps: 5,
                leadingIcon: Icons.arrow_back,
                onLeadingTap: () => Navigator.pop(context),
                onDraftTap: () => _onSaveAsDraft(context),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSizes.xxl.h,
                    bottom: AppSizes.lg.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Review and publish',
                        style: TextStyles.headline2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.sm.h),
                      Text(
                        'Everything looks good? Your project goes live right away.',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.lightPrimaryColor,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: AppSizes.xxl.h),

                      ProjectReviewSummaryCard(
                        projectName: projectName,
                        domain: domain,
                        stack: stack,
                        openSeats: openSeats,
                        commitment: commitment,
                        terms: terms,
                        exitHandoff: exitHandoff,
                      ),
                      SizedBox(height: AppSizes.lg.h),

                      TipInfoCard(
                        title: 'Auto-archive rules',
                        description:
                            'Applications close when seats fill. The project pauses after 14 days of inactivity.',
                        icon: Icons.access_time_rounded,
                        iconColor: AppColors.orangeColor,
                        backgroundColor: AppColors.yellowColor,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.lg.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      text: 'Publish project',
                      width: double.infinity,
                      onPressed: () => _onPublishProject(context),
                    ),
                    SizedBox(height: AppSizes.md.h),
                    AppButton(
                      text: 'Save as draft',
                      width: double.infinity,
                      backgroundColor: AppColors.purple500.withValues(
                        alpha: 0.14,
                      ),
                      foregroundColor: AppColors.purple500,
                      onPressed: () => _onSaveAsDraft(context),
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
