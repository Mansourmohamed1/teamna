import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/app_text_field.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/core/validators/validation.dart';
import 'package:t2mna/features/auth/presentation/ui/widgets/auth_footer_link.dart';
import 'package:t2mna/features/auth/presentation/ui/widgets/checkbox.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreed = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    final isValid = _formKey.currentState!.validate();

    if (!_agreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the Terms and Privacy Policy'),
        ),
      );
      return;
    }

    if (isValid) {
      // TODO: register logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset('assets/image/Ellipse (1).png', width: 150.w),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.screenHorizontalPadding,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: AppSizes.radiusXxl.h),
                    GestureDetector(
                      onTap: () => Navigator.maybePop(context),
                      child: Container(
                        width: 36.r,
                        height: 36.r,
                        decoration: const BoxDecoration(
                          color: AppColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: AppSizes.iconMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.xl.h),
                    Text(
                      'Create your account',
                      style: TextStyles.headline2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    Text(
                      'Join Egyptian developers building real projects together.',
                      style: TextStyles.caption2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(height: AppSizes.xl.h),
                    AppTextField(
                      label: 'Full name',
                      hint: 'Your full name',
                      prefixIcon: Icons.person_outline,
                      controller: _nameController,
                      validator: (v) => AppValidators.required(
                        v,
                        message: 'Enter your full name',
                      ),
                    ),
                    SizedBox(height: AppSizes.lg.h),
                    AppTextField(
                      label: 'Email',
                      hint: 'you@example.com',
                      prefixIcon: Icons.mail_outline,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: AppValidators.email,
                    ),
                    SizedBox(height: AppSizes.lg.h),
                    AppTextField(
                      label: 'Password',
                      hint: 'At least 8 characters',
                      prefixIcon: Icons.lock_outline,
                      controller: _passwordController,
                      isPassword: true,
                      validator: (v) => AppValidators.password(v, minLength: 8),
                    ),
                    SizedBox(height: AppSizes.lg.h),
                    TermsCheckbox(
                      value: _agreed,
                      onChanged: (v) => setState(() => _agreed = v),
                    ),
                    SizedBox(height: AppSizes.lg.h),
                    AppButton(
                      text: 'Create account',
                      onPressed: _onRegister,
                      backgroundColor: AppColors.orangeColor,
                    ),
                    SizedBox(height: AppSizes.lg.h),
                    AuthFooterLink(
                      text: 'Already have an account?',
                      linkText: 'Log in',
                      onTap: () => Navigator.maybePop(context),
                    ),
                    SizedBox(height: AppSizes.xl.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}