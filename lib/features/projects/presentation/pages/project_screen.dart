import 'package:flutter/material.dart';
import 'package:teamna/core/constants/app_design.dart';
import 'package:teamna/core/shared/widgets/custom_search_bar.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import '../../data/project_model.dart';
import '../widgets/project_card.dart';
import '../widgets/project_filters_sheet.dart';
import 'project_details_screen.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});
  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  int selectedTapIndex = 0;
  String search = '';
  final filters = ['All', 'Needs Flutter', 'DEPI Round 7', 'Remote'];
  List<ProjectModel> get visibleProjects => demoProjects.where((p) {
    final q = search.toLowerCase();
    final matchesSearch =
        p.title.toLowerCase().contains(q) ||
        p.description.toLowerCase().contains(q) ||
        p.stack.join(' ').toLowerCase().contains(q);
    final matchesFilter =
        selectedTapIndex == 0 ||
        (selectedTapIndex == 1
            ? p.roles.any((r) => r.toLowerCase().contains('flutter'))
            : selectedTapIndex == 2
            ? p.category == 'DEPI'
            : true);
    return matchesSearch && matchesFilter;
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppDesign.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Explore projects',
                style: TextStyles.headline2.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              CustomSearchBar(
                hintText: 'Search projects, roles or stacks',
                onChanged: (v) => setState(() => search = v),
                onFilterTap: _showFilters,
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: 38,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 7),
                  itemBuilder: (_, i) => ChoiceChip(
                    label: Text(filters[i]),
                    selected: selectedTapIndex == i,
                    onSelected: (_) => setState(() => selectedTapIndex = i),
                    selectedColor: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                    labelStyle: TextStyles.caption2.copyWith(
                      color: selectedTapIndex == i
                          ? Colors.white
                          : AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                    side: BorderSide(
                      color: selectedTapIndex == i
                          ? AppColors.primaryColor
                          : AppColors.primaryColor.withValues(alpha: .15),
                    ),
                    shape: const StadiumBorder(),
                    showCheckmark: false,
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ),
              const SizedBox(height: 17),
              Row(
                children: [
                  Text(
                    '${visibleProjects.length == 0 ? 0 : 24} projects found',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.blurcl,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Best match',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Expanded(
                child: visibleProjects.isEmpty
                    ? const Center(child: Text('No projects found'))
                    : ListView.separated(
                        itemCount: visibleProjects.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 13),
                        itemBuilder: (context, index) {
                          final project = visibleProjects[index];
                          return ProjectCard(
                            project: project,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    ProjectDetailsScreen(project: project),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFilters() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      builder: (context) => const ProjectFiltersSheet(),
    );
  }
}
