import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/share_card_models.dart';

class ShareProjectCard extends StatelessWidget {
  final ShareProjectModel project;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onBookmarkTap;
  final VoidCallback? onViewProjectTap;

  const ShareProjectCard({
    super.key,
    required this.project,
    this.icon = Icons.school_outlined,
    this.isSelected = false,
    required this.onTap,
    this.onBookmarkTap,
    this.onViewProjectTap,
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                gradient: const LinearGradient(
                  colors: [AppColors.primaryColor, Color(0xFFF6A68D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Icon(
                Icons.school_outlined,
                color: AppColors.whiteColor,
                size: AppSizes.iconLarge.sp,
              ),
            ),
            SizedBox(width: AppSizes.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          project.title,
                          style: TextStyles.caption.copyWith(
                            fontFamily: AppFonts.Poppins,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF1A162E),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onBookmarkTap,
                        child: Icon(
                          Icons.bookmark_border_rounded,
                          color: AppColors.greyColor,
                          size: AppSizes.iconMedium.sp,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    project.categoryAndVisibility,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    project.description,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
                      height: 1.35,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    project.techStack,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: const Color(0xFF2D2A3E),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          project.membersAndMode,
                          style: TextStyles.caption2.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.greyColor,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: onViewProjectTap,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Project',
                              style: TextStyles.caption2.copyWith(
                                fontFamily: AppFonts.Poppins,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1A162E),
                                fontSize: 11.sp,
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 12.sp,
                              color: const Color(0xFF1A162E),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
