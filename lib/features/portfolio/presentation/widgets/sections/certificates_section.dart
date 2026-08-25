import 'package:flutter/material.dart';
import 'package:mobile_template/core/extensions/context_extensions.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/core/utils/l10n_extension.dart';
import 'package:mobile_template/features/portfolio/domain/entities/certificate_entity.dart';
import '../cards/certificate_card.dart';

class CertificatesSection extends StatelessWidget {
  final List<CertificateEntity> certificates;

  const CertificatesSection({super.key, required this.certificates});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isDesktop = context.isDesktop;
    final isTablet = context.isTablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.responsiveValue(
          mobile: 20.0,
          tablet: 36.0,
          desktop: 64.0,
        ),
        vertical: 48,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          _buildSectionHeader(context, isDark),
          const SizedBox(height: 32),
          // Certificates Grid
          _buildCertificatesGrid(context, isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 3,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              context.l10n.navCertificates.toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                letterSpacing: 1.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          context.l10n.certificatesTitle,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          context.l10n.certificatesSubtitle,
          style: TextStyle(
            fontSize: 14,
            color: isDark
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildCertificatesGrid(
    BuildContext context,
    bool isDesktop,
    bool isTablet,
  ) {
    if (isDesktop) {
      final col1 = <CertificateEntity>[];
      final col2 = <CertificateEntity>[];
      final col3 = <CertificateEntity>[];

      for (int i = 0; i < certificates.length; i++) {
        if (i % 3 == 0) col1.add(certificates[i]);
        if (i % 3 == 1) col2.add(certificates[i]);
        if (i % 3 == 2) col3.add(certificates[i]);
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: col1
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CertificateCard(certificate: c),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: col2
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CertificateCard(certificate: c),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              children: col3
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CertificateCard(certificate: c),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    } else if (isTablet) {
      final col1 = <CertificateEntity>[];
      final col2 = <CertificateEntity>[];

      for (int i = 0; i < certificates.length; i++) {
        if (i % 2 == 0) col1.add(certificates[i]);
        if (i % 2 == 1) col2.add(certificates[i]);
      }

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: col1
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CertificateCard(certificate: c),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              children: col2
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CertificateCard(certificate: c),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: certificates
            .map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CertificateCard(certificate: c),
              ),
            )
            .toList(),
      );
    }
  }
}
