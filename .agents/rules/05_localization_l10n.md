---
trigger: always_on
---

# Localization (l10n) & UI Strings Rules

Untuk menjaga fleksibilitas multibahasa dan standarisasi string, **DILARANG KERAS** melakukan hardcode string teks UI di dalam kode Dart.

## 1. Aturan Penulisan String UI

1. **Selalu Tambahkan Key di File ARB**:
   - Bahasa Indonesia: `lib/l10n/app_id.arb`
   - Bahasa Inggris: `lib/l10n/app_en.arb`
2. **Panggil Menggunakan Extension**:
   - Gunakan `context.l10n.keyName` (melalui `lib/core/utils/l10n_extension.dart`).
3. **Penamaan Key**:
   - Gunakan format `camelCase` (contoh: `welcomeMessage`, `signInButton`, `orderNotFound`).

## 2. Contoh Kontras

### ❌ BAD (Hardcoded String):
```dart
ElevatedButton(
  onPressed: () {},
  child: const Text('Masuk Sekarang'),
)
```

### ✅ GOOD (Menggunakan l10n):
```dart
// 1. Tambahkan di lib/l10n/app_id.arb:
// "signInNow": "Masuk Sekarang"

// 2. Gunakan di Widget:
ElevatedButton(
  onPressed: () {},
  child: Text(context.l10n.signInNow),
)
```