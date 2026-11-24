import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_duration.dart';
import 'package:t2mna/core/routes/routes_name.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/features/onboarding/data/model/onboarding_item.dart';
import 'package:t2mna/features/onboarding/presentation/ui/widgets/onboarding_illustration.dart';
import 'package:t2mna/features/onboarding/presentation/ui/widgets/onboarding_panel.dart';
import 'package:t2mna/features/onboarding/presentation/ui/widgets/onboarding_top_bar.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  bool get _isLast => _index == onboardingItems.length - 1;

  void _goTo(int page) => _controller.animateToPage(
        page,
        duration: AppDurations.normal,
        curve: Curves.easeInOut,
      );

  void _onNext() {
    if (_isLast) {
      Navigator.pushReplacementNamed(context, RouteNames.login);
    } else {
      _goTo(_index + 1);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = onboardingItems[_index];
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: onboardingItems.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (_, i) => OnboardingIllustration(
                imagePath: onboardingItems[i].imagePath, imageHeight: onboardingItems[i].imageHeight,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: OnboardingBottomPanel(
                height: screenHeight * item.panelHeightFactor,
                title: item.title,
                description: item.description,
                currentIndex: _index,
                count: onboardingItems.length,
                buttonText: item.buttonText,
                onPressed: _onNext,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: OnboardingTopBar(
                showBack: _index > 0,
                showSkip: !_isLast,
                onBack: () => _goTo(_index - 1),
                onSkip: () => _goTo(onboardingItems.length - 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}