import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_options_card.dart';

enum ConversationControlType { mute, report, block }

class ConversationControlsBottomSheet extends StatefulWidget {
  final String userName;
  final ConversationControlType initialType;

  const ConversationControlsBottomSheet({
    super.key,
    required this.userName,
    this.initialType = ConversationControlType.mute,
  });

  static Future<String?> show(
    BuildContext context, {
    required String userName,
    ConversationControlType initialType = ConversationControlType.mute,
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ConversationControlsBottomSheet(
        userName: userName,
        initialType: initialType,
      ),
    );
  }

  @override
  State<ConversationControlsBottomSheet> createState() =>
      _ConversationControlsBottomSheetState();
}

class _ConversationControlsBottomSheetState
    extends State<ConversationControlsBottomSheet> {
  late ConversationControlType _selectedType;

  @override
  void initState() {
    super.initState();
    _selectedType = widget.initialType;
  }

  String get _firstName => widget.userName.split(' ').first;

  String get _selectedActionText {
    switch (_selectedType) {
      case ConversationControlType.mute:
        return 'Mute for 8 hours';
      case ConversationControlType.report:
        return 'Report conversation · Spam';
      case ConversationControlType.block:
        return 'Block $_firstName';
    }
  }

  String get _confirmButtonText {
    switch (_selectedType) {
      case ConversationControlType.mute:
        return 'Confirm mute';
      case ConversationControlType.report:
        return 'Submit report';
      case ConversationControlType.block:
        return 'Confirm block';
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      ConversationOptionItem(
        title: 'Mute conversation',
        subtitle: '1 hour · 8 hours · Until I turn it on',
        onTap: () {
          setState(() => _selectedType = ConversationControlType.mute);
        },
      ),
      ConversationOptionItem(
        title: 'Report conversation',
        subtitle: 'Spam · Harassment · Inappropriate content',
        onTap: () {
          setState(() => _selectedType = ConversationControlType.report);
        },
      ),
      ConversationOptionItem(
        title: 'Block $_firstName',
        subtitle:
            'Stops new private messages; shared team work remains visible.',
        onTap: () {
          setState(() => _selectedType = ConversationControlType.block);
        },
      ),
    ];

    return Container(
      padding: EdgeInsets.only(
        left: AppSizes.screenHorizontalPadding.w,
        right: AppSizes.screenHorizontalPadding.w,
        top: AppSizes.md.h,
        bottom: MediaQuery.paddingOf(context).bottom + AppSizes.lg.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF6EE),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusXxl),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withValues(alpha: 0.4),
              borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            ),
          ),
          SizedBox(height: AppSizes.md.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Conversation controls',
                style: TextStyles.title2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A162E),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.close_rounded,
                  color: AppColors.primaryColor.withValues(alpha: 0.7),
                  size: AppSizes.iconLarge.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.lg.h),
          ConversationOptionsCard(options: options),
          SizedBox(height: AppSizes.md.h),
          _buildSelectedActionBox(),
          SizedBox(height: AppSizes.md.h),
          const CollaborationInfoBanner(
            title: 'You’re in control',
            description:
                'Blocking doesn’t notify the other person. Reports are reviewed by community moderators.',
          ),
          SizedBox(height: AppSizes.lg.h),
          _buildBottomButtons(context),
        ],
      ),
    );
  }

  Widget _buildSelectedActionBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected action',
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A162E),
          ),
        ),
        SizedBox(height: AppSizes.sm.h),
        Container(
          height: AppSizes.inputHeight,
          padding: EdgeInsets.symmetric(horizontal: AppSizes.lg.w),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.bordercl),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _selectedActionText,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: const Color(0xFF1A162E),
                ),
              ),
              Icon(
                Icons.check_rounded,
                color: AppColors.primaryColor,
                size: AppSizes.iconMedium.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: AppSizes.buttonHeight,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.whiteColor,
                foregroundColor: AppColors.primaryColor,
                side: BorderSide(color: AppColors.bordercl, width: 1),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.md.w),
        Expanded(
          child: SizedBox(
            height: AppSizes.buttonHeight,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _selectedActionText);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.whiteColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
              ),
              child: Text(
                _confirmButtonText,
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}