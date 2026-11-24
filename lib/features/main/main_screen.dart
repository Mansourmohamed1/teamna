<<<<<<< HEAD

import 'package:flutter/material.dart';
import 'package:liquid_glass_lens_navbar/liquid_glass_lens_navbar.dart';

import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/home/presentation/pages/home_screen.dart';
import 'package:t2mna/features/project_workspace/presentation/pages/project_workspace_screen.dart';
import 'package:t2mna/features/projects/presentation/pages/project_screen.dart';
=======
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/create_team/presentation/views/build_team_problem_view.dart';
import 'package:teamna/features/home/presentation/pages/home_screen.dart';
import 'package:teamna/features/leader_applicants/presentation/views/leader_applicants_view.dart';
import 'package:teamna/features/leader_applicants/presentation/views/leave_project_handoff_view.dart';
import 'package:teamna/features/leader_applicants/presentation/views/scope_update_bottom_sheet.dart';
import 'package:teamna/features/leader_applicants/presentation/views/transfer_leadership_view.dart';
import 'package:teamna/features/profile/presentation/views/profile_view.dart';
import 'package:teamna/features/projects/presentation/pages/project_screen.dart';
>>>>>>> origin/main

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _showCreateSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.backgroundColor,
<<<<<<< HEAD
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
=======
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusXxl),
>>>>>>> origin/main
        ),
      ),
      builder: (sheetContext) => SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.xl.w,
            vertical: AppSizes.lg.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: AppColors.blurcl.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                ),
              ),
              SizedBox(height: AppSizes.lg.h),
              Text(
                'Quick Actions',
                style: TextStyles.title2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: AppSizes.lg.h),

<<<<<<< HEAD
              const SizedBox(height: 15),

              _createOption(
                Icons.rocket_launch_outlined,
                'Create a project',
                'Start building your team',
                () {
                  Navigator.pop(context);
                  _showMessage(
                    'Project creation form is coming next.',
=======
              _buildCreateOption(
                icon: Icons.rocket_launch_outlined,
                iconColor: AppColors.primaryColor,
                iconBgColor: AppColors.purple500.withValues(alpha: 0.14),
                title: 'Create a project',
                subtitle: 'Start building your team',
                onTap: () {
                  Navigator.pop(sheetContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const BuildTeamProblemView(),
                    ),
>>>>>>> origin/main
                  );
                },
              ),
              SizedBox(height: AppSizes.sm.h),

<<<<<<< HEAD
              const SizedBox(height: 10),

              _createOption(
                Icons.person_add_alt_1,
                'Invite a teammate',
                'Bring someone to your project',
                () {
                  Navigator.pop(context);
                  _showMessage(
                    'Invite flow is coming next.',
=======
              _buildCreateOption(
                icon: Icons.groups_outlined,
                iconColor: AppColors.greenColor,
                iconBgColor: AppColors.lightGreenColor,
                title: 'Review applicants',
                subtitle: 'Accept or reject team requests',
                onTap: () {
                  Navigator.pop(sheetContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LeaderApplicantsView(),
                    ),
>>>>>>> origin/main
                  );
                },
              ),
              SizedBox(height: AppSizes.sm.h),

              _buildCreateOption(
                icon: Icons.workspace_premium_outlined,
                iconColor: AppColors.orangeColor,
                iconBgColor: AppColors.yellowColor,
                title: 'Transfer leadership',
                subtitle: 'Nominate another member to lead',
                onTap: () {
                  Navigator.pop(sheetContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const TransferLeadershipView(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSizes.sm.h),

              _buildCreateOption(
                icon: Icons.sync_rounded,
                iconColor: AppColors.primaryColor,
                iconBgColor: AppColors.purple500.withValues(alpha: 0.14),
                title: 'Scope update',
                subtitle: 'Review & confirm updated project plan',
                onTap: () {
                  Navigator.pop(sheetContext);
                  ScopeUpdateBottomSheet.show(
                    context,
                    onAgree: () {
                      _showMessage('You agreed to the updated scope!');
                    },
                    onTalkToTeam: () {
                      setState(() => _selectedIndex = 2);
                    },
                  );
                },
              ),
              SizedBox(height: AppSizes.sm.h),

              _buildCreateOption(
                icon: Icons.exit_to_app_rounded,
                iconColor: AppColors.redColor,
                iconBgColor: AppColors.lighRedColor,
                title: 'Leave project (Handoff)',
                subtitle: 'Submit your branch & leave team',
                onTap: () {
                  Navigator.pop(sheetContext);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const LeaveProjectHandoffView(),
                    ),
                  );
                },
              ),
              SizedBox(height: AppSizes.sm.h),
            ],
          ),
        ),
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
<<<<<<< HEAD
        content: Text(message),
      ),
    );
  }

  // Create Sheet Option
  Widget _createOption(
    IconData icon,
    String title,
    String subtitle,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      tileColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor:
            AppColors.primaryColor.withValues(alpha: .1),
        child: Icon(
          icon,
          color: AppColors.primaryColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyles.body.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyles.caption2.copyWith(
          color: AppColors.greyColor,
=======
        content: Text(
          message,
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
>>>>>>> origin/main
        ),
      ),
    );
  }

