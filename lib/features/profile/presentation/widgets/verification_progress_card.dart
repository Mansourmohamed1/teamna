import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class VerificationStepData {
  final int stepNumber;
  final String title;
  final String subtitle;

  const VerificationStepData({
    required this.stepNumber,
    required this.title,
    required this.subtitle,
  });
}

class VerificationProgressCard extends StatelessWidget {
  final int currentStep;
  final List<VerificationStepData> steps;

  const VerificationProgressCard({
    super.key,
    required this.currentStep,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.lg.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الهيدر العلوي للبطاقة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your progress',
                style: TextStyles.caption.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Step $currentStep of ${steps.length}',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontSize: 11.sp,
                  color: AppColors.blurcl,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),

          // شريط التقدم المقسم لـ 4 أجزاء
          Row(
            children: List.generate(steps.length, (index) {
              final isActiveOrCompleted = (index + 1) <= currentStep;
              return Expanded(
                child: Container(
                  height: 4.h,
                  margin: EdgeInsets.only(
                    right: index == steps.length - 1 ? 0 : 6.w,
                  ),
                  decoration: BoxDecoration(
                    color: isActiveOrCompleted
                        ? AppColors.orangeColor
                        : AppColors.bordercl,
                    borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                  ),
                ),
              );
            }),
          ),
          SizedBox(height: AppSizes.xl.h),

          // قائمة الخطوات
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: steps.length,
            separatorBuilder: (_, __) => SizedBox(height: 18.h),
            itemBuilder: (context, index) {
              final step = steps[index];
              final isCompleted = step.stepNumber < currentStep;
              final isCurrent = step.stepNumber == currentStep;

              return Row(
                children: [
                  _StepCircleIndicator(
                    stepNumber: step.stepNumber,
                    isCompleted: isCompleted,
                    isCurrent: isCurrent,
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          step.title,
                          style: TextStyles.caption.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          step.subtitle,
                          style: TextStyles.caption2.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.blurcl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StepCircleIndicator extends StatelessWidget {
  final int stepNumber;
  final bool isCompleted;
  final bool isCurrent;

  const _StepCircleIndicator({
    required this.stepNumber,
    required this.isCompleted,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return Container(
        width: 34.w,
        height: 34.w,
        decoration: const BoxDecoration(
          color: AppColors.greenColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.check_rounded,
          color: AppColors.whiteColor,
          size: 18.sp,
        ),
      );
    }

    if (isCurrent) {
      return Container(
        width: 34.w,
        height: 34.w,
        decoration: BoxDecoration(
          color: AppColors.orangeColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.orangeColor.withValues(alpha: 0.25),
              spreadRadius: 3,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          '$stepNumber',
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }

    return Container(
      width: 34.w,
      height: 34.w,
      decoration: BoxDecoration(
        color: AppColors.purple500.withValues(alpha: 0.14),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$stepNumber',
        style: TextStyles.caption.copyWith(
          fontFamily: AppFonts.Poppins,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
