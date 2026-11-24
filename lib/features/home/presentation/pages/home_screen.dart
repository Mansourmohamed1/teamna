import 'package:flutter/material.dart';
import 'package:teamna/core/constants/app_assets.dart';
import 'package:teamna/core/constants/app_design.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/projects/data/project_model.dart';
import 'package:teamna/features/projects/presentation/pages/project_details_screen.dart';
import 'package:teamna/features/projects/presentation/pages/project_screen.dart';
import 'package:teamna/features/projects/presentation/widgets/project_card.dart';
import '../widgets/home_banner.dart';
import '../widgets/home_header.dart';
import '../widgets/homecontainer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            AppDesign.padding,
            12,
            AppDesign.padding,
            24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 18),
              HomeBanner(
                onSeeMatches: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProjectScreen()),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Homecontainer(
                      color: AppColors.primaryColor,
                      path: AppAssets.peopleSvg,
                      number: 2,
                      title: 'Active projects',
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Homecontainer(
                      number: 3,
                      color: AppColors.orangeColor,
                      path: AppAssets.projectSvg,
                      title: 'Pending invites',
                    ),
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Homecontainer(
                      number: 7,
                      color: AppColors.greenColor,
                      path: AppAssets.eventSvg,
                      title: 'Open tasks',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Text(
                    'Recommended for you',
                    style: TextStyles.subtitle.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ProjectScreen()),
                    ),
                    child: Text(
                      'See all',
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ProjectCard(
                project: demoProjects[0],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProjectDetailsScreen(project: demoProjects[0]),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              ProjectCard(
                project: demoProjects[2],
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProjectDetailsScreen(project: demoProjects[2]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
