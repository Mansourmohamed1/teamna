import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class WizardHeader extends StatelessWidget {
  final int currentStep; // 1-based
  final int totalSteps;
  final VoidCallback onBack;
  final VoidCallback onSkip;

  const WizardHeader({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    required this.onBack,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenHorizontalPadding,
        vertical: AppSizes.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onBack,
            child: const Icon(Icons.arrow_back, size: AppSizes.iconLarge),
          ),
          Text(
            'Step $currentStep of $totalSteps',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.greyColor,
            ),
          ),
          GestureDetector(
            onTap: onSkip,
            child: Text(
              'Skip',
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                fontWeight: FontWeight.w500,
                color: AppColors.orangeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}