import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/selectable_chip.dart';

class ChipGroup extends StatelessWidget {
  final List<String> options;
  final Set<String> selected;
  final ValueChanged<String> onTap;

  const ChipGroup({
    super.key,
    required this.options,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSizes.sm,
      runSpacing: AppSizes.sm,
      children: options
          .map((o) => SelectableChip(
                label: o,
                isSelected: selected.contains(o),
                onTap: () => onTap(o),
              ))
          .toList(),
    );
  }
}