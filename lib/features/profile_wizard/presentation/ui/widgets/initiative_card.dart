import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_duration.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/initiative.dart';

class InitiativeCard extends StatelessWidget {
  final Initiative initiative;
  final bool isSelected;
  final VoidCallback onTap;

  const InitiativeCard({
    super.key,
    required this.initiative,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppDurations.fast,
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.lightPurpleColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : AppColors.bordercl,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(initiative.logoPath, width: 40.r, height: 40.r),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    initiative.name,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    initiative.subtitle,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 22.r,
              height: 22.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.orangeColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.orangeColor : AppColors.bordercl,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 14, color: AppColors.whiteColor)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}