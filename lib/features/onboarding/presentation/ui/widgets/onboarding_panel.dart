import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:t2mna/core/constants/app_duration.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/onboarding/presentation/ui/widgets/onboarding_dots.dart';


class OnboardingBottomPanel extends StatelessWidget {
  final double height;
  final String title;
  final String description;
  final int currentIndex;
  final int count;
  final String buttonText;
  final VoidCallback onPressed;

  const OnboardingBottomPanel({
    super.key,
    required this.height,
    required this.title,
    required this.description,
    required this.currentIndex,
    required this.count,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AppDurations.normal,
      curve: Curves.easeInOut,
      height: height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset('assets/icons/panel 1.svg', fit: BoxFit.fill),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSizes.screenHorizontalPadding,
              0,
              AppSizes.screenHorizontalPadding,
              AppSizes.xxl,
            ),
            child: Column(
              children: [
                const Spacer(flex: 2),
                OnboardingDots(count: count, currentIndex: currentIndex),
                SizedBox(height: AppSizes.lg.h),
                Expanded(
                  flex: 6,
                  child: AnimatedSwitcher(
                    duration: AppDurations.fast,
                    child: Align(
                      key: ValueKey(currentIndex),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyles.title2.copyWith(
                              fontFamily: AppFonts.Poppins,
                              color: AppColors.whiteColor,
                              height: 1.3,
                            ),
                          ),
                          SizedBox(height: AppSizes.sm.h),
                          Text(
                            description,
                            style: TextStyles.caption2.copyWith(
                              fontFamily: AppFonts.Poppins,
                              color: AppColors.blackColor2.withOpacity(0.7),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AppButton(
                  text: buttonText,
                  onPressed: onPressed,
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.orangeColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}