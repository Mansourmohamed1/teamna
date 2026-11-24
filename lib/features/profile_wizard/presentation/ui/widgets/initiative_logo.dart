import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_sizes.dart';

class InitiativeLogo extends StatelessWidget {
  final String path;
  final double size;
  final Color? backgroundColor;
  final double padding;

  const InitiativeLogo({
    super.key,
    required this.path,
    this.size = 44,
    this.backgroundColor,
    this.padding = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.r,
      height: size.r,
      padding: EdgeInsets.all(padding.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      ),
      child: Image.asset(
        path,
        fit: BoxFit.contain,
      ),
    );
  }
}