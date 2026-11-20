import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_assets.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/conversation_model.dart';
import 'package:t2mna/features/messages/presentation/pages/chat_details_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/new_conversation_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/notifications_screen.dart';
import 'package:t2mna/features/messages/presentation/pages/team_chat_screen.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_filter_tabs.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_search_bar.dart';
import 'package:t2mna/features/messages/presentation/widgets/private_chat_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/team_chats_card.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int _selectedTabIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<PrivateChatModel> _privateChats = const [
    PrivateChatModel(
      id: '1',
      userName: 'Ahmed Khaled',
      userImage: AppAssets.boyImage,
      lastMessage: "Thanks Aya, I'll review the invitation!",
      time: '10:24',
      unreadCount: 1,
      isOnline: true,
    ),
  ];

  final List<TeamChatModel> _teamChats = const [
    TeamChatModel(
      id: '101',
      teamName: 'Student Planner',
      lastSender: 'Ziad',
      lastMessage: 'API schema is ready to review.',
      time: '09:45',
      unreadCount: 2,
      membersCount: 2,
    ),
    TeamChatModel(
      id: '102',
      teamName: 'Design Jam Circle',
      lastSender: 'You',
      lastMessage: "See you at Wednesday's review!",
      time: 'Yesterday',
      unreadCount: 0,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final showPrivate = _selectedTabIndex == 0 || _selectedTabIndex == 1;
    final showTeams = _selectedTabIndex == 0 || _selectedTabIndex == 2;

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
              const MessagesHeader(
                title: 'Messages',
                subtitle: 'A conversation can start something great.',
              ),
              SizedBox(height: AppSizes.xl.h),
              MessagesSearchBar(
                controller: _searchController,
                onChanged: (value) {
                  // TODO: Filter conversations
                },
                onFilterTap: () {
                  // TODO: Open filter bottom sheet
                },
              ),
              SizedBox(height: AppSizes.md.h),
              MessagesFilterTabs(
                tabs: [
                  'All (${_privateChats.length + _teamChats.length})',
                  'Private (${_privateChats.length})',
                  'Teams (${_teamChats.length})',
                ],
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() => _selectedTabIndex = index);
                },
              ),
              SizedBox(height: AppSizes.lg.h),
              _buildSectionHeader(),
              SizedBox(height: AppSizes.md.h),
              if (showPrivate) ...[
                ..._privateChats.map(
                  (chat) => Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.md.h),
                    child: PrivateChatCard(
                      chat: chat,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatDetailsScreen(
                              userName: chat.userName,
                              userSubtitle: 'Flutter Developer · Available',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
              if (showTeams) ...[
                TeamChatsCard(
                  teams: _teamChats,
                  onTeamTap: (team) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TeamChatScreen(
                          teamName: team.teamName,
                          teamSubtitle:
                              'Team chat · Aya and ${team.lastSender} · ${team.membersCount ?? 2} members',
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: AppSizes.md.h),
              ],
              const CollaborationInfoBanner(
                title: 'Keep collaboration close',
                description: 'Private chats don’t require team membership. Team chats are visible only to members.',
              ),
              SizedBox(height: AppSizes.xl.h),
              Center(
                child: AppButton(
                  text: 'New conversation',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NewConversationScreen(),
                      ),
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

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today',
          style: TextStyles.body.copyWith(
            fontFamily: AppFonts.Poppins,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A162E),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const NotificationsScreen()),
            );
          },
          child: Text(
            'Notifications',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
