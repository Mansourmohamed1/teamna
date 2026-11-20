import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/chat_message_model.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessageModel message;

  const ChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final bubbleColor = message.isMe
        ? AppColors.primaryColor.withValues(alpha: 0.12)
        : AppColors.whiteColor;

    final footerText = [
      if (message.time != null && message.time!.isNotEmpty) message.time!,
      if (message.status != null && message.status!.isNotEmpty) message.status!,
    ].join(' · ');

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: AppSizes.xl.w),
      padding: EdgeInsets.all(AppSizes.lg.w),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.senderName ?? '',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            message.message ?? '',
            style: TextStyles.caption.copyWith(
              fontFamily: AppFonts.Poppins,
              color: const Color(0xFF1A162E),
              height: 1.4,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            footerText,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.greyColor,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
