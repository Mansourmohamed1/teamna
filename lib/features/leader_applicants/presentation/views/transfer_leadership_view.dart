import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/create_team/presentation/widgets/tip_info_card.dart';
import 'package:t2mna/features/leader_applicants/data/models/team_member_model.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/leader_app_bar.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/leader_member_selection_card.dart';

class TransferLeadershipView extends StatefulWidget {
  const TransferLeadershipView({super.key});

  @override
  State<TransferLeadershipView> createState() => _TransferLeadershipViewState();
}

class _TransferLeadershipViewState extends State<TransferLeadershipView> {
  final List<TeamMemberModel> _members = const [
    TeamMemberModel(
      id: '1',
      initials: 'NA',
      avatarColor: AppColors.orangeColor,
      avatarBgColor: Color(0xFFFBE5D1),
      name: 'Nour Adel',
      role: 'Flutter Dev',
      completedTasks: 6,
    ),
    TeamMemberModel(
      id: '2',
      initials: 'HM',
      avatarColor: Color(0xFF4A72B8),
      avatarBgColor: Color(0xFFDCE7F9),
      name: 'Hana Mahmoud',
      role: 'Flutter Dev',
      completedTasks: 4,
    ),
    TeamMemberModel(
      id: '3',
      initials: 'OS',
      avatarColor: Color(0xFFD49B2A),
      avatarBgColor: AppColors.yellowColor,
      name: 'Omar Samir',
      role: 'QA',
      completedTasks: 5,
    ),
  ];

  late String _selectedMemberId;

  @override
  void initState() {
    super.initState();
    _selectedMemberId = _members.first.id;
  }

  TeamMemberModel get _selectedMember =>
      _members.firstWhere((m) => m.id == _selectedMemberId);

  void _onNominate() {
    final member = _selectedMember;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Leadership nomination sent to ${member.name}.',
          style: TextStyles.caption2.copyWith(
            fontFamily: AppFonts.Poppins,
            color: AppColors.whiteColor,
          ),
        ),
        backgroundColor: AppColors.greenColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        ),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
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
              const LeaderAppBar(title: 'Transfer leadership'),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSizes.xxl.h,
                    bottom: AppSizes.lg.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Who leads next?',
                        style: TextStyles.headline2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.sm.h),
                      Text(
                        'Choose an active member. Their new rights start the moment they confirm.',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.lightPrimaryColor,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: AppSizes.xxl.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _members.length,
                        separatorBuilder: (_, _) => SizedBox(height: 14.h),
                        itemBuilder: (context, index) {
                          final member = _members[index];
                          return LeaderMemberSelectionCard(
                            member: member,
                            isSelected: member.id == _selectedMemberId,
                            onTap: () {
                              setState(() => _selectedMemberId = member.id);
                            },
                          );
                        },
                      ),
                      SizedBox(height: AppSizes.lg.h),

                      const TipInfoCard(
                        title: 'What moves to the new leader',
                        description:
                            'Review applicants, edit the project and approve exits.',
                        icon: Icons.workspace_premium_outlined,
                        iconColor: AppColors.orangeColor,
                        backgroundColor: AppColors.yellowColor,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.md.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      text: 'Nominate ${_selectedMember.firstName}',
                      width: double.infinity,
                      backgroundColor: AppColors.orangeColor,
                      foregroundColor: AppColors.whiteColor,
                      onPressed: _onNominate,
                    ),
                    SizedBox(height: AppSizes.sm.h),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
