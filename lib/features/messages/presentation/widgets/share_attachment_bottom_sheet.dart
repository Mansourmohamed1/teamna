import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_options_card.dart';

class ShareAttachmentBottomSheet extends StatelessWidget {
  final VoidCallback onPhotoTap;
  final VoidCallback onFileTap;
  final VoidCallback onProjectCardTap;
  final VoidCallback onPersonCardTap;

  const ShareAttachmentBottomSheet({
    super.key,
    required this.onPhotoTap,
    required this.onFileTap,
    required this.onProjectCardTap,
    required this.onPersonCardTap,
  });

  /// Helper method لاستدعاء الـ BottomSheet بسهولة من أي شاشة شات
  static Future<void> show(
    BuildContext context, {
    required VoidCallback onPhotoTap,
    required VoidCallback onFileTap,
    required VoidCallback onProjectCardTap,
    required VoidCallback onPersonCardTap,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true, // عشان يظهر فوق الـ BottomNavBar الخارجي لو موجود
      backgroundColor: Colors.transparent,
      builder: (_) => ShareAttachmentBottomSheet(
        onPhotoTap: onPhotoTap,
        onFileTap: onFileTap,
        onProjectCardTap: onProjectCardTap,
        onPersonCardTap: onPersonCardTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      ConversationOptionItem(
        title: 'Photo or image',
        subtitle: 'Choose an image · Preview before sending',
        onTap: () {
          Navigator.pop(context);
          onPhotoTap();
        },
      ),
      ConversationOptionItem(
        title: 'File or document',
        subtitle: 'PDF, image or document · Up to 20 MB',
        onTap: () {
          Navigator.pop(context);
          onFileTap();
        },
      ),
      ConversationOptionItem(
        title: 'Project card',
        subtitle: 'Share a public TEAMNA project',
        onTap: () {
          Navigator.pop(context);
          onProjectCardTap();
        },
      ),
      ConversationOptionItem(
        title: 'Person card',
        subtitle: 'Introduce a developer or designer',
        onTap: () {
          Navigator.pop(context);
          onPersonCardTap();
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
          // Drag Handle الصغير اللي على الشمال في التصميم
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
                'Share something',
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
          const CollaborationInfoBanner(
            title: 'Access stays the same',
            description:
                'Sharing a private team file doesn’t grant access to people outside the team.',
          ),
          SizedBox(height: AppSizes.md.h),
          _buildCancelButton(context),
        ],
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
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
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}