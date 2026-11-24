import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import '../../data/project_model.dart';

class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback onTap;
  const ProjectCard({super.key, required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _pill(
                    project.category,
                    AppColors.lightPrimaryColor.withValues(alpha: .12),
                    AppColors.primaryColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    project.age,
                    style: TextStyles.caption.copyWith(
                      color: AppColors.blurcl,
                    ),
                  ),
                  const Spacer(),
                  _pill(
                    '✓  ${project.match}',
                    AppColors.lightGreenColor,
                    AppColors.greenColor,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: TextStyles.subtitle.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                project.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.caption.copyWith(
                  color: AppColors.greyColor,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: project.roles.map((r) => _tag(r)).toList(),
              ),
              const SizedBox(height: 13),
              Row(
                children: [
                  _avatar('SM', const Color(0xFFEFE5FF)),
                  Transform.translate(
                    offset: const Offset(-7, 0),
                    child: _avatar('KA', const Color(0xFFFFE7D2)),
                  ),
                  Transform.translate(
                    offset: const Offset(-14, 0),
                    child: _avatar('+2', const Color(0xFFD7F1EA)),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '${project.members} of ${project.totalMembers}',
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.schedule, size: 14, color: AppColors.blurcl),
                  const SizedBox(width: 4),
                  Text(
                    project.commitment,
                    style: TextStyles.caption2.copyWith(
                      color: AppColors.blurcl,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pill(String text, Color bg, Color fg) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: TextStyles.caption2.copyWith(
        color: fg,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  Widget _tag(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryColor.withValues(alpha: .18)),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      '•  $text',
      style: TextStyles.caption2.copyWith(
        color: AppColors.primaryColor,
        fontSize: 10,
      ),
    ),
  );
  Widget _avatar(String text, Color color) => Container(
    width: 25,
    height: 25,
    margin: EdgeInsets.zero,
    decoration: BoxDecoration(
      color: color,
      shape: BoxShape.circle,
      border: Border.all(color: Colors.white, width: 2),
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryColor,
      ),
    ),
  );
}
