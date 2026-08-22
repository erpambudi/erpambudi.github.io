---
id: RULE-THEME-004
name: theming-and-styling-guidelines
severity: STRICT
trigger: file_path:lib/**/presentation/**
---

# Theming & Styling Guidelines

Untuk memastikan desain UI konsisten dan mendukung Light/Dark mode secara otomatis, ikuti konvensi styling berikut:

## 1. Typography & Text Styling

Gunakan extension `TypographyExtension` langsung dari `context`:
- `context.headlineLarge`, `context.headlineMedium`, `context.headlineSmall`
- `context.titleLarge`, `context.titleMedium`, `context.titleSmall`
- `context.bodyLarge`, `context.bodyMedium`, `context.bodySmall`
- `context.labelLarge`, `context.labelMedium`, `context.labelSmall`

❌ **DILARANG**:
- Membuat `TextStyle(fontFamily: 'Poppins', fontSize: 14, color: ...)` manual di dalam widget UI.
- Menggunakan `Theme.of(context).textTheme.bodyMedium` secara bertele-tele jika sudah ada extension.

## 2. Colors & Palettes

- Gunakan `context.colors` (misal: `context.colors.primary`, `context.colors.surface`, `context.colors.error`).
- Gunakan `AppColors` (`lib/core/theme/app_colors.dart`) jika membutuhkan token warna konstan spesifik.

## 3. Responsive Breakpoints

Gunakan extension `ResponsiveContext` dari `lib/core/extensions/context_extensions.dart`:
```dart
if (context.isMobile) { ... }
final padding = context.responsiveValue(mobile: 16.0, tablet: 24.0, desktop: 32.0);
```

## 4. Contoh Kontras

### ❌ BAD:
```dart
Text(
  'Total Pembayaran',
  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
)
```

### ✅ GOOD:
```dart
Text(
  context.l10n.totalPayment,
  style: context.titleMedium,
)
```
