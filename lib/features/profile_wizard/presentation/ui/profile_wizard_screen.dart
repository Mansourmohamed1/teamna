import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_duration.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/profile_wizard_data.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/profile_success_screen.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/initiative_step.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/skills_step.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/track_round_step.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/verify_step.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/wizard_header.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/wizard_progress.dart';

class ProfileWizardScreen extends StatefulWidget {
  const ProfileWizardScreen({super.key});

  @override
  State<ProfileWizardScreen> createState() => _ProfileWizardScreenState();
}

class _ProfileWizardScreenState extends State<ProfileWizardScreen> {
  static const _totalSteps = 4;

  final _pageController = PageController();
  final _data = ProfileWizardData();
  int _step = 0;

  bool get _isLast => _step == _totalSteps - 1;

  void _refresh() => setState(() {});

  void _goTo(int page) => _pageController.animateToPage(
    page,
    duration: AppDurations.normal,
    curve: Curves.easeInOut,
  );

  void _onBack() => _step == 0 ? Navigator.maybePop(context) : _goTo(_step - 1);

  void _onContinue() => _isLast ? _finish() : _goTo(_step + 1);

  void _finish() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfileSuccessScreen()),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _data.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            WizardHeader(
              currentStep: _step + 1,
              totalSteps: _totalSteps,
              onBack: _onBack,
              onSkip: _finish, // TODO: روحي للـ Home
            ),
            WizardProgressBar(currentStep: _step + 1, totalSteps: _totalSteps),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _step = i),
                children: [
                  InitiativeStep(data: _data, onChanged: _refresh),
                  TrackRoundStep(data: _data, onChanged: _refresh),
                  SkillsStep(data: _data, onChanged: _refresh),
                  VerifyStep(data: _data, onChanged: _refresh),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: AppSizes.xl.h),
              child: Column(
                children: [
                  AppButton(
                    text: _isLast ? 'Submit for verification' : 'Continue',
                    onPressed: _onContinue,
                  ),
                  if (_isLast) ...[
                    SizedBox(height: AppSizes.md.h),
                    GestureDetector(
                      onTap: _finish,
                      child: Text(
                        'I will do this later',
                        style: TextStyles.caption2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          fontWeight: FontWeight.w500,
                          color: AppColors.orangeColor,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
