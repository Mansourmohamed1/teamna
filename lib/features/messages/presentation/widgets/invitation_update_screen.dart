import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/share_card_models.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_action_item_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/invitation_gradient_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_project_card.dart';

class InvitationUpdateScreen extends StatelessWidget {
  const InvitationUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const project = ShareProjectModel(
      id: 'ai_study',
      title: 'AI Study Assistant',
      categoryAndVisibility: 'Side Project · Invitation pending',
      description: 'Mobile developer · 6 h / week · 6 weeks',
      techStack: 'Flutter · Remote',
      membersAndMode: '3 / 5 members · Remote',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.screenHorizontalPadding.w,
            right: AppSizes.screenHorizontalPadding.w,
            top: AppSizes.lg.h,
            bottom: AppSizes.bottomNavHeight + AppSizes.xl.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MessagesHeader(
                title: 'Invitation update',
                subtitle: 'Today, 09:50 · Invitation notification',
              ),
              SizedBox(height: AppSizes.xl.h),
              const InvitationGradientBanner(
                title: 'You’ve been invited!',
                subtitle:
                    'Omar Hassan wants you on the AI Study Assistant team.',
              ),
              SizedBox(height: AppSizes.md.h),
              ShareProjectCard(
                project: project,
                icon: Icons.auto_awesome_outlined,
                onTap: () {},
                onBookmarkTap: () {},
                onViewProjectTap: () {},
              ),
              SizedBox(height: AppSizes.md.h),
              const CollaborationInfoBanner(
                title: 'Review before deciding',
                description: 'Check the role, team and agreement. This notification doesn’t add you to the team automatically.',
              ),
              SizedBox(height: AppSizes.md.h),
              ChatActionItemCard(
                title: 'Notification settings',
                subtitle: 'Choose which updates reach you',
                onTap: () {},
              ),
              SizedBox(height: AppSizes.lg.h),
              _buildBottomActions(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: AppSizes.buttonHeight,
            child: ElevatedButton(
              onPressed: () {
                // TODO: Navigate to invitation review / agreement screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
              ),
              child: Text(
                'Review invitation',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.md.w),
        Expanded(
          child: SizedBox(
            height: AppSizes.buttonHeight,
            child: OutlinedButton(
              onPressed: () => Navigator.maybePop(context),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                foregroundColor: AppColors.primaryColor,
                side: BorderSide(color: AppColors.bordercl, width: 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
              ),
              child: Text(
                'Dismiss',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
