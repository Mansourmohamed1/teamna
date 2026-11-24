import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/data/models/project_workspace.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/project_card.dart';
import 'package:t2mna/features/project_workspace/presentation/widgets/workspace_common_widgets.dart';

class WorkspaceBoard extends StatelessWidget {
  final List<CarpoolTask> tasks;
  final int selectedFilter;
  final ValueChanged<int> onFilterChanged;
  final VoidCallback onTaskChanged;
  final ValueChanged<CarpoolTask> onBlockTask;

  const WorkspaceBoard({
    super.key,
    required this.tasks,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onTaskChanged,
    required this.onBlockTask,
  });

  @override
  Widget build(BuildContext context) {
    final filtered = tasks.where((task) {
      if (selectedFilter == 0) return task.status == TaskStatus.todo;
      if (selectedFilter == 1) return task.status == TaskStatus.progress;
      if (selectedFilter == 2) return task.status == TaskStatus.blocked;
      return task.status == TaskStatus.done;
    }).toList();

    const labels = ['To Do · 4', 'In Progress · 3', 'Blocked · 1', 'Done · 12'];
    const headings = ['To Do', 'In Progress', 'Blocked', 'Done'];

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(AppDesign.padding, 13, AppDesign.padding, 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(labels.length, (index) {
                final active = selectedFilter == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 7),
                  child: ChoiceChip(
                    label: Text(labels[index]),
                    selected: active,
                    onSelected: (_) => onFilterChanged(index),
                    selectedColor: index == 2 ? AppColors.redColor : AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    labelStyle: TextStyles.caption2.copyWith(
                      color: active ? Colors.white : AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    side: BorderSide(color: active ? Colors.transparent :
                      AppColors.primaryColor.withValues(alpha: .13)),
                    showCheckmark: false,
                    shape: const StadiumBorder(),
                    visualDensity: VisualDensity.compact,
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Text(headings[selectedFilter], style: TextStyles.body.copyWith(
            color: AppColors.primaryColor, fontWeight: FontWeight.w700,
          )),
          const SizedBox(height: 9),
          if (filtered.isEmpty)
            const WorkspaceEmptyState(
              'No tasks here yet',
              'Tasks will appear here when their status changes.',
            )
          else
            ...filtered.map((task) => ProjectCard(
              task: task,
              onBlock: () => onBlockTask(task),
              onChanged: onTaskChanged,
            )),
        ],
      ),
    );
  }
}
