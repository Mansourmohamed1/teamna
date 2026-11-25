import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class SegmentedSelectorRow extends StatelessWidget {
  final String title;
  final List<String> options;
  final String selectedOption;
  final ValueChanged<String> onOptionSelected;

  const SegmentedSelectorRow({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.body.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.bordercl),
          ),
          child: Row(
            children: options.map((option) {
              final bool isSelected = selectedOption == option;
              return Expanded(
                child: GestureDetector(
                  onTap: () => onOptionSelected(option),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                    ),
                    child: Text(
                      option,
                      textAlign: TextAlign.center,
                      style: TextStyles.caption2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: isSelected
                            ? AppColors.whiteColor
                            : AppColors.lightPrimaryColor,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}