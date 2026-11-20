import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_assets.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/presentation/widgets/attachment_preview_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_action_item_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_attachment_bottom_sheet.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_card_screen.dart';

class AttachmentPreviewScreen extends StatefulWidget {
  final String chatTitle;
  final String imageAssetPath;
  final String fileName;
  final String fileMetadata;

  const AttachmentPreviewScreen({
    super.key,
    this.chatTitle = 'Student Planner',
    this.imageAssetPath = AppAssets.boyImage,
    this.fileName = 'planner-preview.png',
    this.fileMetadata = 'Mobile task list · 1280 × 960 · 1.8 MB',
  });

  @override
  State<AttachmentPreviewScreen> createState() =>
      _AttachmentPreviewScreenState();
}

class _AttachmentPreviewScreenState extends State<AttachmentPreviewScreen> {
  late final TextEditingController _captionController;

  @override
  void initState() {
    super.initState();
    _captionController = TextEditingController(
      text: "Here's the latest task list layout for review.",
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  void _switchToShareCard(int tabIndex) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ShareCardScreen(
          conversationSubtitle: '${widget.chatTitle} · Conversation',
          initialTabIndex: tabIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.screenHorizontalPadding.w,
            right: AppSizes.screenHorizontalPadding.w,
            top: AppSizes.lg.h,
            // تأمين مسافة للـ Bottom Navigation Bar الخارجي
            bottom: AppSizes.bottomNavHeight + AppSizes.xl.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessagesHeader(
                title: 'Attachment preview',
                subtitle: 'Before sending · ${widget.chatTitle}',
              ),
              SizedBox(height: AppSizes.lg.h),
              AttachmentPreviewCard(
                imageAssetPath: widget.imageAssetPath,
                fileName: widget.fileName,
                fileMetadata: widget.fileMetadata,
              ),
              SizedBox(height: AppSizes.md.h),
              _buildSelectedAttachmentInfoCard(),
              SizedBox(height: AppSizes.md.h),
              _buildCaptionInputSection(),
              SizedBox(height: AppSizes.md.h),
              const CollaborationInfoBanner(
                title: 'Preview before sharing',
                description: 'Make sure this image contains no private student data. It will be shared with current team members only.',
              ),
              SizedBox(height: AppSizes.md.h),
              ChatActionItemCard(
                title: 'Replace attachment',
                subtitle: 'Choose a different image or document',
                onTap: () {
                  ShareAttachmentBottomSheet.show(
                    context,
                    onPhotoTap: () {
                      // TODO: Pick another photo
                    },
                    onFileTap: () {
                      // TODO: Pick another file
                    },
                    onProjectCardTap: () => _switchToShareCard(0),
                    onPersonCardTap: () => _switchToShareCard(1),
                  );
                },
              ),
              SizedBox(height: AppSizes.lg.h),
              _buildBottomActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedAttachmentInfoCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.lg.w,
        vertical: AppSizes.md.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selected attachment',
            style: TextStyles.caption.copyWith(
              fontFamily: AppFonts.Poppins,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1A162E),
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            '1 image · Team members can view',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: const Color(0xFF2D2A3E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaptionInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add a caption',
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
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.bordercl),
          ),
          child: TextField(
            controller: _captionController,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: const Color(0xFF1A162E),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: AppSizes.buttonHeight,
            child: OutlinedButton(
              onPressed: () => Navigator.maybePop(context),
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
                Navigator.pop(context, _captionController.text.trim());
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
                'Send attachment',
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
