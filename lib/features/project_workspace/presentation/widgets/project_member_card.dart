import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class ProjectMemberCard extends StatelessWidget {
  final String initials, name, role, badge, status;
  final Color avatarColor;
  final bool verified;
  final ValueChanged<String> onAction;

  const ProjectMemberCard({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
    required this.badge,
    required this.status,
    required this.avatarColor,
    required this.verified,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 9),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
    child: Row(children: [
      CircleAvatar(
        radius: 18,
        backgroundColor: avatarColor,
        child: Text(initials, style: TextStyles.caption.copyWith(
          color: AppColors.primaryColor, fontWeight: FontWeight.w700,
        )),
      ),
      const SizedBox(width: 10),
      Expanded(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: TextStyles.caption.copyWith(
            color: AppColors.primaryColor, fontWeight: FontWeight.w700,
          )),
          const SizedBox(height: 3),
          Text(role, style: TextStyles.caption2.copyWith(
            color: AppColors.blurcl,
          )),
        ],
      )),
      if (badge.isNotEmpty) ...[
        const WorkspacePill('Leader', Color(0xFFFFEFC9), AppColors.orangeColor),
        const SizedBox(width: 5),
      ],
      WorkspacePill(
        status,
        verified ? AppColors.lightGreenColor : const Color(0xFFFFEFC9),
        verified ? AppColors.greenColor : AppColors.orangeColor,
      ),
      PopupMenuButton<String>(
        icon: const Icon(Icons.more_horiz, color: AppColors.blurcl, size: 19),
        onSelected: onAction,
        itemBuilder: (_) => const [
          PopupMenuItem(value: 'View profile', child: Text('View profile')),
          PopupMenuItem(value: 'Send message', child: Text('Send message')),
          PopupMenuItem(value: 'Remove member', child: Text('Remove member')),
        ],
      ),
    ]),
  );
}
