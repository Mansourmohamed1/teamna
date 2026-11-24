import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/app_text_field.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/profile_wizard_data.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/banner.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/chip_group.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/section_label.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/selector.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/wizard_layout.dart';

class SkillsStep extends StatelessWidget {
  final ProfileWizardData data;
  final VoidCallback onChanged;

  const SkillsStep({super.key, required this.data, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return WizardStepLayout(
      title: 'Show what you build with',
      subtitle: 'Pick your stack. Self-rated skills are labeled separately from verified ones.',
      children: [
        const SectionLabel('Skills'),
        ChipGroup(
          options: ProfileOptions.skills,
          selected: data.skills,
          onTap: (v) {
            data.skills.contains(v) ? data.skills.remove(v) : data.skills.add(v);
            onChanged();
          },
        ),
        SizedBox(height: AppSizes.xl.h),
        const SectionLabel('Level'),
        SegmentedSelector(
          options: ProfileOptions.levels,
          selected: data.level,
          onChanged: (v) {
            data.level = v;
            onChanged();
          },
        ),
        SizedBox(height: AppSizes.xl.h),
        AppTextField(
          label: 'GitHub',
          hint: 'github.com/username',
          prefixIcon: Icons.link,
          controller: data.githubController,
          keyboardType: TextInputType.url,
        ),
        SizedBox(height: AppSizes.xl.h),
        const InfoBanner(
          icon: Icons.shield_outlined,
          title: 'Self-rated, not verified',
          message: 'Your verified badge comes from the initiative review in the next step.',
          backgroundColor: AppColors.lightPurpleColor,
          accentColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}