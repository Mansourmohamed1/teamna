import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ConversationOptionItem {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showArrow;

  const ConversationOptionItem({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showArrow = false,
  });
}

class ConversationOptionsCard extends StatelessWidget {
  final List<ConversationOptionItem> options;

  const ConversationOptionsCard({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
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
        children: List.generate(options.length, (index) {
          final item = options[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: index < options.length - 1 ? AppSizes.xl.h : 0,
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: item.onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1A162E),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    item.subtitle,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
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
