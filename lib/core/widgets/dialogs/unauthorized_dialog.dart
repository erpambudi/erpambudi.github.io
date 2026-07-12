import 'package:flutter/material.dart';
import 'package:mobile_template/app.dart';
import 'package:mobile_template/core/network/api_client.dart';
import 'package:mobile_template/core/theme/app_colors.dart';
import 'package:mobile_template/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:mobile_template/injection_container.dart';
import 'package:mobile_template/core/theme/typography_extension.dart';

void showSessionExpiredDialog(AuthCubit authCubit) {
  final context = rootNavigatorKey.currentContext;
  if (context == null) return;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      icon: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.lock_outline_rounded,
          color: AppColors.error,
          size: 32,
        ),
      ),
      title: Text(
        'Sesi Berakhir',
        style: context.titleLarge.copyWith(fontWeight: FontWeight.bold),
      ),
      content: Text(
        'Sesi Anda telah berakhir. Silakan login kembali untuk melanjutkan.',
        textAlign: TextAlign.center,
        style: context.bodyMedium.copyWith(color: AppColors.textSecondary),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();

              // Reset the guard so future 401s can trigger the dialog again
              sl<ApiClient>().resetUnauthorizedGuard();

              // Emit AuthUnauthenticatedState → GoRouter redirect to /login
              authCubit.forceLogout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Login Kembali',
              style: context.labelLarge.copyWith(fontSize: 15),
            ),
          ),
        ),
      ],
    ),
  );
}
