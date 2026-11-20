import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/conversation_model.dart';

class PrivateChatCard extends StatelessWidget {
  final PrivateChatModel chat;
  final VoidCallback onTap;

  const PrivateChatCard({super.key, required this.chat, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.lg.w),
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
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: (AppSizes.avatarMedium / 2).r,
                  backgroundColor: AppColors.accentColor,
                  backgroundImage: AssetImage(chat.userImage),
                ),
                if (chat.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12.w,
                      height: 12.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.whiteColor,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: AppSizes.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.userName,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A162E),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '“${chat.lastMessage}”',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chat.unreadCount > 0
                        ? '${chat.time} · ${chat.unreadCount} unread message'
                        : '${chat.time} · Read',
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.greyColor,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSizes.sm.w),
            Icon(
              Icons.chat_bubble_outline_rounded,
              color: AppColors.primaryColor,
              size: AppSizes.iconLarge.sp,
            ),
          ],
        ),
      ),
    );
  }
}
