import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/create_team/presentation/views/build_team_review_view.dart';
import '../widgets/build_team_app_bar.dart';
import '../widgets/segmented_selector_row.dart';
import '../widgets/switch_setting_card.dart';
import '../widgets/term_selection_card.dart';

class BuildTeamCommitmentView extends StatefulWidget {
  const BuildTeamCommitmentView({super.key});

  @override
  State<BuildTeamCommitmentView> createState() =>
      _BuildTeamCommitmentViewState();
}

class _BuildTeamCommitmentViewState extends State<BuildTeamCommitmentView> {
  final List<String> _hoursOptions = const ['Under 5h', '5–10h', '10h+'];
  final List<String> _durationOptions = const [
    '4 weeks',
    '8 weeks',
    '12 weeks',
  ];

  String _selectedHours = '5–10h';
  String _selectedDuration = '8 weeks';
  String _selectedTerm = 'Learning project';
  bool _requireExitHandoff = true;

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BuildTeamReviewView()),
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
                currentStep: 4,
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
                        'Set the commitment',
                        style: TextStyles.headline2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.sm.h),
                      Text(
                        'Be clear so nobody drops out later.',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.xxl.h),
                      SegmentedSelectorRow(
                        title: 'Hours per week',
                        options: _hoursOptions,
                        selectedOption: _selectedHours,
                        onOptionSelected: (val) {
                          setState(() => _selectedHours = val);
                        },
                      ),
                      SizedBox(height: AppSizes.xl.h),

                      SegmentedSelectorRow(
                        title: 'Duration',
                        options: _durationOptions,
                        selectedOption: _selectedDuration,
                        onOptionSelected: (val) {
                          setState(() => _selectedDuration = val);
                        },
                      ),
                      SizedBox(height: AppSizes.xl.h),

                      Text(
                        'Terms',
                        style: TextStyles.body.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      TermSelectionCard(
                        title: 'Learning project',
                        subtitle: 'Portfolio building, no payment',
                        icon: Icons.layers_outlined,
                        iconColor: AppColors.primaryColor,
                        iconBgColor: AppColors.purple500.withValues(
                          alpha: 0.14,
                        ),
                        isSelected: _selectedTerm == 'Learning project',
                        onTap: () {
                          setState(() => _selectedTerm = 'Learning project');
                        },
                      ),
                      SizedBox(height: AppSizes.md.h),

                      TermSelectionCard(
                        title: 'Open source',
                        subtitle: 'Anyone can contribute later',
                        icon: Icons.people_outline,
                        iconColor: AppColors.orangeColor,
                        iconBgColor: AppColors.yellowColor,
                        isSelected: _selectedTerm == 'Open source',
                        onTap: () {
                          setState(() => _selectedTerm = 'Open source');
                        },
                      ),
                      SizedBox(height: AppSizes.md.h),

                      SwitchSettingCard(
                        title: 'Require exit handoff',
                        subtitle: 'Leaving members must file a handoff form',
                        value: _requireExitHandoff,
                        onChanged: (val) {
                          setState(() => _requireExitHandoff = val);
                        },
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
