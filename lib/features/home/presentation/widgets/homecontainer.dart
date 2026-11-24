import 'package:flutter/widgets.dart';
import 'package:teamna/core/shared/widgets/custom_svg_image.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class Homecontainer extends StatelessWidget {
  const Homecontainer({
    super.key,
    required this.path,
    required this.title,
    required this.color,
    required this.number,
  });
  final String path;
  final String title;
  final Color color;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: CustomSvgImage(
                path: path,
                color: color,
                width: 5,
                height: 10,
              ),
            ),
          ),
          Text(
            '$number',
            style: TextStyles.title2.copyWith(color: AppColors.blackColor),
          ),
          Text(
            title,
            style: TextStyles.caption2.copyWith(
              color: AppColors.blackColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
