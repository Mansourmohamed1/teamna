import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/initiative.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/profile_wizard_data.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/initiative_card.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/wizard_layout.dart';

class InitiativeStep extends StatelessWidget {
  final ProfileWizardData data;
  final VoidCallback onChanged;

  const InitiativeStep({super.key, required this.data, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return WizardStepLayout(
      title: 'Where did you train?',
      subtitle: 'Pick your initiative so we can verify your track.',
      children: [
        for (int i = 0; i < initiatives.length; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppSizes.md),
            child: InitiativeCard(
              initiative: initiatives[i],
              isSelected: data.initiativeIndex == i,
              onTap: () {
                data.initiativeIndex = i;
                onChanged();
              },
            ),
          ),
      ],
    );
  }
}