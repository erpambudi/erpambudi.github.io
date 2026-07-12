import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/typography_extension.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  final bool isPayment;
  final double fontSize;

  const StatusBadge({
    super.key,
    required this.status,
    this.isPayment = false,
    this.fontSize = 11,
  });

  @override
  Widget build(BuildContext context) {
    final color = isPayment
        ? AppColors.getPaymentStatusColor(status)
        : AppColors.getStatusColor(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 0.5),
      ),
      child: Text(
        status,
        style: context.labelMedium.copyWith(fontSize: fontSize, color: color),
      ),
    );
  }
}
