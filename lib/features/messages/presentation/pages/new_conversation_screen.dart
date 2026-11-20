import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_assets.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/messages/data/models/suggested_person_model.dart';
import 'package:t2mna/features/messages/presentation/pages/chat_details_screen.dart';
import 'package:t2mna/features/messages/presentation/widgets/collaboration_info_banner.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_header.dart';
import 'package:t2mna/features/messages/presentation/widgets/messages_search_bar.dart';
import 'package:t2mna/features/messages/presentation/widgets/suggested_person_card.dart';
import 'package:t2mna/features/messages/presentation/widgets/teammate_suggestion_card.dart';

class NewConversationScreen extends StatefulWidget {
  const NewConversationScreen({super.key});

  @override
  State<NewConversationScreen> createState() => _NewConversationScreenState();
}

class _NewConversationScreenState extends State<NewConversationScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<SuggestedPersonModel> _suggestedPeople = const [
    SuggestedPersonModel(
      id: '1',
      name: 'Ahmed Khaled',
      imageUrl: AppAssets.boyImage,
      roleAndOrg: 'Flutter Developer · DEPI',
      statusText: 'You have a pending invitation together',
      isVerified: true,
      isOnline: true,
      actionButtonText: 'Message Ahmed',
    ),
    SuggestedPersonModel(
      id: '2',
      name: 'Sara Mahmoud',
      imageUrl: AppAssets.boyImage, 
      roleAndOrg: 'UI/UX Designer · ITI',
      statusText: 'Available · Remote',
      isVerified: true,
      isOnline: false,
    ),
  ];

  final TeammateSuggestionModel _teammate = const TeammateSuggestionModel(
    id: '3',
    name: 'Ziad Mostafa',
    projectTitle: 'Your teammate · Student Planner',
  );

  void _openChat(String name, String subtitle) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ChatDetailsScreen(
          userName: name,
          userSubtitle: subtitle,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            bottom: AppSizes.bottomNavHeight + AppSizes.xl.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MessagesHeader(
                title: 'New conversation',
                subtitle: 'Find someone to build with.',
              ),
              SizedBox(height: AppSizes.xl.h),
              MessagesSearchBar(
                hintText: 'Search name or skill',
                controller: _searchController,
                onChanged: (value) {},
                onFilterTap: () {},
              ),
              SizedBox(height: AppSizes.lg.h),
              Text(
                'Suggested people',
                style: TextStyles.body.copyWith(
                  fontFamily: AppFonts.Poppins,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A162E),
                ),
              ),
              SizedBox(height: AppSizes.md.h),
              ..._suggestedPeople.map(
                (person) => Padding(
                  padding: EdgeInsets.only(bottom: AppSizes.md.h),
                  child: SuggestedPersonCard(
                    person: person,
                    onAddPersonTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Invitation sent to ${person.name}'),
                        ),
                      );
                    },
                    onActionButtonTap: () =>
                        _openChat(person.name, person.roleAndOrg),
                    onCardTap: () => _openChat(person.name, person.roleAndOrg),
                  ),
                ),
              ),
              TeammateSuggestionCard(
                teammate: _teammate,
                onTap: () =>
                    _openChat(_teammate.name, _teammate.projectTitle),
              ),
              SizedBox(height: AppSizes.md.h),
              const CollaborationInfoBanner(
                title: 'Start respectfully',
                description:
                    'Introduce your project and explain why you’d like to collaborate. Never share private documents without permission.',
              ),
              SizedBox(height: AppSizes.md.h),
              _buildBrowsePeopleButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrowsePeopleButton() {
    return SizedBox(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: OutlinedButton(
        onPressed: () {},
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
          'Browse people',
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