import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/features/project_workspace/data/models/project_workspace.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/mark_blocked_sheet.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_board.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_handoffs.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_header.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_overview.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_tabs.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_team.dart';

class ProjectWorkspaceScreen extends StatefulWidget {
  const ProjectWorkspaceScreen({super.key});

  @override
  State<ProjectWorkspaceScreen> createState() => _ProjectWorkspaceScreenState();
}

class _ProjectWorkspaceScreenState extends State<ProjectWorkspaceScreen> {
  int selectedTab = 0;
  int selectedBoardFilter = 2;

  final List<CarpoolTask> tasks = [
    CarpoolTask('Rider live map screen', 'Flutter', 'Nour', 'Wed',
        TaskStatus.blocked, 'Awaiting Auth API',
        'Cannot load the rider profile until login tokens exist.'),
    CarpoolTask('Driver verification form', 'Flutter', 'Hana', 'Fri',
        TaskStatus.progress, '60% complete', ''),
    CarpoolTask('Firestore rules for rides', 'Back-End', 'Sara', 'Sat',
        TaskStatus.progress, '20% complete', ''),
    CarpoolTask('Design rider booking screen', 'Design', 'Hana', 'Thu',
        TaskStatus.todo, 'Not started', ''),
    CarpoolTask('Smoke test checklist', 'QA', 'Omar', 'Sun',
        TaskStatus.done, 'Completed', ''),
  ];

  void _showMessage(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value), behavior: SnackBarBehavior.floating),
    );
  }

  void _showBlockSheet(CarpoolTask task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => MarkBlockedSheet(
        task: task,
        onSave: (reason, note) {
          setState(() {
            task.status = TaskStatus.blocked;
            task.reason = reason;
            task.note = note;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            WorkspaceHeader(onOptionsTap: () => _showMessage('Project options')),
            WorkspaceTabs(
              selectedIndex: selectedTab,
              onChanged: (index) => setState(() => selectedTab = index),
            ),
            Expanded(
              child: IndexedStack(
                index: selectedTab,
                children: [
                  WorkspaceOverview(
                    onSeeBoard: () => setState(() => selectedTab = 2),
                  ),
                  WorkspaceTeam(onMessage: _showMessage),
                  WorkspaceBoard(
                    tasks: tasks,
                    selectedFilter: selectedBoardFilter,
                    onFilterChanged: (index) =>
                        setState(() => selectedBoardFilter = index),
                    onTaskChanged: () => setState(() {}),
                    onBlockTask: _showBlockSheet,
                  ),
                  const WorkspaceHandoffs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