<<<<<<< HEAD
  // Liquid Glass Navigation Bar
  Widget _buildGlassNavigationBar() {
    return LiquidGlassNavBar(
      // Map page index to navbar index
      currentIndex: selectedIndex < 2
          ? selectedIndex
          : selectedIndex + 1,

      // Navigation Logic
      onTap: (index) {
        // Create action
        if (index == 2) {
          _showCreateSheet();
          return;
        }

        // Update selected page
        setState(() {
          selectedIndex = index > 2
              ? index - 1
              : index;
        });
      },

      // Navigation Items
      items: const [
        LiquidGlassNavItem(
          icon: Icons.home_outlined,
          selectedIcon: Icons.home_rounded,
          label: 'Home',
        ),

        LiquidGlassNavItem(
          icon: Icons.explore_outlined,
          selectedIcon: Icons.explore,
          label: 'Explore',
        ),

        LiquidGlassNavItem(
          icon: Icons.add_circle,
          selectedIcon: Icons.add_circle,
          label: 'Create',
        ),

        LiquidGlassNavItem(
          icon: Icons.chat_bubble_outline,
          selectedIcon: Icons.chat_bubble,
          label: 'ًWorkspace',
        ),

        LiquidGlassNavItem(
          icon: Icons.person_outline,
          selectedIcon: Icons.person,
          label: 'Profile',
        ),
      ],

      // Glass Appearance
      appearance: LiquidGlassAppearance.tinted,
      backgroundOpacity: 0.85,

      // Lens Effects
      enableLens: true,
      enableEdgeRefraction: true,

      // Animations
      enableDrag: true,
      enableHaptics: true,
      duration: const Duration(milliseconds: 460),

      // Performance
      quality: LiquidGlassQuality.adaptive,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Application Screens
    final screens = [
      const HomeScreen(),
      const ProjectScreen(),
      const ProjectWorkspaceScreen(),
      const _SimplePage(
        title: 'Profile',
        icon: Icons.person_outline,
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      // Allow content behind glass
      extendBody: true,

      // Preserve screen states
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),

      // Liquid Glass Bottom Navigation
      bottomNavigationBar: SafeArea(
        top: false,
        child: _buildGlassNavigationBar(),
=======
  Widget _buildCreateOption({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
          border: Border.all(color: AppColors.bordercl),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusLg),
              ),
              child: Icon(icon, color: iconColor, size: AppSizes.iconMedium.sp),
            ),
            SizedBox(width: AppSizes.md.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyles.caption.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: TextStyles.caption2.copyWith(
                      fontFamily: AppFonts.Poppins,
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.sp,
              color: AppColors.blurcl,
            ),
          ],
        ),
>>>>>>> origin/main
      ),
    );
  }

  Widget _buildLiquidGlassNavBar() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 14.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryColor.withValues(alpha: 0.14),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusRound),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(
                height: 68.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.whiteColor.withValues(alpha: 0.45),
                      AppColors.whiteColor.withValues(alpha: 0.22),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                  border: Border.all(
                    color: AppColors.whiteColor.withValues(alpha: 0.85),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(
                      icon: Icons.home_outlined,
                      activeIcon: Icons.home_rounded,
                      label: 'Home',
                      index: 0,
                    ),
                    _buildNavItem(
                      icon: Icons.explore_outlined,
                      activeIcon: Icons.explore_rounded,
                      label: 'Explore',
                      index: 1,
                    ),
                    GestureDetector(
                      onTap: _showCreateSheet,
                      child: Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.purple500,
                              AppColors.primaryColor,
                            ],
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.whiteColor.withValues(alpha: 0.5),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryColor.withValues(
                                alpha: 0.35,
                              ),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.add_rounded,
                          color: AppColors.whiteColor,
                          size: 28.sp,
                        ),
                      ),
                    ),
                    _buildNavItem(
                      icon: Icons.layers_outlined,
                      activeIcon: Icons.layers_outlined,
                      label: 'Projects',
                      index: 2,
                    ),
                    _buildNavItem(
                      icon: Icons.person_outline_rounded,
                      activeIcon: Icons.person_rounded,
                      label: 'Profile',
                      index: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withValues(alpha: 0.14)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.radiusXl),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.08 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Icon(
                isSelected ? activeIcon : icon,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.lightPrimaryColor,
                size: 22.sp,
              ),
            ),
            SizedBox(height: 2.h),
            Text(
              label,
              style: TextStyles.caption2.copyWith(
                fontFamily: AppFonts.Poppins,
                fontSize: 10.sp,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.lightPrimaryColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const ProjectScreen(),
      const _SimplePage(title: 'Projects', icon: Icons.layers_outlined),
      const ProfileView(),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: IndexedStack(index: _selectedIndex, children: screens),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildLiquidGlassNavBar(),
          ),
        ],
      ),
    );
  }
}

class _SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SimplePage({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
<<<<<<< HEAD
              Icon(
                icon,
                color: AppColors.primaryColor,
                size: 54,
              ),

              const SizedBox(height: 12),

=======
              Icon(icon, color: AppColors.primaryColor, size: 54.sp),
              SizedBox(height: AppSizes.md.h),
>>>>>>> origin/main
              Text(
                title,
                style: TextStyles.title2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                'Your $title will appear here.',
                style: TextStyles.caption.copyWith(
<<<<<<< HEAD
=======
                  fontFamily: AppFonts.Poppins,
>>>>>>> origin/main
                  color: AppColors.greyColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
