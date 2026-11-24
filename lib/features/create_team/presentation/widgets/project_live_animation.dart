import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ProjectLiveAnimation extends StatelessWidget {
  final String lottieAssetPath;

  const ProjectLiveAnimation({super.key, required this.lottieAssetPath});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      lottieAssetPath,
      width: 220.w,
      height: 220.w,
      fit: BoxFit.contain,
      repeat: true,
    );
  }
}
