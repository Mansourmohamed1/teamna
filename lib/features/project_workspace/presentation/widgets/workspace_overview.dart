import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/overview_task_card.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class WorkspaceOverview extends StatelessWidget {
  final VoidCallback onSeeBoard;

  const WorkspaceOverview({super.key, required this.onSeeBoard});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    padding: EdgeInsets.fromLTRB(AppDesign.padding, 12, AppDesign.padding, 22),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -8, top: -28,
                child: Container(
                  width: 105, height: 105,
                  decoration: BoxDecoration(
                    color: AppColors.purple500.withValues(alpha: .65),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text('Sprint 2 · Week 3 of 8',
                      style: TextStyles.caption2.copyWith(color: Colors.white70)),
                    const Spacer(),
                    const WorkspacePill('On track', AppColors.orangeColor, Colors.white),
                  ]),
                  const SizedBox(height: 12),
                  Text('38% complete', style: TextStyles.title1.copyWith(
                    color: Colors.white, fontSize: 21,
                  )),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const LinearProgressIndicator(
                      value: .38,
                      minHeight: 6,
                      backgroundColor: Color(0xFF8D75C5),
                      valueColor: AlwaysStoppedAnimation(AppColors.orangeColor),
                    ),
                  ),
                  const SizedBox(height: 9),
                  Text('12 of 31 tasks done · 4 members active',
                    style: TextStyles.caption2.copyWith(color: Colors.white70)),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: onSeeBoard,
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: AppColors.lighRedColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.white,
                child: Icon(Icons.warning_amber_rounded, color: AppColors.redColor, size: 19),
              ),
              const SizedBox(width: 10),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1 task is blocked', style: TextStyles.caption.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w700,
                  )),
                  Text('Rider map is waiting on the Auth API',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.greyColor, fontSize: 10,
                    )),
                ],
              )),
              const Icon(Icons.chevron_right, color: AppColors.redColor),
            ]),
          ),
        ),
        const SizedBox(height: 18),
        WorkspaceSectionHeading('Due this week', action: 'See board', onAction: onSeeBoard),
        const SizedBox(height: 9),
        const OverviewTaskCard(
          title: 'Design rider booking screen',
          category: 'Design',
          owner: 'Hana',
          due: 'Thu',
          progress: .72,
          tagColor: Color(0xFFF9DCE8),
        ),
        const SizedBox(height: 17),
        const WorkspaceSectionHeading('Recent activity'),
        const SizedBox(height: 8),
        _ActivityRow('NA', 'Nour moved Login flow to Done', '2h', const Color(0xFFFFE6D1)),
        _ActivityRow('SM', 'Sara added 3 tasks to Sprint 2', '5h', const Color(0xFFECE4FA)),
      ],
    ),
  );
}

class _ActivityRow extends StatelessWidget {
  final String initials, text, time;
  final Color color;

  const _ActivityRow(this.initials, this.text, this.time, this.color);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 9),
    child: Row(children: [
      WorkspaceTinyAvatar(initials, color),
      const SizedBox(width: 8),
      Expanded(child: Text(text, style: TextStyles.caption2.copyWith(
        color: AppColors.greyColor, fontSize: 10,
      ))),
      Text(time, style: TextStyles.caption2.copyWith(
        color: AppColors.blurcl, fontSize: 9,
      )),
    ]),
  );
}
