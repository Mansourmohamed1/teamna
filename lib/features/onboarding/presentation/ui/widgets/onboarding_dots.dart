import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';

class OnboardingDots extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingDots({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: count,
      position: currentIndex.toDouble(),
      decorator: DotsDecorator(
        color: AppColors.whiteColor.withValues(alpha: 0.5),
        activeColor: AppColors.whiteColor,
        size: Size.square(AppSizes.indicatorInactiveWidth),
        activeSize:
            Size(AppSizes.indicatorActiveWidth, AppSizes.indicatorHeight),
        spacing: const EdgeInsets.symmetric(horizontal: AppSizes.xs / 2),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusRound),
        ),
      ),
    );
  }
}