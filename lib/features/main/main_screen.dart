import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/create_team/presentation/pages/build_team_problem_view.dart';
import 'package:teamna/features/home/presentation/pages/home_screen.dart';
import 'package:teamna/features/projects/presentation/pages/project_screen.dart';

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
      backgroundColor: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSizes.radiusXxl),
        ),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
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
              SizedBox(height: AppSizes.xl.h),
              Text(
                'Create something new',
                style: TextStyles.title2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: AppSizes.lg.h),
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
                  );
                },
              ),
              SizedBox(height: AppSizes.md.h),
              _buildCreateOption(
                icon: Icons.person_add_alt_1_outlined,
                iconColor: AppColors.orangeColor,
                iconBgColor: AppColors.yellowColor,
                title: 'Invite a teammate',
                subtitle: 'Bring someone to your project',
                onTap: () {
                  Navigator.pop(sheetContext);
                  _showMessage('Invite flow is coming next.');
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
        ),
      ),
    );
  }

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
                      icon: Icons.chat_bubble_outline_rounded,
                      activeIcon: Icons.chat_bubble_rounded,
                      label: 'Messages',
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
      const _SimplePage(title: 'Messages', icon: Icons.chat_bubble_outline),
      const _SimplePage(title: 'Profile', icon: Icons.person_outline),
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

  const _SimplePage({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.primaryColor, size: 54.sp),
              SizedBox(height: AppSizes.md.h),
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
                  fontFamily: AppFonts.Poppins,
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
