import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/share_card_models.dart';

class SharePersonCard extends StatelessWidget {
  final SharePersonModel person;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onAddTap;

  const SharePersonCard({
    super.key,
    required this.person,
    this.isSelected = false,
    required this.onTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.lg.w),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: 0.02),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: (AppSizes.avatarMedium / 2).r,
                  backgroundColor: AppColors.accentColor,
                  backgroundImage: AssetImage(person.imageAssetPath),
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
                      Text(
                        person.profileStatus,
                        style: TextStyles.caption2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.greyColor,
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onAddTap,
                  child: Icon(
                    Icons.person_add_alt_1_outlined,
                    color: AppColors.primaryColor,
                    size: AppSizes.iconLarge.sp,
                  ),
                ),
              ],
            ),
            if (person.skills.isNotEmpty) ...[
              SizedBox(height: AppSizes.md.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.md.w,
                  vertical: 4.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
                child: Text(
                  person.skills.join(' · '),
                  style: TextStyles.caption2.copyWith(
                    fontFamily: AppFonts.Poppins,
                    color: AppColors.primaryColor,
                    fontSize: 11.sp,
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