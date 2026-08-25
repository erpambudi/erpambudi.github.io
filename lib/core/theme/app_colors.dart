import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand colors (Executive Corporate Tech Blue)
  static const Color primary = Color(0xFF2563EB); // Royal Blue
  static const Color primaryDark = Color(0xFF1D4ED8);
  static const Color primaryLight = Color(0xFF3B82F6);
  static const Color primaryGlow = Color(0x262563EB);

  // Secondary & Neutral Accents (Clean, non-flashy, cohesive)
  static const Color secondary = Color(0xFF0284C7); // Clean Sky Cobalt
  static const Color accent = Color(
    0xFF10B981,
  ); // Emerald (for availability status)
  static const Color slate = Color(0xFF64748B);

  // Light Mode Colors (Crisp White & Minimal Slate)
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Colors.white;
  static const Color cardLight = Colors.white;
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textMutedLight = Color(0xFF94A3B8);

  // Dark Mode Colors (Sleek Obsidian Slate)
  static const Color backgroundDark = Color(0xFF0B0F17);
  static const Color surfaceDark = Color(0xFF111827);
  static const Color cardDark = Color(0xFF151C2C);
  static const Color cardDarkHover = Color(0xFF1E293B);
  static const Color borderDark = Color(0xFF222E46);
  static const Color borderDarkGlow = Color(0xFF334155);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textMutedDark = Color(0xFF64748B);

  // Status & Utility
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Subtle Monochromatic Gradients (No rainbow/RGB colors)
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2563EB), Color(0xFF1D4ED8)],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF3B82F6), Color(0xFF2563EB)],
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF151C2C), Color(0xFF111827)],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x1AFFFFFF), Color(0x05FFFFFF)],
  );

  // Legacy / Template aliases
  static const Color textPrimary = textPrimaryLight;
  static const Color textSecondary = textSecondaryLight;
  static const Color textMuted = textMutedLight;
  static const Color textLight = Colors.white;
  static const Color background = backgroundLight;
  static const Color surface = surfaceLight;
  static const Color card = cardLight;
  static const Color border = borderLight;
  static const Color statusDicuci = Color(0xFF3B82F6);
  static const Color statusDiterima = Color(0xFF10B981);
  static const Color statusSelesai = Color(0xFF10B981);
  static const Color statusDiproses = Color(0xFFF59E0B);
  static const Color statusDibatalkan = Color(0xFFEF4444);
  static const Color statusLunas = Color(0xFF10B981);

  static Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'selesai':
      case 'diterima':
      case 'success':
        return statusSelesai;
      case 'diproses':
      case 'dicuci':
      case 'pending':
        return statusDiproses;
      case 'dibatalkan':
      case 'cancel':
      case 'failed':
        return statusDibatalkan;
      default:
        return primary;
    }
  }

  static Color getPaymentStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'lunas':
      case 'paid':
      case 'success':
        return statusLunas;
      case 'pending':
      case 'belum bayar':
        return warning;
      case 'gagal':
      case 'failed':
        return error;
      default:
        return primary;
    }
  }
}
