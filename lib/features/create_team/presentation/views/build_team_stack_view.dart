import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/create_team/presentation/views/build_team_roles_view.dart';
import '../widgets/build_team_app_bar.dart';
import '../widgets/selectable_chip_group.dart';
import '../widgets/tip_info_card.dart';

class BuildTeamStackView extends StatefulWidget {
  const BuildTeamStackView({super.key});

  @override
  State<BuildTeamStackView> createState() => _BuildTeamStackViewState();
}

class _BuildTeamStackViewState extends State<BuildTeamStackView> {
  final Map<String, List<String>> _techCategories = const {
    'Mobile': ['Flutter', 'React Native', 'Kotlin'],
    'Front-End': ['React', 'Vue', 'Angular'],
    'Back-End': ['Firebase', 'Node.js', 'Django', 'Laravel'],
    'Tools': ['Git', 'Figma', 'BLoC', 'Docker'],
  };

  final Set<String> _selectedStacks = {
    'Flutter',
    'Firebase',
    'Git',
    'Figma',
    'BLoC',
  };

  void _toggleStack(String stack) {
    setState(() {
      if (_selectedStacks.contains(stack)) {
        _selectedStacks.remove(stack);
      } else {
        _selectedStacks.add(stack);
      }
    });
  }

  void _onContinue() {
    if (_selectedStacks.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one technology')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BuildTeamRolesView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontalPadding.w,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSizes.sm.h),
              BuildTeamAppBar(
                currentStep: 2,
                totalSteps: 5,
                leadingIcon: Icons.arrow_back,
                onLeadingTap: () => Navigator.pop(context),
                onDraftTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSizes.xxl.h,
                    bottom: AppSizes.lg.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pick your tech stack',
                        style: TextStyles.headline2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.sm.h),

                      Text(
                        'Tell people what they will work with.',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.xxl.h),

                      ..._techCategories.entries.map((entry) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSizes.xl.h),
                          child: SelectableChipGroup(
                            title: entry.key,
                            items: entry.value,
                            selectedItems: _selectedStacks,
                            onItemToggle: _toggleStack,
                          ),
                        );
                      }),

                      SizedBox(height: AppSizes.sm.h),

                      const TipInfoCard(
                        description:
                            'Your stack decides which roles we suggest in the next step.',
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.lg.h,
                ),
                child: AppButton(
                  text: 'Continue',
                  width: double.infinity,
                  onPressed: _onContinue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
