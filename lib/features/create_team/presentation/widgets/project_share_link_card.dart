import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';

class ProjectShareLinkCard extends StatefulWidget {
  final String projectUrl;

  const ProjectShareLinkCard({
    super.key,
    required this.projectUrl,
  });

  @override
  State<ProjectShareLinkCard> createState() => _ProjectShareLinkCardState();
}

class _ProjectShareLinkCardState extends State<ProjectShareLinkCard> {
  bool _isCopied = false;

  Future<void> _copyLink() async {
    await Clipboard.setData(ClipboardData(text: widget.projectUrl));
    setState(() => _isCopied = true);

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isCopied = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.lg.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        border: Border.all(color: AppColors.bordercl),
      ),
      child: Row(
        children: [
          Icon(
            Icons.link_rounded,
            color: AppColors.primaryColor,
            size: AppSizes.iconMedium.sp,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              widget.projectUrl,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: AppSizes.sm.w),
          InkWell(
            onTap: _copyLink,
            borderRadius: BorderRadius.circular(AppSizes.radiusSm),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: _isCopied
                    ? AppColors.lightGreenColor
                    : AppColors.purple500.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isCopied ? Icons.check_rounded : Icons.copy_rounded,
                    size: 14.sp,
                    color: _isCopied
                        ? AppColors.greenColor
                        : AppColors.primaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    _isCopied ? 'Copied' : 'Copy',
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: _isCopied
                          ? AppColors.greenColor
                          : AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}