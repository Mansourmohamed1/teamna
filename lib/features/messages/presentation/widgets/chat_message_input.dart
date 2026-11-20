import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ChatMessageInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onAttachmentTap;
  final ValueChanged<String>? onSubmitted;

  const ChatMessageInput({
    super.key,
    this.label = 'Message',
    required this.controller,
    required this.onAttachmentTap,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Message',
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A162E),
          ),
        ),
        SizedBox(height: AppSizes.sm.h),
        Container(
          height: AppSizes.inputHeight,
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.bordercl),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onSubmitted: onSubmitted,
                  textInputAction: TextInputAction.send,
                  style: TextStyles.caption.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.blackColor,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Write a message...',
                    hintStyle: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onAttachmentTap,
                child: Icon(
                  Icons.attach_file_rounded,
                  color: AppColors.primaryColor,
                  size: AppSizes.iconLarge.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
