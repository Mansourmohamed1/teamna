import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';

class StepProgressIndicator extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const StepProgressIndicator({
    super.key,
    required this.totalSteps,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isActive = index < currentStep;
        return Expanded(
          child: Container(
            height: 4.h,
            margin: EdgeInsets.only(
              right: index < totalSteps - 1 ? AppSizes.sm.w : 0,
            ),
            decoration: BoxDecoration(
              color: isActive
                  ? AppColors.orangeColor
                  : AppColors.orangeColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            ),
          ),
        );
      }),
    );
  }
}