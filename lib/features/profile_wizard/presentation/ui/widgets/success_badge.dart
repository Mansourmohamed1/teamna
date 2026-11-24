import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/theme/app_colors.dart';

class SuccessBadge extends StatelessWidget {
  const SuccessBadge({super.key});

  Widget _circle(double size, Color color) => Container(
        width: size.r,
        height: size.r,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _circle(190, AppColors.primaryColor.withValues(alpha: 0.08)),
        _circle(150, AppColors.primaryColor.withValues(alpha: 0.14)),
        _circle(108, AppColors.whiteColor),
       
        Icon(Icons.verified_user_outlined,
            size: 44.r, color: AppColors.primaryColor),
      ],
    );
  }
}