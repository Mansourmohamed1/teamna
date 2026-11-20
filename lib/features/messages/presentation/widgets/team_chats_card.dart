import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/conversation_model.dart';

class TeamChatsCard extends StatelessWidget {
  final List<TeamChatModel> teams;
  final ValueChanged<TeamChatModel> onTeamTap;

  const TeamChatsCard({
    super.key,
    required this.teams,
    required this.onTeamTap,
  });

  @override
  Widget build(BuildContext context) {
    if (teams.isEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.xl.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.02),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(teams.length, (index) {
          final team = teams[index];
          final subtitleParts = <String>[
            team.time,
            if (team.unreadCount > 0) '${team.unreadCount} unread' else 'Read',
            if (team.membersCount != null) '${team.membersCount} members',
          ];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index < teams.length - 1 ? AppSizes.xl.h : 0,
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTeamTap(team),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    team.teamName,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A162E),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${team.lastSender}: ${team.lastMessage}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    subtitleParts.join(' · '),
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.greyColor,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}