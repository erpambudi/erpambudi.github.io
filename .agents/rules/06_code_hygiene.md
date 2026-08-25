---
trigger: always_on
---

# Code Hygiene & Structure Rules

Untuk menjaga agar codebase tetap bersih, modular, dan mudah di-maintain, ikuti standar kebersihan kode berikut:

## 1. Batas Maksimal Baris File (Max 300 Lines)

- ❌ **DILARANG** membuat file Dart yang melebihi **300 baris kode**.
- Jika halaman UI atau widget mulai panjang, pecah menjadi widget-widget kecil ke dalam folder `widgets/` atau `layouts/` di fitur tersebut.

## 2. Pengelompokan Custom Widget (Subfolder by Category)

Kelompokkan *custom widget* (baik di `lib/core/widgets/` maupun di `presentation/widgets/`) ke dalam subfolder berdasarkan jenis/fungsinya:
- `buttons/` (Custom buttons, action buttons)
- `inputs/` (Text fields, search bars, dropdowns)
- `cards/` (Card components)
- `dialogs/` (Custom popups, confirmation dialogs)
- `badges/` (Status badges, tags)
- `feedback/` (Empty state, error state, loading state)
- `snackbar/` (Custom snackbars / toasts)

## 3. Konvensi Bahasa & Format File

- **Bahasa Kode**: Variabel, nama fungsi, class, komentar teknis **WAJIB** Bahasa Inggris. Bahasa Indonesia hanya untuk teks tampilan UI melalui l10n.
- **Nama File**: `snake_case.dart` (contoh: `order_card.dart`, `profile_cubit.dart`).
- **Nama Class**: `PascalCase` (contoh: `OrderCard`, `ProfileCubit`).
- **Formatting**: Jalankan perintah `dart format .` setelah setiap penambahan/perubahan kode.

## 4. Validasi Otomatis
Skrip validasi akan memeriksa batas baris file dan formatting:
```bash
dart run scripts/validate_ai_rules.dart
```