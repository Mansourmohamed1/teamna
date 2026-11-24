import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class CustomLabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final int maxLines;
  final String? Function(String?)? validator;

  const CustomLabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.prefixIcon,
    this.maxLines = 1,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.lightPrimaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: AppSizes.sm.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          validator: validator,
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.blackColor,
            height: 1.5,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyles.caption.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.blurcl,
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: AppColors.blurcl,
                    size: AppSizes.iconMedium.sp,
                  )
                : null,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSizes.lg.w,
              vertical: maxLines > 1 ? AppSizes.lg.h : 14.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              borderSide: const BorderSide(color: AppColors.bordercl),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              borderSide: const BorderSide(color: AppColors.bordercl),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
          ),
        ),
      ],
    );
  }
}