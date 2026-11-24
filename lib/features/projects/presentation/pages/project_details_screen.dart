import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import '../../data/project_model.dart';
import 'apply_project_screen.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final ProjectModel project;
  const ProjectDetailsScreen({super.key, required this.project});
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
              Row(
                children: [
                  _roundIcon(Icons.arrow_back, () => Navigator.pop(context)),
                  const Spacer(),
                  Text(
                    'Project',
                    style: TextStyles.body.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  const Spacer(),
                  _roundIcon(Icons.star_border, () {}),
                ],
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 7,
                children: [
                  _tag(
                    project.category,
                    AppColors.primaryColor.withValues(alpha: .1),
                    AppColors.primaryColor,
                  ),
                  _tag(
                    'Building',
                    const Color(0xFFFFE6D1),
                    AppColors.orangeColor,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                project.title,
                style: TextStyles.headline1.copyWith(
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                project.description,
                style: TextStyles.body.copyWith(
                  color: AppColors.greyColor,
                  height: 1.45,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFFEFE5FF),
                      child: Text(
                        project.leader
                            .split(' ')
                            .map((e) => e[0])
                            .take(2)
                            .join(),
                        style: TextStyles.caption,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.leader,
                            style: TextStyles.body.copyWith(
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Team leader · ${project.category} Round 7',
                            style: TextStyles.caption.copyWith(
                              color: AppColors.greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (project.verified)
                      _tag(
                        '✓ Verified',
                        AppColors.lightGreenColor,
                        AppColors.greenColor,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              _sectionTitle('Tech stack'),
              const SizedBox(height: 8),
              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: project.stack
                    .map((s) => _tag(s, AppColors.primaryColor, Colors.white))
                    .toList(),
              ),
              const SizedBox(height: 18),
              _sectionTitle('Open roles'),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.separated(
                  itemCount: project.openRoles.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 9),
                  itemBuilder: (context, i) {
                    final role = project.openRoles[i];
                    return Container(
                      padding: EdgeInsets.all(AppDesign.padding),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: role.filled
                                  ? AppColors.lightGreenColor
                                  : const Color(0xFFFFE8D6),
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Icon(
                              role.filled ? Icons.check : Icons.code,
                              color: role.filled
                                  ? AppColors.greenColor
                                  : AppColors.orangeColor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  role.title,
                                  style: TextStyles.body.copyWith(
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  role.commitment +
                                      (role.filled ? ' · Active' : ' · Open'),
                                  style: TextStyles.caption.copyWith(
                                    color: AppColors.blurcl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (role.filled)
                            _tag(
                              'Filled',
                              AppColors.lightGreenColor,
                              AppColors.greenColor,
                            )
                          else
                            SizedBox(
                              height: 36,
                              child: AppButton(
                                text: 'Apply',
                                width: 80,
                                height:35,
                                textStyle: TextStyles.caption.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                backgroundColor: AppColors.orangeColor,
                                foregroundColor: AppColors.whiteColor,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ApplyProjectScreen(
                                        project: project,
                                        role: role,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                height: 50,
                  child: AppButton(
                  text: 'Apply to join',
                  backgroundColor: AppColors.orangeColor,
                  foregroundColor: AppColors.whiteColor,
                  textStyle: TextStyles.body.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ApplyProjectScreen(
                          project: project,
                          role: project.openRoles.first,
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

  Widget _roundIcon(IconData icon, VoidCallback tap) => Material(
    color: Colors.white,
    shape: const CircleBorder(),
    child: InkWell(
      onTap: tap,
      customBorder: const CircleBorder(),
      child: SizedBox(
        width: 42,
        height: 42,
        child: Icon(icon, color: AppColors.primaryColor, size: 20),
      ),
    ),
  );
  Widget _sectionTitle(String s) => Text(
    s,
    style: TextStyles.body.copyWith(
      color: AppColors.blackColor,
      fontWeight: FontWeight.w700,
    ),
  );
  Widget _tag(String s, Color bg, Color fg) => Container(
    padding: EdgeInsets.all(AppDesign.padding / 2),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      s,
      style: TextStyles.caption2.copyWith(
        color: fg,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
