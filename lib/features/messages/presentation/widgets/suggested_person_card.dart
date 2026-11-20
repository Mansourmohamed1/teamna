import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/suggested_person_model.dart';

class SuggestedPersonCard extends StatelessWidget {
  final SuggestedPersonModel person;
  final VoidCallback onAddPersonTap;
  final VoidCallback? onActionButtonTap;
  final VoidCallback? onCardTap;

  const SuggestedPersonCard({
    super.key,
    required this.person,
    required this.onAddPersonTap,
    this.onActionButtonTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.lg.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: 0.02),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: (AppSizes.avatarMedium / 2).r,
                      backgroundColor: AppColors.accentColor,
                      backgroundImage: AssetImage(person.imageUrl),
                    ),
                    if (person.isOnline)
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12.w,
                          height: 12.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.whiteColor,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(width: AppSizes.md.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person.name,
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF1A162E),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              person.roleAndOrg,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.caption2.copyWith(
                                fontFamily: AppFonts.Poppins,
                                color: const Color(0xFF2D2A3E),
                              ),
                            ),
                          ),
                          if (person.isVerified) ...[
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.check_rounded,
                              size: 14.sp,
                              color: const Color(0xFF1A162E),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        person.statusText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.caption2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.greyColor,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.sm.w),
                GestureDetector(
                  onTap: onAddPersonTap,
                  child: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: AppColors.primaryColor,
                    size: AppSizes.iconLarge.sp,
                  ),
                ),
              ],
            ),
            if (person.actionButtonText != null) ...[
              SizedBox(height: AppSizes.md.h),
              SizedBox(
                width: double.infinity,
                height: 44.h,
                child: ElevatedButton(
                  onPressed: onActionButtonTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                    ),
                  ),
                  child: Text(
                    person.actionButtonText!,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      fontWeight: FontWeight.w500,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
