import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class WorkspaceTabs extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const WorkspaceTabs({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    const labels = ['Overview', 'Team', 'Board', 'Handoffs'];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDesign.padding),
      child: Row(
        children: List.generate(labels.length, (index) {
          final active = selectedIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () => onChanged(index),
              child: Container(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: active
                          ? AppColors.orangeColor
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    labels[index],
                    style: TextStyles.caption.copyWith(
                      color: active ? AppColors.primaryColor : AppColors.blurcl,
                      fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
