# Agent Guidelines & Project Rules (Docs-as-Code)

Selamat datang di repositori **mobile_template** (Flutter Mobile App). File ini adalah panduan utama bagi AI Agent saat membaca, menganalisis, menambah, atau memodifikasi kode dalam proyek ini.

> [!IMPORTANT]
> **Protokol Wajib AI**: Setiap kali Anda membuat atau mengubah kode, Anda **WAJIB** mematuhi aturan modular di bawah dan menjalankan skrip verifikasi otomatis sebelum menyelesaikan tugas.

---

## 1. Arsitektur Utama (Clean Architecture - Feature First)

Setiap modul di `lib/features/[nama_fitur]/` dibagi secara ketat menjadi 3 layer:
1. **Presentation Layer (`presentation/`)**: UI Pages, Reusable Fitur Widgets, dan Cubit/Bloc.
2. **Domain Layer (`domain/`)**: Pure Dart logic, Entities, dan Contract Repositories (Interface). Bebas dari UI dan framework eksternal.
3. **Data Layer (`data/`)**: Data Sources (Dio/API Client, Hive/Storage), Models (`fromJson`/`toJson`), dan Implementasi Repositories.

### Matriks Ketergantungan Antar Layer (Strict Dependency Rule)
| Layer | Boleh Bergantung Pada | Dilarang Keras Bergantung Pada |
| :--- | :--- | :--- |
| **Presentation** | Domain | Data, External HTTP Client (Dio/Http) |
| **Domain** | *(Mandiri / Pure Dart)* | Presentation, Data, Flutter UI, External Libraries |
| **Data** | Domain | Presentation |

---

## 2. Indeks Aturan Modular (`.agents/rules/`)

Baca aturan spesifik sesuai konteks pekerjaan Anda:

| Rule ID | Topik Aturan | File Rule |
| :--- | :--- | :--- |
| `RULE-01` | **Clean Architecture & Boundary** | [.agents/rules/01_clean_architecture.md](.agents/rules/01_clean_architecture.md) |
| `RULE-02` | **State Management & Provider Scope** | [.agents/rules/02_state_management.md](.agents/rules/02_state_management.md) |
| `RULE-03` | **Pagination & Infinite Scroll** | [.agents/rules/03_pagination_rules.md](.agents/rules/03_pagination_rules.md) |
| `RULE-04` | **Theming & Design System** | [.agents/rules/04_theming_and_styling.md](.agents/rules/04_theming_and_styling.md) |
| `RULE-05` | **Localization (l10n) & Strings** | [.agents/rules/05_localization_l10n.md](.agents/rules/05_localization_l10n.md) |
| `RULE-06` | **Code Hygiene & File Length** | [.agents/rules/06_code_hygiene.md](.agents/rules/06_code_hygiene.md) |

---

## 3. Workspace Skills & Runbooks (`.agents/skills/`)

Gunakan panduan prosedural jika Anda diminta melakukan tugas berikut:
- **Membuat Fitur Baru Dari Nol**: [.agents/skills/create-feature/SKILL.md](.agents/skills/create-feature/SKILL.md)
- **Menambahkan List dengan Pagination**: [.agents/skills/add-pagination/SKILL.md](.agents/skills/add-pagination/SKILL.md)

---

## 4. Standar Penulisan & Konvensi Singkat

- **Bahasa**: Kode, variabel, nama fungsi, komentar teknis = **Bahasa Inggris**. Teks UI/Label = **Bahasa Indonesia** via `context.l10n`.
- **Casing**:
  - File: `snake_case.dart`
  - Class / Enums: `PascalCase`
  - Function / Variable: `camelCase`
  - State Class: Wajib berakhiran `State` (contoh: `ProfileLoadedState`).
- **Dependency Injection**: Gunakan GetIt terpusat di `lib/injection_container.dart` (`sl<MyRepository>()`).
- **Routing**: Daftarkan halaman di `lib/config/routes/app_router.dart` menggunakan `go_router`. Panggil `PageName.create()` untuk scoping Cubit.

---

## 5. Protokol Verifikasi Mandiri (Self-Verification Gate)

Sebelum menandai pekerjaan Anda selesai, Anda **WAJIB** melakukan langkah-langkah berikut:
1. Pastikan tidak ada file yang melebihi 300 baris.
2. Jalankan skrip validasi kepatuhan aturan:
   ```bash
   dart run scripts/validate_ai_rules.dart
   ```
3. Jalankan format kode standar:
   ```bash
   dart format .
   ```
4. Pastikan `dart analyze` bersih dari warning/error.
