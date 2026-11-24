import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/leader_applicants/presentation/widgets/handoff_confirmation_checkbox.dart';
import 'package:teamna/features/leader_applicants/presentation/widgets/scope_diff_card.dart';

class ScopeUpdateBottomSheet extends StatefulWidget {
  final String proposedBy;
  final String oldTimeline;
  final String newTimeline;
  final String oldFeatures;
  final String newFeatures;
  final VoidCallback? onAgree;
  final VoidCallback? onTalkToTeam;

  const ScopeUpdateBottomSheet({
    super.key,
    this.proposedBy = 'Sara Mostafa',
    this.oldTimeline = '8 weeks',
    this.newTimeline = '10 weeks',
    this.oldFeatures = 'Rides and maps',
    this.newFeatures = 'Rides, maps and payments',
    this.onAgree,
    this.onTalkToTeam,
  });

  static Future<void> show(
    BuildContext context, {
    String proposedBy = 'Sara Mostafa',
    String oldTimeline = '8 weeks',
    String newTimeline = '10 weeks',
    String oldFeatures = 'Rides and maps',
    String newFeatures = 'Rides, maps and payments',
    VoidCallback? onAgree,
    VoidCallback? onTalkToTeam,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
      barrierColor: const Color(0xFF281952).withValues(alpha: 0.85),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusXxl),
        ),
      ),
      builder: (_) => ScopeUpdateBottomSheet(
        proposedBy: proposedBy,
        oldTimeline: oldTimeline,
        newTimeline: newTimeline,
        oldFeatures: oldFeatures,
        newFeatures: newFeatures,
        onAgree: onAgree,
        onTalkToTeam: onTalkToTeam,
      ),
    );
  }

  @override
  State<ScopeUpdateBottomSheet> createState() => _ScopeUpdateBottomSheetState();
}

class _ScopeUpdateBottomSheetState extends State<ScopeUpdateBottomSheet> {
  bool isAgreed = true;

  void _handleAgreeAndContinue() {
    if (!isAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please check the agreement box first.',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.redColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          ),
        ),
      );
      return;
    }

    Navigator.pop(context);
    widget.onAgree?.call();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSizes.screenHorizontalPadding.w,
          12.h,
          AppSizes.screenHorizontalPadding.w,
          AppSizes.lg.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 42.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.purple500.withValues(alpha: 0.35),
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
              ),
            ),
            SizedBox(height: AppSizes.xl.h),

            Row(
              children: [
                Container(
                  width: 46.w,
                  height: 46.w,
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                  child: Icon(
                    Icons.sync_rounded,
                    color: AppColors.orangeColor,
                    size: AppSizes.iconLarge.sp,
                  ),
                ),
                SizedBox(width: AppSizes.md.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scope update',
                        style: TextStyles.title2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Proposed by ${widget.proposedBy}',
                        style: TextStyles.caption2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blurcl,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSizes.lg.h),
            Text(
              'The leader changed the project plan. Please review and confirm to stay on the team.',
              style: TextStyles.caption.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.lightPrimaryColor,
                height: 1.45,
              ),
            ),
            SizedBox(height: AppSizes.lg.h),

            ScopeDiffCard(
              label: 'Timeline',
              oldValue: widget.oldTimeline,
              newValue: widget.newTimeline,
            ),
            SizedBox(height: AppSizes.md.h),

            ScopeDiffCard(
              label: 'Features',
              oldValue: widget.oldFeatures,
              newValue: widget.newFeatures,
            ),
            SizedBox(height: AppSizes.lg.h),

            HandoffConfirmationCheckbox(
              value: isAgreed,
              label: 'I agree to the updated scope',
              onChanged: (val) => setState(() => isAgreed = val),
            ),
            SizedBox(height: AppSizes.xl.h),

            AppButton(
              text: 'Agree & continue',
              width: double.infinity,
              backgroundColor: AppColors.orangeColor,
              foregroundColor: AppColors.whiteColor,
              onPressed: _handleAgreeAndContinue,
            ),
            SizedBox(height: AppSizes.md.h),

            SizedBox(
              width: double.infinity,
              height: AppSizes.buttonHeight,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                  widget.onTalkToTeam?.call();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  foregroundColor: AppColors.primaryColor,
                  side: BorderSide(
                    color: AppColors.purple500.withValues(alpha: 0.35),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                ),
                child: Text(
                  'Talk to the team first',
                  style: TextStyles.body.copyWith(
                    fontFamily: AppFonts.Poppins,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
