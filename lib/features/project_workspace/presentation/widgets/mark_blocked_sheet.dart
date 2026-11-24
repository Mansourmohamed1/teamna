import 'package:flutter/material.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import 'package:t2mna/features/project_workspace/data/models/project_workspace.dart';

class MarkBlockedSheet extends StatefulWidget {
  final CarpoolTask task;
  final void Function(String reason, String note) onSave;

  const MarkBlockedSheet({
    super.key,
    required this.task,
    required this.onSave,
  });

  @override
  State<MarkBlockedSheet> createState() => _MarkBlockedSheetState();
}

class _MarkBlockedSheetState extends State<MarkBlockedSheet> {
  String selectedReason = 'Auth API';
  final noteController = TextEditingController(
    text: 'Login tokens are not issued yet, so the map cannot load rider data.',
  );

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Padding(
      padding: EdgeInsets.fromLTRB(
        18, 12, 18, 14 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Container(
              width: 38, height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFD8C9FF),
                borderRadius: BorderRadius.circular(8),
              ),
            )),
            const SizedBox(height: 17),
            Row(children: [
              Expanded(child: Text('Mark as blocked', style: TextStyles.title2.copyWith(
                color: AppColors.primaryColor, fontSize: 19,
              ))),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: AppColors.blurcl),
              ),
            ]),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(13)),
              child: Row(children: [
                const Icon(Icons.code, color: AppColors.primaryColor, size: 18),
                const SizedBox(width: 9),
                Expanded(child: Text(widget.task.title, style: TextStyles.caption2.copyWith(
                  color: AppColors.primaryColor, fontWeight: FontWeight.w700,
                ))),
              ]),
            ),
            const SizedBox(height: 16),
            Text('What are you waiting on?', style: TextStyles.body.copyWith(
              color: AppColors.primaryColor, fontSize: 14,
            )),
            const SizedBox(height: 9),
            Wrap(
              spacing: 7, runSpacing: 8,
              children: ['Auth API', 'Design assets', 'Code review', 'Other'].map((reason) {
                final active = selectedReason == reason;
                return ChoiceChip(
                  label: Text(reason),
                  selected: active,
                  onSelected: (_) => setState(() => selectedReason = reason),
                  selectedColor: AppColors.redColor,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyles.caption2.copyWith(
                    color: active ? Colors.white : AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  side: BorderSide(color: active ? Colors.transparent :
                    AppColors.primaryColor.withValues(alpha: .15)),
                  showCheckmark: false,
                  shape: const StadiumBorder(),
                );
              }).toList(),
            ),
            const SizedBox(height: 15),
            Text('Explain the delay', style: TextStyles.caption2.copyWith(
              color: AppColors.greyColor,
            )),
            const SizedBox(height: 7),
            TextField(
              controller: noteController,
              maxLines: 3,
              style: TextStyles.caption.copyWith(color: AppColors.primaryColor),
              decoration: InputDecoration(
                hintText: 'Add a short explanation...',
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: AppColors.purple500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: AppColors.purple500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFECE4FA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.groups_outlined, color: AppColors.primaryColor, size: 19),
                  const SizedBox(width: 9),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Visible to the whole team', style: TextStyles.caption2.copyWith(
                        color: AppColors.primaryColor, fontWeight: FontWeight.w700,
                      )),
                      const SizedBox(height: 3),
                      Text(
                        'Everyone sees this reason on the board so delays are never a surprise.',
                        style: TextStyles.caption2.copyWith(
                          color: AppColors.greyColor, fontSize: 10,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity, height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (noteController.text.trim().isEmpty) return;
                  widget.onSave(selectedReason, noteController.text.trim());
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.redColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Mark as blocked'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
