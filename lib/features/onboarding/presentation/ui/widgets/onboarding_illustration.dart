import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingIllustration extends StatelessWidget {
  final String imagePath;
    final double imageHeight;

  const OnboardingIllustration({super.key, required this.imagePath, required this.imageHeight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 60.h), 
        child: Image.asset(
          imagePath,
          height: imageHeight.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}