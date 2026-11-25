import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/core/validators/validation.dart';
import '../widgets/build_team_app_bar.dart';
import '../widgets/custom_labeled_text_field.dart';
import '../widgets/selectable_chip_group.dart';
import 'build_team_stack_view.dart'; // للانتقال للشاشة الثانية

class BuildTeamProblemView extends StatefulWidget {
  const BuildTeamProblemView({super.key});

  @override
  State<BuildTeamProblemView> createState() => _BuildTeamProblemViewState();
}

class _BuildTeamProblemViewState extends State<BuildTeamProblemView> {
  final _formKey = GlobalKey<FormState>();
  final _projectNameController = TextEditingController();
  final _problemStatementController = TextEditingController();

  final List<String> _domains = const [
    'EdTech',
    'Health',
    'Transport',
    'E-commerce',
    'Social',
    'FinTech',
  ];

  String _selectedDomain = 'Transport';

  @override
  void dispose() {
    _projectNameController.dispose();
    _problemStatementController.dispose();
    super.dispose();
  }

  void _onContinue() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BuildTeamStackView()),
      );
    }
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
                currentStep: 1,
                totalSteps: 5,
                leadingIcon: Icons.close,
                onLeadingTap: () => Navigator.pop(context),
                onDraftTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    top: AppSizes.xxl.h,
                    bottom: AppSizes.lg.h,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'What problem are you solving?',
                          style: TextStyles.headline2.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.blackColor,
                            height: 1.25,
                          ),
                        ),
                        SizedBox(height: AppSizes.sm.h),
                        Text(
                          'A clear problem helps the right people say yes.',
                          style: TextStyles.caption.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.lightPrimaryColor,
                          ),
                        ),
                        SizedBox(height: AppSizes.xxl.h),
                        CustomLabeledTextField(
                          label: 'Project name',
                          hintText: 'Campus Carpool',
                          controller: _projectNameController,
                          prefixIcon: Icons.edit_outlined,
                          validator: (val) => AppValidators.required(
                            val,
                            message: 'Project name is required',
                          ),
                        ),
                        SizedBox(height: AppSizes.xl.h),
                        CustomLabeledTextField(
                          label: 'Problem statement',
                          hintText:
                              'Students lose hours every week to unreliable transport. We want to match riders with verified student drivers on live routes.',
                          controller: _problemStatementController,
                          maxLines: 5,
                          validator: (val) => AppValidators.required(
                            val,
                            message: 'Problem statement is required',
                          ),
                        ),
                        SizedBox(height: AppSizes.xxl.h),
                        SelectableChipGroup(
                          title: 'Domain',
                          titleStyle: TextStyles.body.copyWith(
                            fontFamily: AppFonts.Poppins,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          items: _domains,
                          selectedItems: {_selectedDomain},
                          onItemToggle: (domain) {
                            setState(() {
                              _selectedDomain = domain;
                            });
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
