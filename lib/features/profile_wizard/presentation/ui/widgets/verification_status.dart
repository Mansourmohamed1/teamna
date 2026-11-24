import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class VerificationStatusCard extends StatelessWidget {
  const VerificationStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Verification',
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.sm,
                  vertical: AppSizes.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.yellowColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
                child: Text(
                  'Pending',
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    fontWeight: FontWeight.w500,
                    color: AppColors.orangeColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.md),
          const _VerificationItem(
            icon: Icons.check,
            color: AppColors.greenColor,
            background: AppColors.lightGreenColor,
            title: 'Account created',
            subtitle: 'Just now',
          ),
          const _VerificationItem(
            icon: Icons.check,
            color: AppColors.greenColor,
            background: AppColors.lightGreenColor,
            title: 'Profile completed',
            subtitle: 'DEPI · Flutter · Round 7',
          ),
          const _VerificationItem(
            icon: Icons.access_time,
            color: AppColors.orangeColor,
            background: AppColors.yellowColor,
            title: 'Admin review',
            subtitle: 'Usually within 24 hours',
          ),
        ],
      ),
    );
  }
}

class _VerificationItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color background;
  final String title;
  final String subtitle;

  const _VerificationItem({
    required this.icon,
    required this.color,
    required this.background,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.xs),
      child: Row(
        children: [
          Container(
            width: 28.r,
            height: 28.r,
            decoration: BoxDecoration(shape: BoxShape.circle, color: background),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: AppSizes.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}