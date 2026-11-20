import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/chat_message_model.dart';
import 'package:t2mna/features/messages/presentation/pages/conversation_info_screen.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_message_bubble.dart';
import 'package:t2mna/features/messages/presentation/widgets/chat_message_input.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_info_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/share_attachment_bottom_sheet.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String userName;
  final String userSubtitle;

  const ChatDetailsScreen({
    super.key,
    this.userName = 'Ahmed Khaled',
    this.userSubtitle = 'Flutter Developer · Available',
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<ChatMessageModel> _messages = [
    const ChatMessageModel(
      id: '1',
      senderName: 'Aya',
      message: 'Hi Ahmed! I sent you an invitation for Student Planner. Your Firebase experience would be a great fit.',
      time: '10:00',
      status: 'Delivered',
      isMe: true,
    ),
    const ChatMessageModel(
      id: '2',
      senderName: 'Ahmed',
      message: 'Hi Aya! Sounds interesting. Is the commitment around 8–10 hours a week?',
      time: '10:20',
      isMe: false,
    ),
    const ChatMessageModel(
      id: '3',
      senderName: 'Aya',
      message: "Exactly. We'll plan a weekly check-in and agree deliverables together.",
      time: '10:21',
      status: 'Read',
      isMe: true,
    ),
    const ChatMessageModel(
      id: '4',
      senderName: 'Ahmed',
      message: "Thanks Aya, I'll review the invitation!",
      time: '10:24',
      status: 'Unread',
      isMe: false,
    ),
  ];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add(
        ChatMessageModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
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
    // التحقق من وجود كيبورد مفتوح لضبط المسافة السفلية بدقة
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
                title: widget.userName,
                subtitle: widget.userSubtitle,
              ),
              SizedBox(height: AppSizes.lg.h),
              ConversationInfoCard(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ConversationInfoScreen(),
                    ),
                  );
                },
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
                  itemCount: _messages.length,
                  separatorBuilder: (_, __) => SizedBox(height: AppSizes.md.h),
                  itemBuilder: (context, index) {
                    return ChatMessageBubble(message: _messages[index]);
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
                  controller: _messageController,
                  onSubmitted: _sendMessage,
                  onAttachmentTap: () {
                    ShareAttachmentBottomSheet.show(
                      context,
                      onPhotoTap: () => _sendMessage('📷 Shared a photo'),
                      onFileTap: () => _sendMessage('📄 Shared a document'),
                      onProjectCardTap: () =>
                          _sendMessage('Shared project: Student Planner'),
                      onPersonCardTap: () =>
                          _sendMessage('👤 Shared contact card'),
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
