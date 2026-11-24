import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';

class WorkspaceHeader extends StatelessWidget {
  final VoidCallback onOptionsTap;

  const WorkspaceHeader({super.key, required this.onOptionsTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppDesign.padding, 10, AppDesign.padding, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          Text('Workspace', style: TextStyles.caption2.copyWith(
            color: AppColors.blurcl,
          )),
          const SizedBox(height: 2),
          Row(
            children: [
              Expanded(child: Text('Campus Carpool', style: TextStyles.title2.copyWith(
                color: AppColors.primaryColor, fontWeight: FontWeight.w700,
              ))),
              IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: onOptionsTap,
                icon: const Icon(Icons.more_horiz, color: AppColors.lightPrimaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
