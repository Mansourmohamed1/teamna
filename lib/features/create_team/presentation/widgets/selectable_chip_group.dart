import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class SelectableChipGroup extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<String> items;
  final Set<String> selectedItems;
  final ValueChanged<String> onItemToggle;

  const SelectableChipGroup({
    super.key,
    required this.title,
    this.titleStyle,
    required this.items,
    required this.selectedItems,
    required this.onItemToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: titleStyle ??
              TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.lightPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
        ),
        SizedBox(height: 10.h),
        Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: items.map((item) {
            final isSelected = selectedItems.contains(item);
            return GestureDetector(
              onTap: () => onItemToggle(item),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : AppColors.purple500.withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  item,
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: isSelected
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}