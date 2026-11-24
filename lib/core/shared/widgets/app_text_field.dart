import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _obscure = widget.isPassword;

  OutlineInputBorder get _border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        borderSide: const BorderSide(color: AppColors.bordercl),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w500,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscure,
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          style: TextStyles.caption.copyWith(fontFamily: AppFonts.Poppins),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyles.caption.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.blurcl,
            ),
            filled: true,
            fillColor: AppColors.whiteColor,
            contentPadding: const EdgeInsets.symmetric(vertical: AppSizes.lg),
            prefixIcon: Icon(
              widget.prefixIcon,
              size: AppSizes.iconMedium,
              color: AppColors.greyColor,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () => setState(() => _obscure = !_obscure),
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: AppSizes.iconMedium,
                      color: AppColors.greyColor,
                    ),
                  )
                : null,
            enabledBorder: _border,
            focusedBorder: _border.copyWith(
              borderSide: const BorderSide(color: AppColors.primaryColor),
            ),
            errorBorder: _border.copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
            focusedErrorBorder: _border.copyWith(
              borderSide: const BorderSide(color: AppColors.redColor),
            ),
          ),
        ),
      ],
    );
  }
}