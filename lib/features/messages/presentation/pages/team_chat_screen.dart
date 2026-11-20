import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/chat_message_model.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_action_item_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_message_bubble.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_message_input.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_attachment_bottom_sheet.dart';

class TeamChatScreen extends StatefulWidget {
  final String teamName;
  final String teamSubtitle;

  const TeamChatScreen({
    super.key,
    this.teamName = 'Student Planner',
    this.teamSubtitle = 'Team chat · Aya and Ziad · 2 members',
  });

  @override
  State<TeamChatScreen> createState() => _TeamChatScreenState();
}

class _TeamChatScreenState extends State<TeamChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<ChatMessageModel> _timelineItems = [
    const ChatMessageModel(
      id: '1',
      type: ChatItemType.text,
      senderName: 'Ziad',
      message: 'The reminder API schema is ready. Could you check the task list response?',
      time: '09:45',
      status: '2 unread messages',
      isMe: false,
    ),
    const ChatMessageModel(
      id: '2',
      type: ChatItemType.attachment,
      cardTitle: 'api-schema.json',
      cardSubtitle: '12 KB · Ziad · Team-only attachment',
    ),
    const ChatMessageModel(
      id: '3',
      type: ChatItemType.text,
      senderName: 'Ziad',
      message: "I'll work on the database migration next.",
      time: '09:46',
      isMe: false,
    ),
    const ChatMessageModel(
      id: '4',
      type: ChatItemType.text,
      senderName: 'Aya',
      message: "Great, I'll review it with the Flutter task UI today.",
      status: 'Draft · Not sent',
      isMe: true,
    ),
    const ChatMessageModel(
      id: '5',
      type: ChatItemType.task,
      cardTitle: 'Task: Build task list UI',
      cardSubtitle: 'Aya · In progress · Due 28 Oct',
    ),
  ];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _timelineItems.add(
        ChatMessageModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          type: ChatItemType.text,
          senderName: 'Aya',
          message: text.trim(),
          time: 'Now',
          status: 'Delivered',
          isMe: true,
        ),
      );
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardOpen = MediaQuery.viewInsetsOf(context).bottom > 0;

    return Scaffold(
      backgroundColor: const Color(0xFFFAF6EE),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontalPadding.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.lg.h),
              MessagesHeader(
                title: widget.teamName,
                subtitle: widget.teamSubtitle,
              ),
              SizedBox(height: AppSizes.lg.h),
              const CollaborationInfoBanner(
                title: 'Team-only conversation',
                description: 'Ahmed and Sara will join this chat only after accepting their invitations.',
              ),
              SizedBox(height: AppSizes.lg.h),
              Text(
                'Today · 24 October 2026',
                style: TextStyles.caption2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: AppSizes.md.h),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: AppSizes.md.h),
                  itemCount: _timelineItems.length,
                  separatorBuilder: (_, __) => SizedBox(height: AppSizes.md.h),
                  itemBuilder: (context, index) {
                    final item = _timelineItems[index];
                    switch (item.type) {
                      case ChatItemType.text:
                        return ChatMessageBubble(message: item);
                      case ChatItemType.attachment:
                      case ChatItemType.task:
                        return ChatActionItemCard(
                          title: item.cardTitle ?? '',
                          subtitle: item.cardSubtitle ?? '',
                          onTap: () {},
                        );
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: isKeyboardOpen
                      ? AppSizes.md.h
                      : AppSizes.bottomNavHeight + AppSizes.md.h,
                ),
                child: ChatMessageInput(
                  label: 'Message team',
                  controller: _messageController,
                  onSubmitted: _sendMessage,
                  onAttachmentTap: () {
                    ShareAttachmentBottomSheet.show(
                      context,
                      onPhotoTap: () => _sendMessage('📷 Shared a team photo'),
                      onFileTap: () =>
                          _sendMessage('📄 Shared a team document'),
                      onProjectCardTap: () =>
                          _sendMessage('🚀 Shared project card'),
                      onPersonCardTap: () =>
                          _sendMessage('👤 Introduced a new member'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
