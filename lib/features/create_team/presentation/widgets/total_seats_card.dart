import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class TotalSeatsCard extends StatelessWidget {
  final int totalSeats;

  const TotalSeatsCard({
    super.key,
    required this.totalSeats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.lg.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.purple500.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total open seats',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.lightPrimaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '$totalSeats ${totalSeats == 1 ? 'seat' : 'seats'}',
            style: TextStyles.body.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}