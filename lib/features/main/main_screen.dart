import 'package:flutter/material.dart';
import 'package:liquid_glass_lens_navbar/liquid_glass_lens_navbar.dart';

import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/home/presentation/pages/home_screen.dart';
import 'package:teamna/features/projects/presentation/pages/project_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  // Create Bottom Sheet
  void _showCreateSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.blurcl,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              const SizedBox(height: 20),

              Text(
                'Create something new',
                style: TextStyles.title2.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),

              const SizedBox(height: 15),

              _createOption(
                Icons.rocket_launch_outlined,
                'Create a project',
                'Start building your team',
                () {
                  Navigator.pop(context);
                  _showMessage('Project creation form is coming next.');
                },
              ),

              const SizedBox(height: 10),

              _createOption(
                Icons.person_add_alt_1,
                'Invite a teammate',
                'Bring someone to your project',
                () {
                  Navigator.pop(context);
                  _showMessage('Invite flow is coming next.');
                },
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  // SnackBar
  void _showMessage(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      tileColor: Colors.white,
      leading: CircleAvatar(
        backgroundColor: AppColors.primaryColor.withValues(alpha: .1),
        child: Icon(icon, color: AppColors.primaryColor),
      ),
      title: Text(
        title,
        style: TextStyles.body.copyWith(color: AppColors.primaryColor),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyles.caption2.copyWith(color: AppColors.greyColor),
      ),
    );
  }

  // Liquid Glass Navigation Bar
  
Widget _buildGlassNavigationBar() {
  return LiquidGlassNavBar(
    currentIndex: selectedIndex,

    onTap: (index) {
      if (index == 2) {
        _showCreateSheet();
        return;
      }

      setState(() {
        selectedIndex = index > 2 ? index - 1 : index;
      });
    },

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
        label: 'Messages',
      ),

      LiquidGlassNavItem(
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
        label: 'Profile',
      ),
    ],

    appearance: LiquidGlassAppearance.tinted,
    backgroundOpacity: 0.85,

    enableLens: true,
    enableEdgeRefraction: true,
    enableDrag: true,
    enableHaptics: true,

    duration: const Duration(milliseconds: 460),

    quality: LiquidGlassQuality.adaptive,
  );
}

  // Floating Create Button

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

      // Allow content behind the glass
      extendBody: true,

      // Keep screens alive
      body: IndexedStack(index: selectedIndex, children: screens),

      // Glass Navbar + Floating Create Button
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildGlassNavigationBar(),
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Screens
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
              Icon(icon, color: AppColors.primaryColor, size: 54),

              const SizedBox(height: 12),

              Text(
                title,
                style: TextStyles.title2.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                'Your $title will appear here.',
                style: TextStyles.caption.copyWith(color: AppColors.greyColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
