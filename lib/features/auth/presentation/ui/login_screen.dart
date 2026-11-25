import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/routes/routes_name.dart';
import 'package:t2mna/core/shared/widgets/app_text_field.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/core/validators/validation.dart';
import 'package:t2mna/features/auth/presentation/ui/widgets/auth_footer_link.dart';
import 'package:t2mna/features/auth/presentation/ui/widgets/divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
    Navigator.pushReplacementNamed(context, RouteNames.profileWizard);
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
            child: Image.asset('assets/images/Ellipse.png', width: 155.w),
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
                    SizedBox(height: 32.h),
                    Image.asset('assets/images/logllogin.png', height: 90.h),
                    SizedBox(height: 20.h),
                    Text(
                      'Welcome back',
                      style: TextStyles.headline2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    Text(
                      'Sign in and keep building with your team.',
                      style: TextStyles.caption2.copyWith(
                        fontFamily: AppFonts.Poppins,
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(height: AppSizes.xxl.h),
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
                      hint: 'Enter your password',
                      prefixIcon: Icons.lock_outline,
                      controller: _passwordController,
                      isPassword: true,
                      validator: (v) => AppValidators.required(
                        v,
                        message: 'Password is required',
                      ),
                    ),
                    SizedBox(height: AppSizes.md.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          /* TODO: forgot password */
                        },
                        child: Text(
                          'Forgot password?',
                          style: TextStyles.caption2.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.orangeColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: AppSizes.xl.h),
                    AppButton(text: 'Log in', onPressed: _onLogin),
                    SizedBox(height: AppSizes.lg.h),
                    const OrDivider(),
                    SizedBox(height: AppSizes.lg.h),
                    AppButton(
                      text: 'Continue with Google',
                      onPressed: () {
                        /* TODO: google sign in */
                      },
                      backgroundColor: AppColors.whiteColor,
                      foregroundColor: AppColors.primaryColor,
                      borderColor: AppColors.bordercl,
                    ),
                    SizedBox(height: AppSizes.xl.h),
                    AuthFooterLink(
                      text: 'New to t2mna?',
                      linkText: 'Create account',
                      onTap: () {
                        Navigator.pushNamed(context, '/register');
                      },
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
