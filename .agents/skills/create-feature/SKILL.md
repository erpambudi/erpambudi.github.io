---
name: create-feature
description: >-
  Use this skill whenever creating a new feature module in lib/features/.
  Provides step-by-step instructions adhering to Clean Architecture and DI.
---

# Runbook: Membuat Fitur Baru (Feature-First Clean Architecture)

Gunakan alur berikut setiap kali menambahkan modul/fitur baru ke dalam proyek.

## Langkah-langkah Pembuatan:

### 1. Buat Struktur Folder
Buat folder di `lib/features/[nama_fitur]/`:
```text
lib/features/[nama_fitur]/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   └── repositories/
└── presentation/
    ├── cubit/
    ├── layouts/
    ├── pages/
    └── widgets/
```

### 2. Buat Domain Layer (Pure Dart)
1. **Entity**: `domain/entities/[nama_fitur].dart` (extends `Equatable`).
2. **Repository Contract**: `domain/repositories/[nama_fitur]_repository.dart` (abstract class).

### 3. Buat Data Layer
1. **Model**: `data/models/[nama_fitur]_model.dart` (extends entity, implement `fromJson` / `toJson`).
2. **Remote Data Source**: `data/datasources/[nama_fitur]_remote_data_source.dart` (menggunakan `ApiClient`).
3. **Repository Implementation**: `data/repositories/[nama_fitur]_repository_impl.dart` (implement contract dari Domain, menangani `NetworkInfo` & error catching).

### 4. Buat Presentation Layer
1. **Cubit & State**:
   - `presentation/cubit/[nama_fitur]_cubit.dart`
   - `presentation/cubit/[nama_fitur]_state.dart` (Nama class wajib berakhiran `State`).
2. **Page**:
   - `presentation/pages/[nama_fitur]_page.dart`
   - Implementasikan method `static Widget create()` yang membungkus page dengan `BlocProvider`.
3. **Layout & Widgets**:
   - Gunakan `ResponsiveBuilder` jika mendukung desktop/tablet.
   - Gunakan `context.typography` dan `context.l10n`.

### 5. Daftarkan di Dependency Injection
Buka `lib/injection_container.dart` dan daftarkan:
- Data Source: `sl.registerLazySingleton<[Feature]RemoteDataSource>(...)`
- Repository: `sl.registerLazySingleton<[Feature]Repository>(...)`
- Cubit: `sl.registerFactory(() => [Feature]Cubit(repository: sl()))`

### 6. Daftarkan Route di GoRouter
Buka `lib/config/routes/app_router.dart` dan tambahkan `GoRoute` yang memanggil `[Feature]Page.create()`.

### 7. Jalankan Verifikasi
```bash
dart run scripts/validate_ai_rules.dart
dart format .
dart analyze
```
