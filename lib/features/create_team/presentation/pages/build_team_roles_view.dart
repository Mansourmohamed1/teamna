import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/features/create_team/data/model/team_role_model.dart';
import 'package:teamna/features/create_team/presentation/pages/build_team_commitment_view.dart';
import 'package:teamna/features/create_team/presentation/widgets/build_team_app_bar.dart';
import 'package:teamna/features/create_team/presentation/widgets/role_counter_card.dart';
import 'package:teamna/features/create_team/presentation/widgets/total_seats_card.dart';

class BuildTeamRolesView extends StatefulWidget {
  const BuildTeamRolesView({super.key});

  @override
  State<BuildTeamRolesView> createState() => _BuildTeamRolesViewState();
}

class _BuildTeamRolesViewState extends State<BuildTeamRolesView> {
  late final List<TeamRoleModel> _roles;

  @override
  void initState() {
    super.initState();
    _roles = [
      TeamRoleModel(
        title: 'Flutter Developer',
        subtitle: 'Flutter · BLoC · Dart',
        icon: Icons.code_rounded,
        iconColor: AppColors.primaryColor,
        iconBgColor: AppColors.purple500.withValues(alpha: 0.14),
        count: 2,
      ),
      TeamRoleModel(
        title: 'Back-End Engineer',
        subtitle: 'Firebase · REST APIs',
        icon: Icons.dns_outlined,
        iconColor: AppColors.orangeColor,
        iconBgColor: AppColors.yellowColor,
        count: 1,
      ),
      TeamRoleModel(
        title: 'UI/UX Designer',
        subtitle: 'Figma · Prototyping',
        icon: Icons.edit_outlined,
        iconColor: AppColors.redColor,
        iconBgColor: AppColors.lighRedColor,
        count: 1,
      ),
      TeamRoleModel(
        title: 'QA Engineer',
        subtitle: 'Testing · CI',
        icon: Icons.bug_report_outlined,
        iconColor: AppColors.greenColor,
        iconBgColor: AppColors.lightGreenColor,
        count: 0,
      ),
    ];
  }

  int get _totalSeats => _roles.fold(0, (sum, role) => sum + role.count);

  void _onContinue() {
    if (_totalSeats == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one seat')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BuildTeamCommitmentView()),
    );
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
              BuildTeamAppBar(
                currentStep: 3,
                totalSteps: 5,
                leadingIcon: Icons.arrow_back,
                onLeadingTap: () => Navigator.pop(context),
                onDraftTap: () {},
              ),
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
                        'Who do you need?',
                        style: TextStyles.headline2.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.sm.h),
                      Text(
                        'Choose the seats you want to fill.',
                        style: TextStyles.caption.copyWith(
                          fontFamily: AppFonts.Poppins,
                          color: AppColors.lightPrimaryColor,
                        ),
                      ),
                      SizedBox(height: AppSizes.xxl.h),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _roles.length,
                        separatorBuilder: (_, __) => SizedBox(height: 14.h),
                        itemBuilder: (context, index) {
                          final role = _roles[index];
                          return RoleCounterCard(
                            role: role,
                            onIncrement: () {
                              setState(() {
                                role.count++;
                              });
                            },
                            onDecrement: () {
                              if (role.count > 0) {
                                setState(() {
                                  role.count--;
                                });
                              }
                            },
                          );
                        },
                      ),
                      SizedBox(height: AppSizes.lg.h),

                      TotalSeatsCard(totalSeats: _totalSeats),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.lg.h,
                ),
                child: AppButton(
                  text: 'Continue',
                  width: double.infinity,
                  onPressed: _onContinue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
