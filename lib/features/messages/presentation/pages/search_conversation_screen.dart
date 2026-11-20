import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/chat_message_model.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_options_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_search_bar.dart';

class SearchConversationScreen extends StatefulWidget {
  final String userName;
  final List<ChatMessageModel> messages;

  const SearchConversationScreen({
    super.key,
    this.userName = 'Ahmed Khaled',
    this.messages = const [
      ChatMessageModel(
        id: '1',
        senderName: 'Aya',
        message: 'Hi Ahmed! I sent you an invitation for Student Planner...',
        time: 'Today, 10:00',
        isMe: true,
      ),
      ChatMessageModel(
        id: '4',
        senderName: 'Ahmed',
        message: "Thanks Aya, I'll review the invitation!",
        time: 'Today, 10:24',
        isMe: false,
      ),
    ],
  });

  @override
  State<SearchConversationScreen> createState() =>
      _SearchConversationScreenState();
}

class _SearchConversationScreenState extends State<SearchConversationScreen> {
  late final TextEditingController _searchController;
  late List<ChatMessageModel> _filteredResults;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: 'invitation');
    _filterMessages('invitation');
  }

  void _filterMessages(String query) {
    final trimmed = query.trim().toLowerCase();
    setState(() {
      if (trimmed.isEmpty) {
        _filteredResults = widget.messages;
      } else {
        _filteredResults = widget.messages
            .where((m) => (m.message ?? '').toLowerCase().contains(trimmed))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final resultOptions = _filteredResults.map((msg) {
      return ConversationOptionItem(
        title: '${msg.senderName} · ${msg.time}',
        subtitle: '“${msg.message}”',
        onTap: () {
          // يرجع للشات مع تمرير الرسالة المختارة للانتقال إليها
          Navigator.pop(context, msg);
        },
      );
    }).toList();

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
                title: 'Search conversation',
                subtitle:
                    '${widget.userName} · ${_filteredResults.length} results',
              ),
              SizedBox(height: AppSizes.xl.h),
              MessagesSearchBar(
                hintText: 'Search messages',
                controller: _searchController,
                onChanged: _filterMessages,
                onFilterTap: () {
                  // TODO: Filter by sender or date
                },
              ),
              SizedBox(height: AppSizes.md.h),
              if (resultOptions.isNotEmpty)
                ConversationOptionsCard(options: resultOptions)
              else
                _buildEmptyState(),
              SizedBox(height: AppSizes.md.h),
              const CollaborationInfoBanner(
                title: 'Jump to context',
                description: 'Selecting a result opens the same conversation at that message. Search does not expose other private chats.',
              ),
              SizedBox(height: AppSizes.md.h),
              _buildBackToConversationButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackToConversationButton() {
    return SizedBox(
      width: double.infinity,
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
          'Back to conversation',
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.xl.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      child: Center(
        child: Text(
          'No matching messages found',
          style: TextStyles.caption.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
