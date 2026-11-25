import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: false,
    
      leadingWidth: 56,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: _roundIcon(Icons.arrow_back, () => Navigator.pop(context)),
      ),
    
      title: Text(
        "title",
        style: TextStyles.body.copyWith(color: AppColors.blackColor),
      ),
    
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: _roundIcon(Icons.star_border, () {}),
        ),
      ],
    );
  }
  Widget _roundIcon(IconData icon, VoidCallback tap) => Material(
    color: Colors.white,
    shape: const CircleBorder(),
    child: InkWell(
      onTap: tap,
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: 42,
        height: 42,
        child: Icon(icon, color: AppColors.primaryColor, size: 20),
      ),
    ),
  );

  @override

  Size get preferredSize => const Size.fromHeight(60);

}
