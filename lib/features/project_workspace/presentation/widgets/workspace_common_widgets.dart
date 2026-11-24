import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class WorkspacePill extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;

  const WorkspacePill(this.text, this.background, this.foreground, {super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text, style: TextStyles.caption2.copyWith(
      color: foreground, fontSize: 9, fontWeight: FontWeight.w600,
    )),
  );
}

class WorkspaceTinyAvatar extends StatelessWidget {
  final String initials;
  final Color color;
  final double size;

  const WorkspaceTinyAvatar(this.initials, this.color, {super.key, this.size = 23});

  @override
  Widget build(BuildContext context) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    alignment: Alignment.center,
    child: Text(initials, style: TextStyle(
      fontSize: size < 25 ? 8 : 10,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w700,
    )),
  );
}

class WorkspaceSectionHeading extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;

  const WorkspaceSectionHeading(
    this.title, {super.key, this.action, this.onAction}
  );

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Text(title, style: TextStyles.body.copyWith(
        color: AppColors.primaryColor, fontSize: 14, fontWeight: FontWeight.w700,
      )),
      const Spacer(),
      if (action != null)
        TextButton(
          onPressed: onAction,
          child: Text(action!, style: TextStyles.caption2.copyWith(
            color: AppColors.orangeColor, fontWeight: FontWeight.w600,
          )),
        ),
    ],
  );
}

class WorkspaceEmptyState extends StatelessWidget {
  final String title;
  final String subtitle;

  const WorkspaceEmptyState(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Column(
      children: [
        const Icon(Icons.inbox_outlined, color: AppColors.blurcl, size: 30),
        const SizedBox(height: 8),
        Text(title, style: TextStyles.caption.copyWith(
          color: AppColors.primaryColor, fontWeight: FontWeight.w700,
        )),
        const SizedBox(height: 4),
        Text(subtitle, textAlign: TextAlign.center,
          style: TextStyles.caption2.copyWith(color: AppColors.greyColor)),
      ],
    ),
  );
}
