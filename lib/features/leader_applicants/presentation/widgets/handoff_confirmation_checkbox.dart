import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class HandoffConfirmationCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool> onChanged;

  const HandoffConfirmationCheckbox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
              color: value ? AppColors.orangeColor : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(AppSizes.radiusXs),
              border: Border.all(
                color: value ? AppColors.orangeColor : AppColors.blurcl,
                width: 1.5,
              ),
            ),
            child: value
                ? Icon(
                    Icons.check_rounded,
                    size: 16.sp,
                    color: AppColors.whiteColor,
                  )
                : null,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              label,
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.lightPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}