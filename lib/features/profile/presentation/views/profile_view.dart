import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/features/profile/data/models/user_profile_model.dart';
import 'package:t2mna/features/profile/presentation/views/edit_profile_view.dart';
import 'package:t2mna/features/profile/presentation/widgets/profile_header_bar.dart';
import 'package:t2mna/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:t2mna/features/profile/presentation/widgets/profile_recent_activity_card.dart';
import 'package:t2mna/features/profile/presentation/widgets/profile_skills_card.dart';
import 'package:t2mna/features/profile/presentation/widgets/profile_stats_card.dart';
import 'package:t2mna/features/profile/presentation/widgets/profile_verified_banner.dart';
import 'verification_get_started_view.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late UserProfileModel _profile;

  @override
  void initState() {
    super.initState();
    _profile = UserProfileModel(
      initials: 'NA',
      fullName: 'Nour Adel',
      roleAndCity: 'Flutter Developer · Cairo',
      batchTag: 'DEPI Round 7',
      trackTag: 'Flutter track',
      bio:
          'Building mobile apps with BLoC and Firebase. Looking for a team to ship a real product.',
      isVerified: true,
      verificationTitle: 'Verified · DEPI Round 7',
      verificationDate: 'Confirmed by t2mna on 12 Oct 2026',
      projectsCount: 3,
      applicationsCount: 8,
      avgMatchPercentage: 91,
      primarySkill: 'Flutter',
      skills: const ['Flutter', 'BLoC', 'Dart', 'Firebase', 'Figma'],
      recentActivities: [
        const ProfileActivityItem(
          title: 'Accepted to Campus Carpool',
          subtitle: 'Flutter Developer · 2 days ago',
          icon: Icons.check_rounded,
          iconColor: AppColors.greenColor,
          iconBgColor: AppColors.lightGreenColor,
        ),
        ProfileActivityItem(
          title: 'Handoff filed · Study Buddy',
          subtitle: 'Seat reopened · 1 week ago',
          icon: Icons.description_outlined,
          iconColor: AppColors.primaryColor,
          iconBgColor: AppColors.purple500.withValues(alpha: 0.14),
        ),
      ],
    );
  }

  Future<void> _openEditProfile() async {
    final updatedProfile = await Navigator.push<UserProfileModel>(
      context,
      MaterialPageRoute(builder: (_) => EditProfileView(profile: _profile)),
    );

    if (updatedProfile != null) {
      setState(() => _profile = updatedProfile);
    }
  }

  void _openVerification() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const VerificationGetStartedView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            AppSizes.screenHorizontalPadding.w,
            AppSizes.sm.h,
            AppSizes.screenHorizontalPadding.w,
            105.h,
          ),
          child: Column(
            children: [
              ProfileHeaderBar(onNotificationsTap: () {}, onSettingsTap: () {}),
              SizedBox(height: AppSizes.lg.h),
              ProfileInfoCard(profile: _profile, onEditTap: _openEditProfile),
              SizedBox(height: AppSizes.md.h),
              ProfileVerifiedBanner(
                title: _profile.verificationTitle,
                subtitle: _profile.verificationDate,
                onTap: _openVerification,
              ),
              SizedBox(height: AppSizes.md.h),
              ProfileStatsCard(
                projectsCount: _profile.projectsCount,
                applicationsCount: _profile.applicationsCount,
                avgMatchPercentage: _profile.avgMatchPercentage,
              ),
              SizedBox(height: AppSizes.md.h),
              ProfileSkillsCard(
                skills: _profile.skills,
                primarySkill: _profile.primarySkill,
              ),
              SizedBox(height: AppSizes.md.h),
              ProfileRecentActivityCard(
                activities: _profile.recentActivities,
                onSeeAllTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
