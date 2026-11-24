import 'package:flutter/material.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Color(0xFFFFE5CD),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          'NA',
          style: TextStyles.caption2.copyWith(
            color: AppColors.orangeColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      const SizedBox(width: 11),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good morning,',
            style: TextStyles.caption2.copyWith(color: AppColors.blurcl),
          ),
          Text(
            'Nour Adel',
            style: TextStyles.body.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      const Spacer(),
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none,
            color: AppColors.primaryColor,
            size: 21,
          ),
        ),
      ),
    ],
  );
}
