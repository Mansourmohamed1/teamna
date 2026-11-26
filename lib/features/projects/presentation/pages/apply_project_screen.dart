import 'package:flutter/material.dart';

import 'package:t2mna/core/constants/app_design.dart';
import 'package:t2mna/core/shared/widgets/custom_button.dart';
import 'package:t2mna/core/shared/widgets/main_app_bar.dart';
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
    text: 'I have shipped two Flutter apps with BLoC and Firebase during DEPI. I can own the rider screens and map flow.',
  );

  final linkController = TextEditingController(text: 'github.com/nour-dev');

  final List<String> links = [];
  String hours = '10h';

  final Set<String> days = {'Sat', 'Sun', 'Tue'};

  final List<String> weekDays = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  @override
  void dispose() {
    pitchController.dispose();
    linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: MainAppBar(title: 'Apply to join', showAction: false,),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDesign.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProjectCard(),

            const SizedBox(height: 26),

            _sectionTitle(
              'Your pitch',
              'Introduce yourself and explain how you can contribute.',
              Icons.edit_note_rounded,
            ),

            const SizedBox(height: 12),

            TextField(
              controller: pitchController,
              maxLines: 5,
              maxLength: 500,
              style: TextStyles.caption.copyWith(
                color: AppColors.blackColor,
                height: 1.6,
              ),
              decoration: _decoration('Tell the team why you are a good fit')
                  .copyWith(
                    alignLabelWithHint: true,
                    counterStyle: TextStyles.caption2.copyWith(
                      color: AppColors.greyColor,
                    ),
                  ),
            ),

            const SizedBox(height: 22),

            _sectionTitle(
              'Portfolio links',
              'Share your GitHub, LinkedIn or previous projects.',
              Icons.link_rounded,
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: linkController,
                    keyboardType: TextInputType.url,
                    style: TextStyles.caption.copyWith(
                      color: AppColors.blackColor,
                    ),
                    decoration: _decoration('Paste your link').copyWith(
                      prefixIcon: const Icon(
                        Icons.link_rounded,
                        color: AppColors.blurcl,
                        size: 20,
                      ),
                    ),
                    onSubmitted: (_) => _addLink(),
                  ),
                ),

                const SizedBox(width: 9),

                Material(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(13),
                  child: InkWell(
                    onTap: _addLink,
                    borderRadius: BorderRadius.circular(13),
                    child: const SizedBox(
                      width: 52,
                      height: 52,
                      child: Icon(
                        Icons.add_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            if (links.isNotEmpty) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: links.map((link) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 11,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECE4FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.link_rounded,
                          size: 15,
                          color: AppColors.primaryColor,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          link,
                          style: TextStyles.caption2.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            setState(() => links.remove(link));
                          },
                          child: const Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],

            const SizedBox(height: 26),

            _sectionTitle(
              'Weekly availability',
              'Let the project leader know when you are available.',
              Icons.calendar_month_rounded,
            ),

            const SizedBox(height: 16),

            _buildHoursSelector(),

            const SizedBox(height: 20),

            Text(
              'Available days',
              style: TextStyles.caption.copyWith(
                color: AppColors.blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 10,
              children: weekDays.map((day) {
                final selected = days.contains(day);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selected ? days.remove(day) : days.add(day);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    width: 47,
                    height: 47,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: selected ? AppColors.primaryColor : Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                        color: selected
                            ? AppColors.primaryColor
                            : AppColors.primaryColor.withValues(alpha: .12),
                      ),
                    ),
                    child: Text(
                      day,
                      style: TextStyles.caption2.copyWith(
                        color: selected ? Colors.white : AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 26),

            _buildNotificationCard(),

            const SizedBox(height: 15),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.fromLTRB(
            AppDesign.padding,
            12,
            AppDesign.padding,
            12,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            border: Border(
              top: BorderSide(
                color: AppColors.primaryColor.withValues(alpha: .08),
              ),
            ),
          ),
          child: AppButton(
            backgroundColor: AppColors.orangeColor,
            foregroundColor: AppColors.whiteColor,
            textStyle: TextStyles.body.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            text: 'Send application',
            onPressed: _submitApplication,
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFECE4FA), Color(0xFFF5F0FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: .08),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 49,
            height: 49,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.code_rounded,
              color: AppColors.primaryColor,
              size: 25,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.role.title,
                  style: TextStyles.caption.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.project.title,
                  style: TextStyles.body.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: AppColors.greyColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      widget.role.commitment,
                      style: TextStyles.caption2.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            color: AppColors.primaryColor,
            size: 21,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, String subtitle, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            color: const Color(0xFFECE4FA),
            borderRadius: BorderRadius.circular(11),
          ),
          child: Icon(icon, size: 20, color: AppColors.primaryColor),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.body.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyles.caption2.copyWith(
                  color: AppColors.greyColor,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHoursSelector() {
    final options = ['5h', '10h', '15h'];

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: .08),
        ),
      ),
      child: Row(
        children: options.map((item) {
          final selected = hours == item;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => hours = item),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: selected ? AppColors.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '$item / week',
                    style: TextStyles.caption2.copyWith(
                      color: selected ? Colors.white : AppColors.greyColor,
                      fontWeight: FontWeight.w700,
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

  Widget _buildNotificationCard() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFECE4FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: .08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 39,
            height: 39,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_active_outlined,
              color: AppColors.primaryColor,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.project.leader.split(' ').first} is notified instantly',
                  style: TextStyles.caption.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'They will review your pitch and reply inside the app.',
                  style: TextStyles.caption2.copyWith(
                    color: AppColors.greyColor,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _decoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyles.caption2.copyWith(color: AppColors.blurcl),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.all(15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: AppColors.primaryColor.withValues(alpha: .10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.3),
      ),
    );
  }

  void _addLink() {
    final value = linkController.text.trim();

    if (value.isEmpty) return;

    if (links.contains(value)) return;

    setState(() {
      links.add(value);
      linkController.clear();
    });
  }

  void _submitApplication() {
    if (pitchController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please write a short pitch first')),
      );
      return;
    }

    if (days.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one available day'),
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
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
  }
}
