import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/profile_entity.dart';

class ContactFormCard extends StatefulWidget {
  final ProfileEntity profile;

  const ContactFormCard({super.key, required this.profile});

  @override
  State<ContactFormCard> createState() => _ContactFormCardState();
}

class _ContactFormCardState extends State<ContactFormCard> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final subject = _subjectController.text.trim();
      final message = _messageController.text.trim();

      final emailSubject = Uri.encodeComponent(
        'Portfolio Inquiry: $subject (from $name)',
      );
      final emailBody = Uri.encodeComponent(
        'Hi Rizki,\n\n$message\n\nBest regards,\n$name',
      );

      final mailtoUri = Uri.parse(
        'mailto:${widget.profile.email}?subject=$emailSubject&body=$emailBody',
      );

      if (await canLaunchUrl(mailtoUri)) {
        await launchUrl(mailtoUri);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.messageSentSuccess),
              backgroundColor: AppColors.primary,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final paddingVal = context.responsiveValue(
      mobile: 16.0,
      tablet: 22.0,
      desktop: 24.0,
    );

    return Container(
      padding: EdgeInsets.all(paddingVal),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? AppColors.borderDark : AppColors.borderLight,
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: context.l10n.name,
                prefixIcon: const Icon(Icons.person_rounded, size: 18),
              ),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter your name'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: context.l10n.subject,
                prefixIcon: const Icon(Icons.subject_rounded, size: 18),
              ),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please enter a subject'
                  : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: context.l10n.message,
                alignLabelWithHint: true,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Icon(Icons.chat_bubble_rounded, size: 18),
                ),
              ),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Please write your message'
                  : null,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submitForm,
                icon: const Icon(Icons.send_rounded, size: 16),
                label: Text(context.l10n.sendMessage),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
