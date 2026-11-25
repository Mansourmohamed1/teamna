import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:t2mna/core/constants/app_sizes.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/features/profile_wizard/presentation/data/model/profile_wizard_data.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/banner.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/upload_box.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/uploaded_file_tile.dart';
import 'package:t2mna/features/profile_wizard/presentation/ui/widgets/wizard_layout.dart';


class VerifyStep extends StatelessWidget {
  final ProfileWizardData data;
  final VoidCallback onChanged;

  const VerifyStep({super.key, required this.data, required this.onChanged});

  Future<void> _pickFile() async {
  final result = await FilePicker.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
  );

  if (result.isNotEmpty) {
    data.fileName = result.single.name;

    onChanged();
  }
}

  @override
  Widget build(BuildContext context) {
    return WizardStepLayout(
      title: 'Verify your track',
      subtitle: 'Get the verified badge so teams know your training is real.',
      children: [
        UploadBox(onTap: _pickFile),
        if (data.fileName != null) ...[
          SizedBox(height: AppSizes.lg.h),
          UploadedFileTile(
            fileName: data.fileName!,
            info: '1.2 MB · Uploaded',
            onRemove: () {
              data.fileName = null;
              onChanged();
            },
          ),
        ],
        SizedBox(height: AppSizes.lg.h),
        const InfoBanner(
          icon: Icons.lock_outline,
          title: 'Private by design',
          message: 'Only platform admins can open your documents. They are stored in a private bucket.',
          backgroundColor: AppColors.lightGreenColor,
          accentColor: AppColors.greenColor,
        ),
      ],
    );
  }
}