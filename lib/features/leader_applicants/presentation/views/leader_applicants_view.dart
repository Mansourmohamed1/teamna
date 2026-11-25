import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/leader_applicants/data/models/applicant_model.dart';
import 'package:t2mna/features/leader_applicants/presentation/views/scope_update_bottom_sheet.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/applicant_card.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/leader_app_bar.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/role_filter_tabs.dart';

import 'leave_project_handoff_view.dart';
import 'transfer_leadership_view.dart';

class LeaderApplicantsView extends StatefulWidget {
  const LeaderApplicantsView({super.key});

  @override
  State<LeaderApplicantsView> createState() => _LeaderApplicantsViewState();
}

class _LeaderApplicantsViewState extends State<LeaderApplicantsView> {
  int _selectedTabIndex = 0;

  final List<String> _categories = const ['Flutter Dev', 'Back-End', 'UI/UX'];

  final List<ApplicantModel> _applicants = [
    const ApplicantModel(
      id: '1',
      initials: 'MA',
      avatarColor: Color(0xFF4A72B8),
      avatarBgColor: Color(0xFFDCE7F9),
      name: 'Mariam Ali',
      roleTitle: 'Flutter Developer',
      roleCategory: 'Flutter Dev',
      batchTag: 'DEPI Round 7',
      matchPercentage: 94,
      pitch:
          'Built a ride-sharing prototype in Flutter during DEPI Round 7. Comfortable with BLoC and Google Maps.',
      githubUrl: 'github.com/mariam',
      availability: '10h / week',
    ),
    const ApplicantModel(
      id: '2',
      initials: 'AK',
      avatarColor: Color(0xFFD85B88),
      avatarBgColor: Color(0xFFFADCE8),
      name: 'Ahmed Khaled',
      roleTitle: 'Flutter Developer',
      roleCategory: 'Flutter Dev',
      batchTag: 'DEPI Round 7',
      matchPercentage: 88,
      pitch:
          'Two published apps on Google Play. I can own the driver verification flow and Firebase auth.',
      githubUrl: 'github.com/ahmed',
      availability: '10h / week',
    ),
    const ApplicantModel(
      id: '3',
      initials: 'OS',
      avatarColor: AppColors.orangeColor,
      avatarBgColor: AppColors.yellowColor,
      name: 'Omar Samir',
      roleTitle: 'Back-End Engineer',
      roleCategory: 'Back-End',
      batchTag: 'ITI Intake 45',
      matchPercentage: 91,
      pitch:
          'Experienced with Node.js, Firebase Cloud Functions, and real-time location tracking APIs.',
      githubUrl: 'github.com/omarsamir',
      availability: '8h / week',
    ),
    const ApplicantModel(
      id: '4',
      initials: 'NH',
      avatarColor: AppColors.greenColor,
      avatarBgColor: AppColors.lightGreenColor,
      name: 'Nourhan Hassan',
      roleTitle: 'UI/UX Designer',
      roleCategory: 'UI/UX',
      batchTag: 'DEPI Round 7',
      matchPercentage: 95,
      pitch:
          'Designed end-to-end mobile apps in Figma with interactive prototypes and design systems.',
      githubUrl: 'behance.net/nourhan',
      availability: '8h / week',
    ),
  ];

  List<String> get _tabLabels {
    return _categories.map((cat) {
      final count = _applicants.where((a) => a.roleCategory == cat).length;
      return '$cat · $count';
    }).toList();
  }

  List<ApplicantModel> get _filteredApplicants {
    final selectedCat = _categories[_selectedTabIndex];
    return _applicants.where((a) => a.roleCategory == selectedCat).toList();
  }

  void handleDecision(ApplicantModel applicant, {required bool accepted}) {
    setState(() {
      _applicants.removeWhere((a) => a.id == applicant.id);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          accepted
              ? '${applicant.name} accepted to the team!'
              : '${applicant.name} rejected.',
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: accepted ? AppColors.greenColor : AppColors.redColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
      ),
    );
  }

  void showProjectActionsMenu() {
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
          padding: EdgeInsets.all(AppSizes.xl.w),
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
                'Team & Project Actions',
                style: TextStyles.title2.copyWith(
                  fontFamily: AppFonts.Poppins,
                  color: AppColors.blackColor,
                ),
              ),
              SizedBox(height: AppSizes.lg.h),

              actionTile(
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
              SizedBox(height: AppSizes.md.h),

              actionTile(
                icon: Icons.sync_rounded,
                iconColor: AppColors.primaryColor,
                iconBgColor: AppColors.purple500.withValues(alpha: 0.14),
                title: 'Scope update alert',
                subtitle: 'Review & confirm updated project plan',
                onTap: () {
                  Navigator.pop(sheetContext);
                  ScopeUpdateBottomSheet.show(
                    context,
                    onAgree: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('You agreed to the updated scope!'),
                        ),
                      );
                    },
                    onTalkToTeam: () {},
                  );
                },
              ),
              SizedBox(height: AppSizes.md.h),

              actionTile(
                icon: Icons.exit_to_app_rounded,
                iconColor: AppColors.redColor,
                iconBgColor: AppColors.lighRedColor,
                title: 'Leave project',
                subtitle: 'Complete mandatory handoff form',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget actionTile({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusXl),
      ),
      tileColor: AppColors.whiteColor,
      leading: Container(
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
          color: iconBgColor,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
        child: Icon(icon, color: iconColor, size: AppSizes.iconMedium.sp),
      ),
      title: Text(
        title,
        style: TextStyles.caption.copyWith(
          fontFamily: AppFonts.Poppins,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyles.caption2.copyWith(
          fontFamily: AppFonts.Poppins,
          color: AppColors.blurcl,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 14.sp,
        color: AppColors.blurcl,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibleApplicants = _filteredApplicants;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.screenHorizontalPadding.w,
          ),
          child: Column(
            children: [
              SizedBox(height: AppSizes.sm.h),
              LeaderAppBar(
                title: 'Applicants',
                trailing: InkWell(
                  onTap: showProjectActionsMenu,
                  borderRadius: BorderRadius.circular(AppSizes.radiusRound),
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.bordercl),
                    ),
                    child: Icon(
                      Icons.more_horiz_rounded,
                      size: AppSizes.iconMedium.sp,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AppSizes.lg.h),
              RoleFilterTabs(
                tabs: _tabLabels,
                selectedIndex: _selectedTabIndex,
                onTabSelected: (index) {
                  setState(() => _selectedTabIndex = index);
                },
              ),
              SizedBox(height: AppSizes.lg.h),
              Expanded(
                child: visibleApplicants.isEmpty
                    ? Center(
                        child: Text(
                          'No pending applicants in this role.',
                          style: TextStyles.caption.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.lightPrimaryColor,
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(bottom: AppSizes.lg.h),
                        itemCount: visibleApplicants.length,
                        separatorBuilder: (_, __) => SizedBox(height: 16.h),
                        itemBuilder: (context, index) {
                          final applicant = visibleApplicants[index];
                          return ApplicantCard(
                            applicant: applicant,
                            onReject: () =>
                                handleDecision(applicant, accepted: false),
                            onAccept: () =>
                                handleDecision(applicant, accepted: true),
                          );
                        },
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.lg.h,
                ),
                child: AppButton(
                  text: 'Review all ${_applicants.length} applicants',
                  width: double.infinity,
                  onPressed: () {
                    setState(() => _selectedTabIndex = 0);
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
