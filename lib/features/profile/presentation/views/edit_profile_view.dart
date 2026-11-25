import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_fonts.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/core/validators/validation.dart';
import 'package:t2mna/features/create_team/presentation/widgets/custom_labeled_text_field.dart';
import 'package:t2mna/features/create_team/presentation/widgets/tip_info_card.dart';
import 'package:t2mna/features/leader_applicants/presentation/widgets/leader_app_bar.dart';
import '../../data/models/user_profile_model.dart';
import '../widgets/edit_profile_photo_row.dart';

class EditProfileView extends StatefulWidget {
  final UserProfileModel profile;

  const EditProfileView({
    super.key,
    required this.profile,
  });

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _roleController;
  late final TextEditingController _bioController;
  late final TextEditingController _githubController;

  static const int _maxBioLength = 160;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.fullName);
    _roleController = TextEditingController(
      text: widget.profile.roleAndCity.split('·').first.trim(),
    );
    _bioController = TextEditingController(text: widget.profile.bio)
      ..addListener(() => setState(() {}));
    _githubController = TextEditingController(text: 'github.com/nouradel');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _roleController.dispose();
    _bioController.dispose();
    _githubController.dispose();
    super.dispose();
  }

  void _onSaveChanges() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final city = widget.profile.roleAndCity.contains('·')
        ? widget.profile.roleAndCity.split('·').last.trim()
        : 'Cairo';

    final updatedName = _nameController.text.trim();
    final parts = updatedName.split(' ');
    final updatedInitials = parts.length >= 2
        ? '${parts[0][0]}${parts[1][0]}'.toUpperCase()
        : updatedName.substring(0, updatedName.length >= 2 ? 2 : 1).toUpperCase();

    final updatedProfile = UserProfileModel(
      initials: updatedInitials,
      fullName: updatedName,
      roleAndCity: '${_roleController.text.trim()} · $city',
      batchTag: widget.profile.batchTag,
      trackTag: widget.profile.trackTag,
      bio: _bioController.text.trim(),
      isVerified: widget.profile.isVerified,
      verificationTitle: widget.profile.verificationTitle,
      verificationDate: widget.profile.verificationDate,
      projectsCount: widget.profile.projectsCount,
      applicationsCount: widget.profile.applicationsCount,
      avgMatchPercentage: widget.profile.avgMatchPercentage,
      skills: widget.profile.skills,
      primarySkill: widget.profile.primarySkill,
      recentActivities: widget.profile.recentActivities,
    );

    Navigator.pop(context, updatedProfile);
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
              const LeaderAppBar(title: 'Edit profile'),
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
                        // صف تغيير الصورة الشخصية
                        EditProfilePhotoRow(
                          initials: widget.profile.initials,
                          onChangeTap: () {
                            // فتح اختيار الصورة (ImagePicker)
                          },
                        ),
                        SizedBox(height: AppSizes.xl.h),

                        // الاسم الكامل
                        CustomLabeledTextField(
                          label: 'Full name',
                          hintText: 'Nour Adel',
                          controller: _nameController,
                          prefixIcon: Icons.person_outline_rounded,
                          validator: (val) => AppValidators.required(
                            val,
                            message: 'Full name is required',
                          ),
                        ),
                        SizedBox(height: AppSizes.lg.h),

                        // التخصص
                        CustomLabeledTextField(
                          label: 'Role',
                          hintText: 'Flutter Developer',
                          controller: _roleController,
                          prefixIcon: Icons.edit_outlined,
                          validator: (val) => AppValidators.required(
                            val,
                            message: 'Role is required',
                          ),
                        ),
                        SizedBox(height: AppSizes.lg.h),

                        CustomLabeledTextField(
                          label: 'Short bio',
                          hintText: 'Tell teams about what you build...',
                          controller: _bioController,
                          maxLines: 3,
                          maxLength: _maxBioLength,
                        ),
                        SizedBox(height: 4.h),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '${_bioController.text.length} / $_maxBioLength',
                            style: TextStyles.caption2.copyWith(
                              fontFamily: AppFonts.Poppins,
                              fontSize: 11.sp,
                              color: AppColors.blurcl,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.md.h),

                        // رابط GitHub
                        CustomLabeledTextField(
                          label: 'GitHub',
                          hintText: 'github.com/username',
                          controller: _githubController,
                          prefixIcon: Icons.alt_route_rounded,
                        ),
                        SizedBox(height: AppSizes.lg.h),

                        TipInfoCard(
                          title: 'Initiative and track are locked',
                          description:
                              '${widget.profile.batchTag} · Flutter is verified. Changing it starts a new verification.',
                          icon: Icons.lock_outline_rounded,
                          iconColor: AppColors.primaryColor,
                          backgroundColor:
                              AppColors.purple500.withValues(alpha: 0.14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // الأزرار السفلية
              Padding(
                padding: EdgeInsets.only(
                  top: AppSizes.sm.h,
                  bottom: AppSizes.md.h,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppButton(
                      text: 'Save changes',
                      width: double.infinity,
                      onPressed: _onSaveChanges,
                    ),
                    SizedBox(height: AppSizes.sm.h),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Discard',
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