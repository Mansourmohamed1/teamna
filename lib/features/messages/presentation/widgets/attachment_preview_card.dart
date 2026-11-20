import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class AttachmentPreviewCard extends StatelessWidget {
  final String imageAssetPath;
  final String fileName;
  final String fileMetadata;

  const AttachmentPreviewCard({
    super.key,
    required this.imageAssetPath,
    required this.fileName,
    required this.fileMetadata,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.lg.w),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            child: Image.asset(
              imageAssetPath,
              width: double.infinity,
              height: 170.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: AppSizes.md.h),
          Text(
            fileName,
            style: TextStyles.body.copyWith(
              fontFamily: AppFonts.Poppins,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1A162E),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            fileMetadata,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}