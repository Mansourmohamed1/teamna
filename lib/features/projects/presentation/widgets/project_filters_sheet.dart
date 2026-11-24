import 'package:flutter/material.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class ProjectFiltersSheet extends StatefulWidget {
  const ProjectFiltersSheet({super.key});
  @override
  State<ProjectFiltersSheet> createState() => _ProjectFiltersSheetState();
}

class _ProjectFiltersSheetState extends State<ProjectFiltersSheet> {
  final selectedRoles = <String>{'Flutter'};
  final selectedRounds = <String>{'DEPI', 'Round 7'};
  String commitment = '5–10h';
  String stage = 'MVP';
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 38,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD8C9FF),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Filters',
                style: TextStyles.title2.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => setState(() {
                  selectedRoles.clear();
                  selectedRounds.clear();
                  commitment = 'Any';
                  stage = 'Any';
                }),
                child: const Text(
                  'Reset',
                  style: TextStyle(color: AppColors.orangeColor),
                ),
              ),
            ],
          ),
          _heading('Missing role'),
          _multi([
            'Flutter',
            'Front-End',
            'Back-End',
            'UI/UX',
            'QA',
          ], selectedRoles),
          _heading('Initiative & round'),
          _multi(['DEPI', 'Round 7', 'NTI', 'ITI'], selectedRounds),
          _heading('Commitment'),
          _single(
            ['Under 5h', '5–10h', '10h+'],
            commitment,
            (v) => setState(() => commitment = v),
          ),
          _heading('Stage'),
          _single(
            ['Idea', 'MVP', 'Building'],
            stage,
            (v) => setState(() => stage = v),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orangeColor,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
              child: const Text('Show 24 projects'),
            ),
          ),
        ],
      ),
    ),
  );
  Widget _heading(String s) => Padding(
    padding: const EdgeInsets.only(top: 14, bottom: 9),
    child: Text(
      s,
      style: TextStyles.body.copyWith(
        color: AppColors.primaryColor,
        fontSize: 14,
      ),
    ),
  );
  Widget _multi(List<String> options, Set<String> values) => Wrap(
    spacing: 7,
    runSpacing: 8,
    children: options
        .map(
          (s) => FilterChip(
            label: Text(s),
            selected: values.contains(s),
            onSelected: (v) =>
                setState(() => v ? values.add(s) : values.remove(s)),
            selectedColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
            labelStyle: TextStyles.caption2.copyWith(
              color: values.contains(s) ? Colors.white : AppColors.primaryColor,
            ),
            side: BorderSide(
              color: AppColors.primaryColor.withValues(alpha: .15),
            ),
            showCheckmark: false,
            shape: const StadiumBorder(),
          ),
        )
        .toList(),
  );
  Widget _single(
    List<String> options,
    String value,
    ValueChanged<String> change,
  ) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: options.map((option) {
          final selected = value == option;
          return Expanded(
            child: GestureDetector(
              onTap: () => change(option),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    option,
                    style: TextStyles.caption2.copyWith(
                      color: selected ? Colors.white : AppColors.greyColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
