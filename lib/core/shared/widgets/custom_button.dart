import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
=======
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
>>>>>>> origin/dev

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
<<<<<<< HEAD
  final double? width;
  final double? height;
  final TextStyle? textStyle;
=======
  final Color? borderColor;
>>>>>>> origin/dev

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
<<<<<<< HEAD
    this.width,
    this.height,
    this.textStyle,
=======
    this.borderColor,
>>>>>>> origin/dev
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
<<<<<<< HEAD
      width: width ?? AppSizes.buttonWidth,
      height: height ?? AppSizes.buttonHeight,
=======
      width: AppSizes.buttonWidth,
      height: AppSizes.buttonHeight,
>>>>>>> origin/dev
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          foregroundColor: foregroundColor ?? AppColors.whiteColor,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
<<<<<<< HEAD
=======
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : BorderSide.none,
>>>>>>> origin/dev
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
<<<<<<< HEAD
              style:
                  textStyle ??
                  TextStyles.body.copyWith(
                    fontFamily: AppFonts.Poppins,
                    fontWeight: FontWeight.w500,
                    color: foregroundColor ?? AppColors.whiteColor,
                  ),
=======
              style: TextStyles.body.copyWith(
                fontFamily: AppFonts.Poppins,
                fontWeight: FontWeight.w500,
                color: foregroundColor ?? AppColors.whiteColor,
              ),
>>>>>>> origin/dev
            ),
          ],
        ),
      ),
    );
  }
}
