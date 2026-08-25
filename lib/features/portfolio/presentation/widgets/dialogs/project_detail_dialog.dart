import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';
import '../badges/skill_chip.dart';
import 'fullscreen_image_viewer_dialog.dart';
import 'project_detail_header_image.dart';

class ProjectDetailDialog extends StatelessWidget {
  final ProjectEntity project;

  const ProjectDetailDialog({super.key, required this.project});

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _openFullScreen(BuildContext context) {
    FullScreenImageViewerDialog.show(
      context,
      imagePath: project.imagePath,
      title: project.title,
      subtitle: project.categoryLabel,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: isDark ? AppColors.cardDark : AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 780,
          maxHeight: size.height * 0.9,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProjectDetailHeaderImage(project: project),
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTags(isDark),
                    const SizedBox(height: 12),
                    Text(
                      project.title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      project.description,
                      style: TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Key Architecture & Features:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...project.keyFeatures.map(
                      (f) => _buildFeatureItem(f, isDark),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      context.l10n.techStack,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: project.technologies.map((t) {
                        return SkillChip(label: t);
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    _buildActionButtons(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTags(bool isDark) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            project.categoryLabel,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
        ...project.platforms.map(
          (p) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isDark ? AppColors.cardDarkHover : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              p,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String feature, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 3, right: 8),
            child: Icon(
              Icons.check_circle_rounded,
              size: 15,
              color: AppColors.primary,
            ),
          ),
          Expanded(
            child: Text(
              feature,
              style: TextStyle(
                fontSize: 13,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (project.playStoreUrl != null)
          ElevatedButton.icon(
            onPressed: () => _openLink(project.playStoreUrl!),
            icon: const Icon(Icons.shop_rounded, size: 16),
            label: const Text('Google Play'),
          ),
        if (project.demoUrl != null)
          ElevatedButton.icon(
            onPressed: () => _openLink(project.demoUrl!),
            icon: const Icon(Icons.download_rounded, size: 16),
            label: const Text('Download Demo'),
          ),
        if (project.githubUrl != null)
          ElevatedButton.icon(
            onPressed: () => _openLink(project.githubUrl!),
            icon: const Icon(Icons.code_rounded, size: 16),
            label: const Text('Source Code'),
          ),
        OutlinedButton.icon(
          onPressed: () => _openFullScreen(context),
          icon: const Icon(Icons.fullscreen_rounded, size: 16),
          label: const Text('View Full Image'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
