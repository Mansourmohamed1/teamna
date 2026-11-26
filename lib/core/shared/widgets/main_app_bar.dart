
import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;


  final Widget? leading;
  final VoidCallback? onLeadingPressed;
  final bool showLeading;


  final Widget? action;
  final VoidCallback? onActionPressed;
  final bool showAction;


  final double height;
  final bool centerTitle;

  const MainAppBar({
    required this.title,
    this.leading,
    this.onLeadingPressed,
    this.showLeading = true,
    this.action,
    this.onActionPressed,
    this.showAction = true,
    this.height = 60,
    this.centerTitle = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:AppColors.backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leadingWidth: showLeading ? 56 : 0,

      leading: showLeading
          ? Padding(
              padding: const EdgeInsets.only(left: 8),
              child: _roundButton(
                child: leading ??
                    const Icon(Icons.arrow_back),
                onTap: onLeadingPressed ??
                    () => Navigator.maybePop(context),
              ),
            )
          : null,

      title: Text(
        title,
        style: TextStyles.body.copyWith(
          color: AppColors.blackColor,
        ),
      ),

      actions: showAction
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: _roundButton(
                  child: action ??
                      const Icon(Icons.star_border),
                  onTap: onActionPressed,
                ),
              ),
            ]
          : null,
    );
  }

  Widget _roundButton({
    required Widget child,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 42,
          height: 42,
          child: Center(
            child: IconTheme(
              data: IconThemeData(
                color: AppColors.primaryColor,
                size: 20,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
