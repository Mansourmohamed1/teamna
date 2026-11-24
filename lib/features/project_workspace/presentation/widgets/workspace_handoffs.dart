import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/handoff_card.dart';

class WorkspaceHandoffs extends StatelessWidget {
  const WorkspaceHandoffs({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(AppDesign.padding, 14, AppDesign.padding, 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(13),
          decoration: BoxDecoration(
            color: const Color(0xFFECE4FA),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.sync, color: AppColors.primaryColor, size: 20),
              const SizedBox(width: 10),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nothing gets lost', style: TextStyles.caption2.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w700,
                  )),
                  const SizedBox(height: 3),
                  Text(
                    'Every member who leaves files a handoff, and their seat goes back to the marketplace.',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.greyColor, height: 1.4, fontSize: 10,
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
        const SizedBox(height: 13),
        const HandoffCard(
          initials: 'KA',
          name: 'Karim Ahmed',
          subtitle: 'Left on 12 Nov · Flutter Dev',
          branch: 'feature/map-routes',
          completed: 'Rider screens and onboarding',
          blocker: 'Needs the Maps API key from Sara',
          seat: 'Seat reopened',
          avatarColor: Color(0xFFFFE6D1),
        ),
        const SizedBox(height: 12),
        const HandoffCard(
          initials: 'YT',
          name: 'Youssef Tarek',
          subtitle: 'Left on 28 Oct · QA',
          branch: 'qa/test-plan',
          completed: 'Smoke test checklist',
          blocker: '',
          seat: 'Seat reopened',
          avatarColor: Color(0xFFDCE9FC),
        ),
      ],
    ),
  );
}
