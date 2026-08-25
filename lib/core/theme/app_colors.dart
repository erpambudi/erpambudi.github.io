import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary brand colors (Modern Electric Indigo & Cyan Neon)
  static const Color primary = Color(0xFF6366F1); // Indigo
  static const Color primaryDark = Color(0xFF4F46E5);
  static const Color primaryLight = Color(0xFF818CF8);
  static const Color primaryGlow = Color(0x336366F1);

  // Secondary & Accents
  static const Color secondary = Color(0xFF06B6D4); // Cyan Neon
  static const Color accent = Color(0xFF10B981); // Emerald Tech
  static const Color pink = Color(0xFFEC4899);
  static const Color amber = Color(0xFFF59E0B);
  static const Color purple = Color(0xFF8B5CF6);

  // Light Mode Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color surfaceLight = Colors.white;
  static const Color cardLight = Colors.white;
  static const Color borderLight = Color(0xFFE2E8F0);
  static const Color textPrimaryLight = Color(0xFF0F172A);
  static const Color textSecondaryLight = Color(0xFF475569);
  static const Color textMutedLight = Color(0xFF94A3B8);

  // Dark Mode Colors (Obsidian & Deep Cyber Slate)
  static const Color backgroundDark = Color(0xFF0B0F19);
  static const Color surfaceDark = Color(0xFF111827);
  static const Color cardDark = Color(0xFF161F33);
  static const Color cardDarkHover = Color(0xFF1E293B);
  static const Color borderDark = Color(0xFF1E293B);
  static const Color borderDarkGlow = Color(0xFF334155);
  static const Color textPrimaryDark = Color(0xFFF8FAFC);
  static const Color textSecondaryDark = Color(0xFF94A3B8);
  static const Color textMutedDark = Color(0xFF64748B);

  // Status & Utility
  static const Color error = Color(0xFFEF4444);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF6366F1), Color(0xFF06B6D4)],
  );

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF818CF8), Color(0xFF38BDF8), Color(0xFF34D399)],
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF161F33), Color(0xFF111827)],
  );

  static const LinearGradient glassGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0x20FFFFFF), Color(0x05FFFFFF)],
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
