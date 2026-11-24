import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_duration.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class SegmentedSelector extends StatelessWidget {
  final List<String> options;
  final String selected;
  final ValueChanged<String> onChanged;

  const SegmentedSelector({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.xs),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: Row(
        children: options.map((o) {
          final isSelected = o == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(o),
              child: AnimatedContainer(
                duration: AppDurations.fast,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                child: Text(
                  o,
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.whiteColor : AppColors.greyColor,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}