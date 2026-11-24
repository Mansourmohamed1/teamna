import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class UploadBox extends StatelessWidget {
  final VoidCallback onTap;
  const UploadBox({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomPaint(
        painter: _DashedBorderPainter(
          color: AppColors.purple500,
          radius: AppSizes.radiusXl,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: AppSizes.xxxl.h),
          decoration: BoxDecoration(
            color: AppColors.lightPurpleColor.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          ),
          child: Column(
            children: [
              
              const Icon(Icons.file_upload_outlined,
                  size: AppSizes.iconXLarge, color: AppColors.primaryColor),
              const SizedBox(height: AppSizes.sm),
              Text(
                'Upload certificate or student ID',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: AppSizes.xs),
              Text(
                'PNG, JPG or PDF · up to 5 MB',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  final Color color;
  final double radius;
  _DashedBorderPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Offset.zero & size,
        Radius.circular(radius),
      ));
    for (final metric in path.computeMetrics()) {
      double distance = 0;
      while (distance < metric.length) {
        canvas.drawPath(metric.extractPath(distance, distance + 6), paint);
        distance += 10;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter old) => false;
}