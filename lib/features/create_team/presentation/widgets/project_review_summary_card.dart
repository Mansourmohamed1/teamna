import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class ProjectReviewSummaryCard extends StatelessWidget {
  final String projectName;
  final String domain;
  final String stack;
  final String openSeats;
  final String commitment;
  final String terms;
  final String exitHandoff;

  const ProjectReviewSummaryCard({
    super.key,
    required this.projectName,
    required this.domain,
    required this.stack,
    required this.openSeats,
    required this.commitment,
    required this.terms,
    required this.exitHandoff,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.xl.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.03),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  projectName,
                  style: TextStyles.title2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.sm.w),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.purple500.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
                child: Text(
                  domain,
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.lg.h),

          _ReviewDetailRow(label: 'Stack', value: stack),
          SizedBox(height: 14.h),
          _ReviewDetailRow(label: 'Open seats', value: openSeats),
          SizedBox(height: 14.h),
          _ReviewDetailRow(label: 'Commitment', value: commitment),
          SizedBox(height: 14.h),
          _ReviewDetailRow(label: 'Terms', value: terms),
          SizedBox(height: 14.h),
          _ReviewDetailRow(label: 'Exit handoff', value: exitHandoff),
        ],
      ),
    );
  }
}

class _ReviewDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const _ReviewDetailRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.blurcl,
          ),
        ),
        SizedBox(width: AppSizes.md.w),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}