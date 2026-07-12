import 'package:flutter/material.dart';

/// Extension ini membuat penulisan Text Style menjadi sangat singkat di UI.
/// Sekaligus secara otomatis menangani perubahan warna Light/Dark Mode.
///
/// Cara Penggunaan di UI:
/// Text('Halo', style: context.bodyMedium)
extension TypographyExtension on BuildContext {
  // ==========================================
  // Warna Dinamis
  // ==========================================
  Color get _onSurface => Theme.of(this).colorScheme.onSurface;
  Color get _onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color get _onPrimary => Theme.of(this).colorScheme.onPrimary;

  static const String _fontFamily = 'Poppins';

  // ==========================================
  // Display (Untuk angka/teks sangat besar)
  // ==========================================
  TextStyle get displayLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
    color: _onSurface,
  );

  TextStyle get displayMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: _onSurface,
  );

  TextStyle get displaySmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: _onSurface,
  );

  // ==========================================
  // Headlines (Judul Besar Halaman)
  // ==========================================
  TextStyle get headlineLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    color: _onSurface,
  );

  TextStyle get headlineMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
    color: _onSurface,
  );

  TextStyle get headlineSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: _onSurface,
  );

  // ==========================================
  // Titles (Judul Section / Subjudul)
  // ==========================================
  TextStyle get titleLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: _onSurface,
  );

  TextStyle get titleMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _onSurface,
  );

  TextStyle get titleSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: _onSurfaceVariant, // Warna sekunder
  );

  // ==========================================
  // Body (Teks Paragraf Standar)
  // ==========================================
  TextStyle get bodyLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _onSurface,
  );

  TextStyle get bodyMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: _onSurface,
  );

  TextStyle get bodySmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: _onSurfaceVariant, // Pengganti caption
  );

  // ==========================================
  // Labels (Teks Aksi / Badge / Tombol)
  // ==========================================
  TextStyle get labelLarge => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: _onPrimary, // Untuk teks tombol utama
  );

  TextStyle get labelMedium => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: _onSurface, // Untuk chips / label biasa
  );

  TextStyle get labelSmall => TextStyle(
    fontFamily: _fontFamily,
    fontSize: 10,
    fontWeight: FontWeight.w500,
    letterSpacing: 1.0,
    color: _onSurfaceVariant, // Pengganti overline
  );
}
