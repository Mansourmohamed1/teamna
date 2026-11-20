import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_assets.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/share_card_models.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_filter_tabs.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_person_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_project_card.dart';

class ShareCardScreen extends StatefulWidget {
  final String conversationSubtitle;
  final int initialTabIndex;

  const ShareCardScreen({
    super.key,
    this.conversationSubtitle = 'Ahmed Khaled · Private conversation',
    this.initialTabIndex = 0,
  });

  @override
  State<ShareCardScreen> createState() => _ShareCardScreenState();
}

class _ShareCardScreenState extends State<ShareCardScreen> {
  late int _selectedTabIndex;
  late final TextEditingController _messageController;

  final ShareProjectModel _project = const ShareProjectModel(
    id: 'p1',
    title: 'Student Planner App',
    categoryAndVisibility: 'Graduation Project · Public project',
    description: 'A mobile app to help students manage their academic tasks and deadlines.',
    techStack: 'Flutter · UI/UX · Backend',
    membersAndMode: '2 / 5 members · Remote',
  );

  final SharePersonModel _person = const SharePersonModel(
    id: 'u2',
    name: 'Sara Mahmoud',
    imageAssetPath:
        AppAssets.boyImage, // استبدليه بصورة البنت من AppAssets عندك
    roleAndOrg: 'UI/UX Designer · ITI',
    profileStatus: 'Public profile · Available',
    isVerified: true,
    skills: ['Figma', 'User Research'],
  );

  @override
  void initState() {
    super.initState();
    _selectedTabIndex = widget.initialTabIndex;
    _messageController = TextEditingController(
      text:
          "This is the project we’re building. Happy to answer your questions!",
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isProjectSelected = _selectedTabIndex == 0;

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
                title: 'Share a card',
                subtitle: widget.conversationSubtitle,
              ),
              SizedBox(height: AppSizes.lg.h),
              MessagesFilterTabs(
                tabs: const ['Projects', 'People'],
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() => _selectedTabIndex = index);
                },
              ),
              SizedBox(height: AppSizes.md.h),
              ShareProjectCard(
                project: _project,
                isSelected: isProjectSelected,
                onTap: () => setState(() => _selectedTabIndex = 0),
                onBookmarkTap: () {},
                onViewProjectTap: () {},
              ),
              SizedBox(height: AppSizes.md.h),
              SharePersonCard(
                person: _person,
                isSelected: !isProjectSelected,
                onTap: () => setState(() => _selectedTabIndex = 1),
                onAddTap: () {},
              ),
              SizedBox(height: AppSizes.lg.h),
              _buildOptionalMessageInput(),
              SizedBox(height: AppSizes.md.h),
              const CollaborationInfoBanner(
                title: 'Only public information',
                description: 'Cards link to the same project or profile view and never expose private workspace content.',
              ),
              SizedBox(height: AppSizes.lg.h),
              _buildBottomActions(isProjectSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionalMessageInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Optional message',
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A162E),
          ),
        ),
        SizedBox(height: AppSizes.sm.h),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.lg.w,
            vertical: AppSizes.md.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
            border: Border.all(color: AppColors.bordercl),
          ),
          child: TextField(
            controller: _messageController,
            maxLines: 2,
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: const Color(0xFF1A162E),
              height: 1.4,
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

  Widget _buildBottomActions(bool isProjectSelected) {
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
                final sharedLabel = isProjectSelected
                    ? '🚀 Project: ${_project.title}'
                    : '👤 Contact: ${_person.name}';
                final note = _messageController.text.trim();
                final result = note.isNotEmpty
                    ? '$sharedLabel\n$note'
                    : sharedLabel;
                Navigator.pop(context, result);
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
                isProjectSelected ? 'Share project card' : 'Share person card',
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
