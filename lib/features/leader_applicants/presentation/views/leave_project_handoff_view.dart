import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teamna/core/constants/app_assets.dart';
import 'package:teamna/core/constants/app_fonts.dart';
import 'package:teamna/core/constants/app_sizes.dart';
import 'package:teamna/core/shared/widgets/custom_button.dart';
import 'package:teamna/core/theme/app_colors.dart';
import 'package:teamna/core/theme/app_text_style.dart';
import 'package:teamna/core/validators/validation.dart';
import 'package:teamna/features/create_team/presentation/widgets/custom_labeled_text_field.dart';
import 'package:teamna/features/create_team/presentation/widgets/tip_info_card.dart';
import 'package:teamna/features/leader_applicants/presentation/views/handoff_submitted_view.dart';
import '../widgets/handoff_confirmation_checkbox.dart';
import '../widgets/leader_app_bar.dart';

class LeaveProjectHandoffView extends StatefulWidget {
  const LeaveProjectHandoffView({super.key});

  @override
  State<LeaveProjectHandoffView> createState() =>
      _LeaveProjectHandoffViewState();
}

class _LeaveProjectHandoffViewState extends State<LeaveProjectHandoffView> {
  final _formKey = GlobalKey<FormState>();
  final _branchUrlController = TextEditingController();
  final _completedTasksController = TextEditingController();
  final _blockerNotesController = TextEditingController();

  bool _isWorkPushed = true;

  @override
  void dispose() {
    _branchUrlController.dispose();
    _completedTasksController.dispose();
    _blockerNotesController.dispose();
    super.dispose();
  }

  void _onSubmitHandoff() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    if (!_isWorkPushed) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please confirm that you pushed all your work to the branch.',
            style: TextStyles.caption2.copyWith(
              fontFamily: AppFonts.Poppins,
              color: AppColors.whiteColor,
            ),
          ),
          backgroundColor: AppColors.redColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HandoffSubmittedView(
          lottieAssetPath: AppAssets.successJson, 
        ),
      ),
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
              const LeaderAppBar(title: 'Leave project'),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSizes.lg.h,
                    bottom: AppSizes.lg.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TipInfoCard(
                          title: 'Handoff is required',
                          description:
                              'Complete this form so your team can replace you without losing momentum.',
                          icon: Icons.warning_amber_rounded,
                          iconColor: AppColors.redColor,
                          backgroundColor: AppColors.lighRedColor,
                        ),
                        SizedBox(height: AppSizes.xl.h),

                        CustomLabeledTextField(
                          label: 'Deliverable branch URL',
                          hintText:
                              'github.com/campus-carpool/app/tree/feature/map-routes',
                          controller: _branchUrlController,
                          prefixIcon: Icons.alt_route_rounded,
                          maxLines: 2,
                          validator: (val) => AppValidators.required(
                            val,
                            message: 'Deliverable branch URL is required',
                          ),
                        ),
                        SizedBox(height: AppSizes.lg.h),

                        CustomLabeledTextField(
                          label: 'Completed tasks',
                          hintText:
                              'Rider onboarding, booking screen and the first version of the live map layout.',
                          controller: _completedTasksController,
                          maxLines: 4,
                          validator: (val) => AppValidators.required(
                            val,
                            message: 'Please list your completed tasks',
                          ),
                        ),
                        SizedBox(height: AppSizes.lg.h),

                        CustomLabeledTextField(
                          label: 'Blocker notes',
                          hintText:
                              'The map needs the Maps API key. Auth tokens are still pending from the back-end.',
                          controller: _blockerNotesController,
                          maxLines: 4,
                          validator: (val) => AppValidators.required(
                            val,
                            message:
                                'Please add any blocker notes or write None',
                          ),
                        ),
                        SizedBox(height: AppSizes.lg.h),

                        HandoffConfirmationCheckbox(
                          value: _isWorkPushed,
                          label: 'I pushed all my work to the branch above',
                          onChanged: (val) {
                            setState(() => _isWorkPushed = val);
                          },
                        ),
                      ],
                    ),
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
                      text: 'Submit handoff & leave',
                      width: double.infinity,
                      backgroundColor: AppColors.redColor,
                      foregroundColor: AppColors.whiteColor,
                      onPressed: _onSubmitHandoff,
                    ),
                    SizedBox(height: AppSizes.sm.h),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Stay on the team',
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
