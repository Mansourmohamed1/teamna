import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class OverviewTaskCard extends StatelessWidget {
  final String title;
  final String category;
  final String owner;
  final String due;
  final double progress;
  final Color tagColor;

  const OverviewTaskCard({
    super.key,
    required this.title,
    required this.category,
    required this.owner,
    required this.due,
    required this.progress,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(
        color: Colors.black.withValues(alpha: .04),
        blurRadius: 12,
        offset: const Offset(0, 4),
      )],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          WorkspacePill(category, tagColor, AppColors.orangeColor),
          const Spacer(),
          const Icon(Icons.more_horiz, color: AppColors.blurcl, size: 18),
        ]),
        const SizedBox(height: 8),
        Text(title, style: TextStyles.caption2.copyWith(
          color: AppColors.primaryColor, fontWeight: FontWeight.w700,
        )),
        const SizedBox(height: 9),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 5,
            backgroundColor: const Color(0xFFECE4FA),
            valueColor: const AlwaysStoppedAnimation(AppColors.purple500),
          ),
        ),
        const SizedBox(height: 8),
        Row(children: [
          const WorkspaceTinyAvatar('HM', Color(0xFFDCE9FC)),
          const SizedBox(width: 5),
          Text(owner, style: TextStyles.caption2.copyWith(
            color: AppColors.blurcl, fontSize: 10,
          )),
          const Spacer(),
          const Icon(Icons.calendar_today_outlined, size: 11, color: AppColors.blurcl),
          const SizedBox(width: 4),
          Text(due, style: TextStyles.caption2.copyWith(
            color: AppColors.blurcl, fontSize: 10,
          )),
        ]),
      ],
    ),
  );
}
