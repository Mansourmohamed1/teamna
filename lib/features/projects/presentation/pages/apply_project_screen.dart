import 'package:flutter/material.dart';
import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/theme/app_colors.dart';
import 'package:t2mna/core/theme/app_text_style.dart';
import '../../data/project_model.dart';

class ApplyProjectScreen extends StatefulWidget {
  final ProjectModel project;
  final ProjectRole role;
  const ApplyProjectScreen({
    super.key,
    required this.project,
    required this.role,
  });
  @override
  State<ApplyProjectScreen> createState() => _ApplyProjectScreenState();
}

class _ApplyProjectScreenState extends State<ApplyProjectScreen> {
  final pitchController = TextEditingController(
    text:
        'I have shipped two Flutter apps with BLoC and Firebase during DEPI. I can own the rider screens and map flow.',
  );
  final linkController = TextEditingController(text: 'github.com/nour-dev');
  final links = <String>[];
  String hours = '10h';
  final days = <String>{'Sat', 'Sun', 'Tue'};
  @override
  void dispose() {
    pitchController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(AppDesign.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.primaryColor,
                  ),
                ),
                const Spacer(),
                Text(
                  'Apply to join',
                  style: TextStyles.body.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                const Spacer(),
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: const Color(0xFFECE4FA),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.code, color: AppColors.primaryColor),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.role.title,
                          style: TextStyles.caption.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '${widget.project.title} · ${widget.role.commitment}',
                          style: TextStyles.caption2.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 17),
            _label('Your pitch'),
            TextField(
              controller: pitchController,
              maxLines: 4,
              decoration: _decoration('Tell the team why you are a good fit'),
            ),
            const SizedBox(height: 14),
            _label('Portfolio links'),
            TextField(
              controller: linkController,
              decoration: _decoration('Add a link').copyWith(
                prefixIcon: const Icon(
                  Icons.link,
                  color: AppColors.blurcl,
                  size: 19,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                onPressed: () {
                  if (linkController.text.trim().isNotEmpty) {
                    setState(() {
                      links.add(linkController.text.trim());
                      linkController.clear();
                    });
                  }
                },
                icon: const Icon(
                  Icons.add,
                  size: 17,
                  color: AppColors.orangeColor,
                ),
                label: const Text(
                  'Add another link',
                  style: TextStyle(color: AppColors.orangeColor, fontSize: 12),
                ),
              ),
            ),
            ...links.map(
              (link) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Text(
                  '🔗  $link',
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            _label('Weekly availability'),
            const SizedBox(height: 8),
            _choiceRow(
              ['5h', '10h', '15h'],
              hours,
              (v) => setState(() => hours = v),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 7,
              children: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu']
                  .map(
                    (d) => ChoiceChip(
                      label: Text(d),
                      selected: days.contains(d),
                      onSelected: (v) =>
                          setState(() => v ? days.add(d) : days.remove(d)),
                      selectedColor: AppColors.primaryColor,
                      backgroundColor: Colors.white,
                      labelStyle: TextStyles.caption2.copyWith(
                        color: days.contains(d)
                            ? Colors.white
                            : AppColors.primaryColor,
                      ),
                      side: BorderSide(
                        color: AppColors.primaryColor.withValues(alpha: .15),
                      ),
                      showCheckmark: false,
                      shape: const StadiumBorder(),
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFECE4FA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.notifications_none,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(width: 9),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.project.leader.split(' ').first} is notified instantly',
                          style: TextStyles.caption2.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          'They will review your pitch and reply inside the app.',
                          style: TextStyles.caption2.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (pitchController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please write a short pitch first'),
                      ),
                    );
                    return;
                  }
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Application sent'),
                      content: const Text(
                        'Your application has been submitted successfully.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: const Text('Done'),
                        ),
                      ],
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeColor,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text('Send application'),
              ),
            ),
          ],
        ),
      ),
    ),
  );
  Widget _label(String s) => Padding(
    padding: const EdgeInsets.only(bottom: 8),
    child: Text(
      s,
      style: TextStyles.body.copyWith(
        color: AppColors.primaryColor,
        fontSize: 14,
      ),
    ),
  );
  InputDecoration _decoration(String hint) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyles.caption2.copyWith(color: AppColors.blurcl),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.all(14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide(
        color: AppColors.primaryColor.withValues(alpha: .08),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: const BorderSide(color: AppColors.primaryColor),
    ),
  );
  Widget _choiceRow(
    List<String> items,
    String selected,
    ValueChanged<String> onSelect,
  ) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Row(
        children: items.map((item) {
          final isSelected = selected == item;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelect(item),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyles.caption2.copyWith(
                      color: isSelected ? Colors.white : AppColors.greyColor,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
