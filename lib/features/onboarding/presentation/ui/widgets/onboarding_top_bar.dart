import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class OnboardingTopBar extends StatelessWidget {
  final bool showBack;
  final bool showSkip;
  final VoidCallback onBack;
  final VoidCallback onSkip;

  const OnboardingTopBar({
    super.key,
    required this.showBack,
    required this.showSkip,
    required this.onBack,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenHorizontalPadding,
        vertical: AppSizes.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            visible: showBack,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: GestureDetector(
              onTap: onBack,
              child: const Icon(
                Icons.arrow_back,
                color: AppColors.orangeColor,
                size: AppSizes.iconLarge,
              ),
            ),
          ),
          Visibility(
            visible: showSkip,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: GestureDetector(
              onTap: onSkip,
              child: Text(
                'Skip',
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.orangeColor,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.orangeColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}