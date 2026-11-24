import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/data/models/project_workspace.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class ProjectCard extends StatelessWidget {
  final CarpoolTask task;
  final VoidCallback onBlock;
  final VoidCallback onChanged;

  const ProjectCard({
    super.key,
    required this.task,
    required this.onBlock,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 11),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: task.status == TaskStatus.blocked
        ? Border.all(color: AppColors.redColor, width: 1.2) : null,
      boxShadow: [BoxShadow(
        color: Colors.black.withValues(alpha: .025),
        blurRadius: 10, offset: const Offset(0, 3),
      )],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          WorkspacePill(task.category, const Color(0xFFECE4FA), AppColors.primaryColor),
          const Spacer(),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_horiz, color: AppColors.blurcl, size: 19),
            onSelected: (value) {
              if (value == 'Block task') {
                onBlock();
              } else if (value == 'Mark done') {
                task.status = TaskStatus.done;
                onChanged();
              } else if (value == 'Move to progress') {
                task.status = TaskStatus.progress;
                onChanged();
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(value: 'Move to progress', child: Text('Move to progress')),
              PopupMenuItem(value: 'Block task', child: Text('Mark as blocked')),
              PopupMenuItem(value: 'Mark done', child: Text('Mark as done')),
            ],
          ),
        ]),
        Text(task.title, style: TextStyles.caption.copyWith(
          color: AppColors.primaryColor, fontWeight: FontWeight.w700,
        )),
        if (task.status == TaskStatus.blocked) ...[
          const SizedBox(height: 9),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.lighRedColor,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.warning_amber_rounded, color: AppColors.redColor, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Blocked · ${task.reason}', style: TextStyles.caption2.copyWith(
                      color: AppColors.redColor, fontWeight: FontWeight.w700,
                    )),
                    Text(task.note, style: TextStyles.caption2.copyWith(
                      color: AppColors.greyColor, fontSize: 10,
                    )),
                  ],
                )),
              ],
            ),
          ),
        ] else ...[
          const SizedBox(height: 9),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: task.status == TaskStatus.done ? 1 : task.status == TaskStatus.progress ? .48 : 0,
              minHeight: 5,
              backgroundColor: const Color(0xFFECE4FA),
              valueColor: const AlwaysStoppedAnimation(AppColors.purple500),
            ),
          ),
        ],
        const SizedBox(height: 8),
        Row(children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: const Color(0xFFFFE6D1),
            child: Text(task.owner.substring(0, 1),
              style: const TextStyle(fontSize: 9, color: AppColors.orangeColor)),
          ),
          const SizedBox(width: 6),
          Text(task.owner, style: TextStyles.caption2.copyWith(
            color: AppColors.blurcl, fontSize: 10,
          )),
          const Spacer(),
          const Icon(Icons.calendar_today_outlined, size: 11, color: AppColors.blurcl),
          const SizedBox(width: 4),
          Text(task.due, style: TextStyles.caption2.copyWith(
            color: AppColors.blurcl, fontSize: 10,
          )),
        ]),
        if (task.status == TaskStatus.blocked)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onBlock,
              child: Text('Update blocker', style: TextStyles.caption2.copyWith(
                color: AppColors.redColor, fontWeight: FontWeight.w700,
              )),
            ),
          ),
      ],
    ),
  );
}
