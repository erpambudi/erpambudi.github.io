import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/project_entity.dart';
import 'fullscreen_image_viewer_dialog.dart';

class ProjectDetailHeaderImage extends StatelessWidget {
  final ProjectEntity project;

  const ProjectDetailHeaderImage({super.key, required this.project});

  void _openFullScreen(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    FullScreenImageViewerDialog.show(
      context,
      imagePath: project.imagePath,
      title: project.title,
      subtitle: project.getCategoryLabel(locale),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bannerHeight = context.responsiveValue(
      mobile: 220.0,
      tablet: 300.0,
      desktop: 340.0,
    );

    return Stack(
      children: [
        InkWell(
          onTap: () => _openFullScreen(context),
          child: Container(
            height: bannerHeight,
            width: double.infinity,
            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFE2E8F0),
            child: Image.asset(
              project.imagePath,
              fit: BoxFit.cover,
              errorBuilder: (_, error, stackTrace) => const Center(
                child: Icon(Icons.image_not_supported_rounded, size: 48),
              ),
            ),
          ),
        ),
        // Fullscreen Expand Badge
        Positioned(
          bottom: 12,
          right: 12,
          child: InkWell(
            onTap: () => _openFullScreen(context),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white24),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.fullscreen_rounded,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    context.l10n.fullscreen,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Close Dialog Button
        Positioned(
          top: 12,
          right: 12,
          child: CircleAvatar(
            backgroundColor: Colors.black54,
            child: IconButton(
              icon: const Icon(Icons.close_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    );
  }
}
