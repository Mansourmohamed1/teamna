import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:t2mna/core/theme/app_colors.dart';

class HandoffSubmittedAnimation extends StatelessWidget {
  final String lottieAssetPath;

  const HandoffSubmittedAnimation({
    super.key,
    required this.lottieAssetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210.w,
      height: 210.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 196.w,
            height: 196.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGreenColor,
            ),
          ),

          Container(
            width: 138.w,
            height: 138.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
          ),

          Lottie.asset(
            lottieAssetPath,
            width: 115.w,
            height: 115.w,
            fit: BoxFit.contain,
            repeat: true,
          ),
        ],
      ),
    );
  }
}