import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/profile_wizard_data.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/chip_group.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/section_label.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/selector.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/wizard_layout.dart';

class TrackRoundStep extends StatelessWidget {
  final ProfileWizardData data;
  final VoidCallback onChanged;

  const TrackRoundStep({super.key, required this.data, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return WizardStepLayout(
      title: 'Your track & round',
      subtitle: 'This is how teammates will find and trust you.',
      children: [
        const SectionLabel('Track'),
        ChipGroup(
          options: ProfileOptions.tracks,
          selected: {data.track},
          onTap: (v) {
            data.track = v;
            onChanged();
          },
        ),
        SizedBox(height: AppSizes.xl.h),
        const SectionLabel('Round'),
        SegmentedSelector(
          options: ProfileOptions.rounds,
          selected: data.round,
          onChanged: (v) {
            data.round = v;
            onChanged();
          },
        ),
        SizedBox(height: AppSizes.xl.h),
        const SectionLabel('Status'),
        SegmentedSelector(
          options: ProfileOptions.statuses,
          selected: data.status,
          onChanged: (v) {
            data.status = v;
            onChanged();
          },
        ),
      ],
    );
  }
}