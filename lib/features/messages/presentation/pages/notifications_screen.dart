import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/notification_item_model.dart';
import 'package:t2mna/features/messages/presentation/pages/chat_details_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/team_chat_screen.dart';
import 'package:t2mna/features/messages/presentation/widgets/conversation_options_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/invitation_update_screen.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_filter_tabs.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedTabIndex = 0;

  List<NotificationItemModel> _notifications = [
    const NotificationItemModel(
      id: '1',
      category: NotificationCategory.invitation,
      title: 'Omar invited you to AI Study',
      subtitle: 'Mobile developer · Today, 09:50 · Unread',
      isUnread: true,
      showArrow: true,
    ),
    const NotificationItemModel(
      id: '2',
      category: NotificationCategory.message,
      title: 'Ahmed sent you a message',
      subtitle: "“Thanks Aya, I'll review the invitation!” · 10:24",
      isUnread: true,
    ),
    const NotificationItemModel(
      id: '3',
      category: NotificationCategory.message,
      title: '2 new team messages',
      subtitle: 'Student Planner · Ziad · 09:45',
      isUnread: true,
    ),
    const NotificationItemModel(
      id: '4',
      category: NotificationCategory.project,
      title: 'Youssef requested to join',
      subtitle: 'Student Planner · Backend · Today, 09:30',
      isUnread: true,
    ),
    const NotificationItemModel(
      id: '5',
      category: NotificationCategory.project,
      title: 'MVP scope deadline approaching',
      subtitle: 'Due 30 Oct · Read',
      isUnread: false,
    ),
  ];

  int get _unreadCount => _notifications.where((n) => n.isUnread).length;

  void _markAllAsRead() {
    setState(() {
      _notifications = _notifications.map((n) {
        return n.copyWith(isUnread: false);
      }).toList();
    });
  }

  void _onNotificationTap(NotificationItemModel item) {
    if (item.id == '1') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const InvitationUpdateScreen()),
      );
    } else if (item.id == '2') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ChatDetailsScreen(
            userName: 'Ahmed Khaled',
            userSubtitle: 'Flutter Developer · Available',
          ),
        ),
      );
    } else if (item.id == '3') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const TeamChatScreen(
            teamName: 'Student Planner',
            teamSubtitle: 'Team chat · Aya and Ziad · 2 members',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final invitations = _notifications
        .where((n) => n.category == NotificationCategory.invitation)
        .toList();
    final messages = _notifications
        .where((n) => n.category == NotificationCategory.message)
        .toList();
    final projects = _notifications
        .where((n) => n.category == NotificationCategory.project)
        .toList();

    final showInvitations = _selectedTabIndex == 0 || _selectedTabIndex == 1;
    final showMessages = _selectedTabIndex == 0 || _selectedTabIndex == 2;
    final showProjects = _selectedTabIndex == 0 || _selectedTabIndex == 3;

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
                title: 'Notifications',
                subtitle: 'Stay in the loop · $_unreadCount unread',
              ),
              SizedBox(height: AppSizes.lg.h),
              MessagesFilterTabs(
                tabs: const ['All', 'Invitations', 'Messages', 'Projects'],
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() => _selectedTabIndex = index);
                },
              ),
              if (showInvitations && invitations.isNotEmpty) ...[
                SizedBox(height: AppSizes.lg.h),
                _buildSectionTitle('Invitations'),
                SizedBox(height: AppSizes.sm.h),
                _buildNotificationGroupCard(invitations),
              ],
              if (showMessages && messages.isNotEmpty) ...[
                SizedBox(height: AppSizes.lg.h),
                _buildSectionTitle('Messages'),
                SizedBox(height: AppSizes.sm.h),
                _buildNotificationGroupCard(messages),
              ],
              if (showProjects && projects.isNotEmpty) ...[
                SizedBox(height: AppSizes.lg.h),
                _buildSectionTitle('Project updates'),
                SizedBox(height: AppSizes.sm.h),
                _buildNotificationGroupCard(projects),
              ],
              SizedBox(height: AppSizes.lg.h),
              _buildMarkAllAsReadButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyles.body.copyWith(
        fontFamily: AppFonts.Poppins,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1A162E),
      ),
    );
  }

  Widget _buildNotificationGroupCard(List<NotificationItemModel> items) {
    final options = items.map((item) {
      final subtitle = (!item.isUnread && item.subtitle.endsWith('Unread'))
          ? item.subtitle.replaceAll('Unread', 'Read')
          : item.subtitle;

      return ConversationOptionItem(
        title: item.title,
        subtitle: subtitle,
        showArrow: item.showArrow,
        onTap: () => _onNotificationTap(item),
      );
    }).toList();

    return ConversationOptionsCard(options: options);
  }

  Widget _buildMarkAllAsReadButton() {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: OutlinedButton(
        onPressed: _unreadCount > 0 ? _markAllAsRead : null,
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
          'Mark all as read',
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
