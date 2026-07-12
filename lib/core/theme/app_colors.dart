import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF00BCD4);
  static const Color primaryDark = Color(0xFF0097A7);
  static const Color primaryLight = Color(0xFFB2EBF2);

  // Accent
  static const Color accent = Color(0xFF4CAF50);

  // Background
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Colors.white;

  // Text
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textLight = Color(0xFF9CA3AF);

  // Error
  static const Color error = Color(0xFFE53935);

  // Order Status Colors
  static const Color statusDiterima = Color(0xFF2196F3);
  static const Color statusDicuci = Color(0xFFFF9800);
  static const Color statusDikeringkan = Color(0xFFFFB74D);
  static const Color statusDisetrika = Color(0xFF9C27B0);
  static const Color statusSelesai = Color(0xFF4CAF50);
  static const Color statusDiambil = Color(0xFF607D8B);

  // Payment Status Colors
  static const Color statusBelumBayar = Color(0xFFFF5722);
  static const Color statusLunas = Color(0xFF4CAF50);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryDark],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF66BB6A), accent],
  );

  static Color getStatusColor(String status) {
    switch (status) {
      case 'Diterima':
        return statusDiterima;
      case 'Sedang Dicuci':
        return statusDicuci;
      case 'Sedang Dikeringkan':
        return statusDikeringkan;
      case 'Sedang Disetrika':
        return statusDisetrika;
      case 'Selesai':
        return statusSelesai;
      case 'Sudah Diambil':
        return statusDiambil;
      default:
        return textSecondary;
    }
  }

  static Color getPaymentStatusColor(String status) {
    switch (status) {
      case 'Lunas':
        return statusLunas;
      case 'Belum Bayar':
        return statusBelumBayar;
      default:
        return textSecondary;
    }
  }
}
