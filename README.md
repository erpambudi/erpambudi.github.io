# 🚀 Flutter Mobile Project

Proyek aplikasi mobile berskala *Enterprise* yang dibangun menggunakan Flutter. Proyek ini sangat berfokus pada skalabilitas, pemisahan *logic* yang bersih, dan kemudahan pemeliharaan (*maintainability*).

## ✨ Fitur Utama

- **Arsitektur Feature-First (Clean Architecture)**: Pemisahan tegas antara layer *Domain*, *Data*, dan *Presentation*.
- **State Management**: Memanfaatkan BLoC/Cubit (`flutter_bloc`) untuk alur data yang reaktif dan dapat diprediksi.
- **Routing Modern**: Navigasi deklaratif menggunakan `go_router`, dilengkapi dengan *auto-redirect* saat otentikasi (sesi habis/login).
- **Advanced Networking**: *API Client* terpusat berbasis `dio` dengan *interceptor* otomatis untuk injeksi *Bearer Token* dan *Error Handling* global (termasuk *auto-logout* pada status 401).
- **Environment Variables**: Pemisahan konfigurasi (URL, API Key) yang aman melalui file `.env` menggunakan fitur kompilasi bawaan Flutter (`--dart-define-from-file`).
- **Pagination Siap Pakai**: *Base Cubit* dan Widget khusus (`AppPaginatedListView`) yang otomatis menangani *infinite scrolling* dan *pull-to-refresh*.
- **Localization**: Mendukung *multi-language* menggunakan `app_id.arb` (tanpa *hardcode* teks UI).
- **Design System & Theming**: Manajemen warna, tipografi Material 3, dan *reusable widgets* yang konsisten.

---

## 🛠 Memulai Proyek (Getting Started)

### 1. Prasyarat Sistem
Pastikan Anda sudah menginstal:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.0 ke atas)
- Dart SDK

### 2. Instalasi
*Clone* *repository* ini, lalu jalankan:

```bash
flutter pub get
```

### 3. Setup Konfigurasi (.env)
Proyek ini mengandalkan *environment variables*. Buat dua buah *file* `.env` dari contoh yang sudah disediakan.

1. Salin `.env.example` menjadi `.env.dev` dan `.env.prod`.
```bash
cp .env.example .env.dev
cp .env.example .env.prod
```
2. Buka `.env.dev` dan sesuaikan nilai untuk *environment development* Anda (misal: URL API lokal).
3. Buka `.env.prod` dan sesuaikan dengan konfigurasi *production* Anda.

> **Catatan:** File `.env.dev` dan `.env.prod` sudah dimasukkan ke dalam `.gitignore`, sehingga aman dan tidak akan bocor ke GitHub.

### 4. Menjalankan Aplikasi

**Melalui Terminal:**
Untuk menjalankan versi *Development*:
```bash
flutter run --dart-define-from-file=.env.dev
```

Untuk menjalankan versi *Production*:
```bash
flutter run --dart-define-from-file=.env.prod
```

**Melalui VSCode:**
Buka panel **Run and Debug** (Ctrl+Shift+D), lalu pilih opsi di *dropdown* atas:
- **Mobile App (DEV)**
- **Mobile App (PROD)**

Tekan tombol *Play* atau tombol `F5`.

---

## 📂 Struktur Folder Utama

```text
lib/
├── config/             # Router & rute aplikasi global
├── core/               # Komponen global (Network, Theme, Utils, Error, UI Reusable)
├── features/           # Fitur-fitur aplikasi (Auth, Dashboard, dll)
│   └── [nama_fitur]/
│       ├── data/       # Akses & manipulasi data (API/Lokal)
│       ├── domain/     # Aturan bisnis & entitas utama
│       └── presentation/# UI, Widget, & Cubit/State
├── l10n/               # File kamus bahasa (.arb)
├── app.dart            # Inisialisasi global (Router & Theme)
├── injection_container.dart # Setup Dependency Injection (GetIt)
├── main.dart           # Entry point Production
└── main_dev.dart       # Entry point Development
```

---

## 📖 Aturan Koding & Konvensi (Docs-as-Code)

Demi menjaga kualitas kode (*codebase*), seluruh anggota tim dan AI Agent **wajib** mengikuti aturan yang ada di proyek ini.

👉 **Panduan Lengkap & Indeks Aturan: [`AGENTS.md`](./AGENTS.md) & [`.agents/rules/`](./.agents/rules/)**

Aturan tersebut mencakup cara membuat fitur baru, batasan komunikasi antar-layer, penamaan *State*, injeksi *Cubit*, standar *Pagination*, hingga tata cara penulisan komponen *UI*.

Jalankan skrip validasi kepatuhan aturan:
```bash
dart run scripts/validate_ai_rules.dart
```

---
*Aplikasi ini dirancang dengan standar kualitas enterprise yang ketat.*
