import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_duration.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';

class WizardProgressBar extends StatelessWidget {
  final int currentStep; 
  final int totalSteps;

  const WizardProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.screenHorizontalPadding,
      ),
      child: Row(
        children: List.generate(totalSteps, (i) {
          final isDone = i < currentStep;
          return Expanded(
            child: AnimatedContainer(
              duration: AppDurations.normal,
              height: 4.h,
              margin: EdgeInsets.only(right: i == totalSteps - 1 ? 0 : AppSizes.xs),
              decoration: BoxDecoration(
                color: AppColors.orangeColor.withValues(alpha: isDone ? 1 : 0.25),
                borderRadius: BorderRadius.circular(AppSizes.radiusRound),
              ),
            ),
          );
        }),
      ),
    );
  }
}