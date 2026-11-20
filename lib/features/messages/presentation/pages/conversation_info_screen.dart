import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_assets.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/chat_message_model.dart';
import 'package:t2mna/features/messages/data/models/suggested_person_model.dart';
import 'package:t2mna/features/messages/presentation/pages/search_conversation_screen.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_controls_bottom_sheet.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_options_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_filter_tabs.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/suggested_person_card.dart';

class ConversationInfoScreen extends StatefulWidget {
  final String userName;
  final String userRoleAndOrg;
  final String userImage;

  const ConversationInfoScreen({
    super.key,
    this.userName = 'Ahmed Khaled',
    this.userRoleAndOrg = 'Flutter Developer · DEPI',
    this.userImage = AppAssets.boyImage,
  });

  @override
  State<ConversationInfoScreen> createState() => _ConversationInfoScreenState();
}

class _ConversationInfoScreenState extends State<ConversationInfoScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = SuggestedPersonModel(
      id: '1',
      name: widget.userName,
      imageUrl: widget.userImage,
      roleAndOrg: widget.userRoleAndOrg,
      statusText: 'Available · Cairo',
      isVerified: true,
      isOnline: true,
    );

    final firstName = widget.userName.split(' ').first;

    final options = [
      ConversationOptionItem(
        title: 'View profile',
        subtitle: 'Skills, work and initiative credential',
        onTap: () {},
      ),
      ConversationOptionItem(
        title: 'Search conversation',
        subtitle: 'Find a message or shared link',
        onTap: () async {
          final selectedMessage = await Navigator.push<ChatMessageModel>(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  SearchConversationScreen(userName: widget.userName),
            ),
          );
          if (selectedMessage != null && context.mounted) {
            Navigator.pop(context, selectedMessage);
          }
        },
      ),
      ConversationOptionItem(
        title: 'Shared files & media',
        subtitle: 'planner-preview.png · project-brief.pdf',
        onTap: () {
          setState(() => _selectedTabIndex = 1);
        },
      ),
      ConversationOptionItem(
        title: 'Mute notifications',
        subtitle: 'Choose duration for this conversation',
        onTap: () async {
          final action = await ConversationControlsBottomSheet.show(
            context,
            userName: widget.userName,
            initialType: ConversationControlType.mute,
          );
          if (action != null && context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Applied: $action')));
          }
        },
      ),
      ConversationOptionItem(
        title: 'Report or block',
        subtitle: 'Control who can contact you',
        onTap: () async {
          final action = await ConversationControlsBottomSheet.show(
            context,
            userName: widget.userName,
            initialType: ConversationControlType.block,
          );
          if (action != null && context.mounted) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Applied: $action')));
          }
        },
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: AppSizes.screenHorizontalPadding.w,
            right: AppSizes.screenHorizontalPadding.w,
            top: AppSizes.lg.h,
            bottom: AppSizes.bottomNavHeight + AppSizes.xl.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessagesHeader(
                title: 'Conversation info',
                subtitle: '${widget.userName} · Private conversation',
              ),
              SizedBox(height: AppSizes.xl.h),
              SuggestedPersonCard(
                person: user,
                onAddPersonTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invitation sent to ${widget.userName}'),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSizes.md.h),
              MessagesFilterTabs(
                tabs: const ['Info', 'Media (2)', 'Files (1)'],
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() => _selectedTabIndex = index);
                },
              ),
              SizedBox(height: AppSizes.md.h),
              if (_selectedTabIndex == 0)
                ConversationOptionsCard(options: options)
              else if (_selectedTabIndex == 1)
                _buildPlaceholderTab('Shared Media (2)')
              else if (_selectedTabIndex == 2)
                _buildPlaceholderTab('Shared Files (1)'),
              SizedBox(height: AppSizes.md.h),
              CollaborationInfoBanner(
                title: 'Private chat',
                description:
                    'Only you and $firstName can see this conversation. Team conversation info shows the member roster instead.',
              ),
              SizedBox(height: AppSizes.md.h),
              _buildBackToChatButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackToChatButton() {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: () => Navigator.maybePop(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.whiteColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
          ),
        ),
        child: Text(
          'Back to chat',
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderTab(String label) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.xl.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
