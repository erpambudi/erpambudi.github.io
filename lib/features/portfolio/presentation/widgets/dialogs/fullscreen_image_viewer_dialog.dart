import 'package:flutter/material.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';

class FullScreenImageViewerDialog extends StatefulWidget {
  final String imagePath;
  final String title;
  final String? subtitle;

  const FullScreenImageViewerDialog({
    super.key,
    required this.imagePath,
    required this.title,
    this.subtitle,
  });

  static void show(
    BuildContext context, {
    required String imagePath,
    required String title,
    String? subtitle,
  }) {
    showDialog(
      context: context,
      useSafeArea: false,
      barrierColor: Colors.black87,
      builder: (context) => FullScreenImageViewerDialog(
        imagePath: imagePath,
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  @override
  State<FullScreenImageViewerDialog> createState() =>
      _FullScreenImageViewerDialogState();
}

class _FullScreenImageViewerDialogState
    extends State<FullScreenImageViewerDialog> {
  final TransformationController _transformationController =
      TransformationController();

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _resetZoom() {
    _transformationController.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withValues(alpha: 0.94),
      body: SafeArea(
        child: Stack(
          children: [
            // Center Zoomable/Pannable Image View
            Center(
              child: InteractiveViewer(
                transformationController: _transformationController,
                minScale: 0.5,
                maxScale: 4.0,
                boundaryMargin: const EdgeInsets.all(40),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(
                      Icons.broken_image_rounded,
                      size: 80,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ),
            // Top Bar with Controls and Title
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (widget.subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            widget.subtitle!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Reset Zoom Button
                  IconButton.filledTonal(
                    onPressed: _resetZoom,
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black54,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.refresh_rounded, size: 20),
                    tooltip: context.l10n.resetZoom,
                  ),
                  const SizedBox(width: 10),
                  // Close Fullscreen Button
                  IconButton.filled(
                    onPressed: () => Navigator.of(context).pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                    ),
                    icon: const Icon(Icons.close_rounded, size: 22),
                    tooltip: context.l10n.close,
                  ),
                ],
              ),
            ),
            // Bottom Hint Bar
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.pinch_rounded,
                        size: 16,
                        color: Colors.white70,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        context.l10n.zoomHint,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
