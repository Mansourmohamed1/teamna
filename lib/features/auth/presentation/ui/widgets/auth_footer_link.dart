import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class AuthFooterLink extends StatelessWidget {
  final String text;      
  final String linkText;  
  final VoidCallback onTap;

  const AuthFooterLink({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final base = TextStyles.caption2.copyWith(
      fontFamily: AppFonts.Poppins,
      color: AppColors.greyColor,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$text ', style: base),
        GestureDetector(
          onTap: onTap,
          child: Text(
            linkText,
            style: base.copyWith(
              color: AppColors.orangeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}