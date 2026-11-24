import 'package:flutter/material.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class HomeBanner extends StatelessWidget {
  final VoidCallback? onSeeMatches;
  const HomeBanner({super.key, this.onSeeMatches});
  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: BorderRadius.circular(22),
    child: SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Container(color: AppColors.primaryColor),
          Positioned(
            top: -35,
            right: -16,
            child: Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                color: AppColors.purple500,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: -20,
            right: -4,
            child: Container(
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                color: AppColors.orangeColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: 17,
            top: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready to build?',
                  style: TextStyles.title2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  '3 new projects match your Flutter + Firebase stack.',
                  style: TextStyles.caption2.copyWith(
                    color: Colors.white.withValues(alpha: .85),
                  ),
                ),
                const SizedBox(height: 12),
                AppButton(
                  text: 'See matches',
                  onPressed: onSeeMatches ?? () {},
                  backgroundColor: AppColors.orangeColor,
                  foregroundColor: Colors.white,
                  width: 112,
                  height: 36,
                  textStyle: TextStyles.caption2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
