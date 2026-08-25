import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/certificate_entity.dart';
import 'fullscreen_image_viewer_dialog.dart';

class CertificateDetailDialog extends StatelessWidget {
  final CertificateEntity certificate;

  const CertificateDetailDialog({super.key, required this.certificate});

  Future<void> _verify() async {
    final uri = Uri.parse(certificate.verificationUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _openFullScreen(BuildContext context) {
    FullScreenImageViewerDialog.show(
      context,
      imagePath: certificate.imagePath,
      title: certificate.title,
      subtitle: '${certificate.issuer} (${certificate.year})',
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final certHeight = context.responsiveValue(
      mobile: 240.0,
      tablet: 340.0,
      desktop: 400.0,
    );

    return Dialog(
      backgroundColor: isDark ? AppColors.cardDark : AppColors.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 720,
          maxHeight: size.height * 0.9,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Certificate Image Banner with Fullscreen trigger
              Stack(
                children: [
                  InkWell(
                    onTap: () => _openFullScreen(context),
                    child: Container(
                      height: certHeight,
                      width: double.infinity,
                      color: isDark
                          ? const Color(0xFF0F172A)
                          : const Color(0xFFE2E8F0),
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(
                        certificate.imagePath,
                        fit: BoxFit.contain,
                        errorBuilder: (_, error, stackTrace) => const Center(
                          child: Icon(
                            Icons.workspace_premium_rounded,
                            size: 60,
                            color: AppColors.primary,
                          ),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.75),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white24),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.fullscreen_rounded,
                              size: 16,
                              color: Colors.white,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Zoom / Fullscreen',
                              style: TextStyle(
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
                  // Close Button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      certificate.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '${context.l10n.issuedBy}: ${certificate.issuer} (${certificate.year})',
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${context.l10n.credentialId}: ${certificate.credentialId}',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark
                            ? AppColors.textMutedDark
                            : AppColors.textMutedLight,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Action buttons with Wrap
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _verify,
                          icon: const Icon(Icons.verified_rounded, size: 16),
                          label: Text(context.l10n.verifyCredential),
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
