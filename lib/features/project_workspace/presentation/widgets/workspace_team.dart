import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/project_member_card.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class WorkspaceTeam extends StatelessWidget {
  final ValueChanged<String> onMessage;

  const WorkspaceTeam({super.key, required this.onMessage});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(AppDesign.padding, 14, AppDesign.padding, 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text('4 of 5 members', style: TextStyles.caption2.copyWith(color: AppColors.greyColor)),
          const Spacer(),
          TextButton(
            onPressed: () => onMessage('Invite link copied'),
            child: Text('Invite', style: TextStyles.caption2.copyWith(
              color: AppColors.orangeColor, fontWeight: FontWeight.w700,
            )),
          ),
        ]),
        ProjectMemberCard(
          initials: 'SM', name: 'Sara Mostafa', role: 'UI/UX · Leader',
          badge: 'Leader', status: 'Verified', avatarColor: const Color(0xFFECE4FA),
          verified: true, onAction: (value) => onMessage('$value · Sara Mostafa'),
        ),
        ProjectMemberCard(
          initials: 'NA', name: 'Nour Adel', role: 'Flutter Dev',
          badge: '', status: 'Verified', avatarColor: const Color(0xFFFFE6D1),
          verified: true, onAction: (value) => onMessage('$value · Nour Adel'),
        ),
        ProjectMemberCard(
          initials: 'HM', name: 'Hana Mahmoud', role: 'Flutter Dev',
          badge: '', status: 'Pending', avatarColor: const Color(0xFFDCE9FC),
          verified: false, onAction: (value) => onMessage('$value · Hana Mahmoud'),
        ),
        ProjectMemberCard(
          initials: 'OS', name: 'Omar Samir', role: 'QA',
          badge: '', status: 'Verified', avatarColor: const Color(0xFFFFF0C9),
          verified: true, onAction: (value) => onMessage('$value · Omar Samir'),
        ),
        const SizedBox(height: 4),
        InkWell(
          onTap: () => onMessage('Invite a back-end engineer to Campus Carpool'),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: .65),
              border: Border.all(color: AppColors.purple500, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFFFE6D1),
                child: Icon(Icons.add, color: AppColors.orangeColor),
              ),
              const SizedBox(width: 10),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Back-End Engineer', style: TextStyles.caption2.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w700,
                  )),
                  Text('Open seat · reopened after handoff',
                    style: TextStyles.caption2.copyWith(color: AppColors.blurcl, fontSize: 10)),
                ],
              )),
              const WorkspacePill('Share', Color(0xFFECE4FA), AppColors.primaryColor),
            ]),
          ),
        ),
      ],
    ),
  );
}
