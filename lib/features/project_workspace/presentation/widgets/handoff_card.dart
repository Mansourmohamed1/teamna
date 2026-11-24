import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class HandoffCard extends StatelessWidget {
  final String initials, name, subtitle, branch, completed, blocker, seat;
  final Color avatarColor;

  const HandoffCard({
    super.key,
    required this.initials,
    required this.name,
    required this.subtitle,
    required this.branch,
    required this.completed,
    required this.blocker,
    required this.seat,
    required this.avatarColor,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
      boxShadow: [BoxShadow(
        color: Colors.black.withValues(alpha: .04),
        blurRadius: 12, offset: const Offset(0, 4),
      )],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          WorkspaceTinyAvatar(initials, avatarColor, size: 32),
          const SizedBox(width: 9),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyles.caption.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.w700,
              )),
              Text(subtitle, style: TextStyles.caption2.copyWith(
                color: AppColors.blurcl,
              )),
            ],
          )),
          WorkspacePill(seat, AppColors.lightGreenColor, AppColors.greenColor),
        ]),
        const SizedBox(height: 12),
        _DetailLine(Icons.call_split, 'Branch', branch),
        const SizedBox(height: 8),
        _DetailLine(Icons.check, 'Completed', completed),
        if (blocker.isNotEmpty) ...[
          const SizedBox(height: 8),
          _DetailLine(Icons.warning_amber_outlined, 'Blockers', blocker),
        ],
      ],
    ),
  );
}

class _DetailLine extends StatelessWidget {
  final IconData icon;
  final String label, value;

  const _DetailLine(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(icon, size: 14, color: AppColors.blurcl),
      const SizedBox(width: 8),
      SizedBox(width: 70, child: Text(label, style: TextStyles.caption2.copyWith(
        color: AppColors.blurcl,
      ))),
      Expanded(child: Text(value, style: TextStyles.caption2.copyWith(
        color: AppColors.primaryColor, fontWeight: FontWeight.w600,
      ))),
    ],
  );
}
