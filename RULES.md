# Mobile Project Rules & Conventions

## 1. Arsitektur Proyek (Clean Architecture - Feature First)
Proyek ini secara ketat mematuhi prinsip **Clean Architecture** yang diorganisir berdasarkan fitur (Feature-First). Tujuannya adalah memisahkan kode UI, aturan bisnis (business logic), dan pengambilan data agar aplikasi mudah diuji (testable) dan dipelihara.

Setiap fitur memiliki 3 layer utama: **Presentation**, **Domain**, dan **Data**.

### Struktur Direktori Wajib:
```text
lib/
├── config/             # Konfigurasi aplikasi (tema, env, router, dll)
├── core/               # Kode global (utils, network client, widget reusable, constants, error handling)
├── features/           # Modul per fitur aplikasi
│   └── [nama_fitur]/
│       ├── data/       # DATA LAYER: Menangani akses data (API/Lokal)
│       │   ├── datasources/    # Remote/Local data source (API calls via Dio / Local via Hive)
│       │   ├── models/         # Model data (biasanya ekstensi dari entity + fungsi fromJson/toJson)
│       │   └── repositories/   # Implementasi dari contract (interface) repository di Domain layer
│       ├── domain/     # DOMAIN LAYER: Menangani aturan bisnis utama (Core Logic)
│       │   ├── entities/       # Objek bisnis murni (tanpa dependensi framework/JSON)
│       │   └── repositories/   # Contract/Interface repository (abstract class)
│       └── presentation/ # PRESENTATION LAYER: Menangani UI dan State
│           ├── pages/          # Halaman/Screen utama fitur
│           ├── widgets/        # Komponen UI spesifik untuk fitur ini
│           └── cubit/          # State Management (menghubungkan UI dengan Repository)
├── injection_container.dart # Setup dependency injection terpusat (mendaftarkan semua kelas)
└── main.dart           # Entry point aplikasi
```

### Aturan Ketat Antar Layer:
- **Presentation Layer** HANYA boleh memanggil layer Domain. Tidak boleh memanggil API langsung (Data layer).
- **Domain Layer** adalah layer yang PALING INDEPENDEN. Tidak boleh bergantung pada package external apa pun (seperti HTTP, Dio, Hive, atau Flutter UI). Hanya berisi *pure Dart logic*.
- **Data Layer** bergantung pada Domain layer (mengimplementasikan Repository) dan bertugas menerjemahkan JSON/Data dari luar menjadi Entity yang dimengerti Domain.

## 2. Konvensi Penulisan Kode (Code Style)
- **Bahasa:** Gunakan bahasa Inggris untuk penamaan variabel, fungsi, class, dan nama file di dalam kode. Gunakan bahasa Indonesia HANYA untuk teks yang muncul di layar UI.
- **Format File:** Gunakan format `snake_case` (contoh: `home_page.dart`, `auth_cubit.dart`).
- **Format Class:** Gunakan format `PascalCase` (contoh: `HomePage`, `AuthModel`).
- **Format Variabel/Fungsi:** Gunakan format `camelCase` (contoh: `fetchData()`, `isLoading`).
- **Code Formatting:** Pastikan AI selalu menjalankan perintah `dart format .` setelah melakukan penambahan atau perubahan kode agar sinkron dengan format standar.
- **Localization (l10n):** Jangan melakukan *hardcode* pada string UI/teks. Selalu gunakan fitur localization dengan menambahkan string di `lib/l10n/app_id.arb`. Panggil menggunakan `context.l10n.keyName` (melalui extension).
- **State Management:** Selalu pisahkan *business logic* dari UI. Jangan ada HTTP call atau logika database di dalam *Widget*. Panggil melalui Cubit/Bloc.
- **Penamaan State:** Semua class *State* untuk Cubit/Bloc wajib berakhiran dengan kata `State` (contoh: `AuthLoadingState`, `DashboardLoadedState`) agar mudah dibedakan secara visual dari class model atau entitas biasa.
- **Provider Scope:** Hanya Cubit/Bloc yang benar-benar global (contoh: `AuthCubit`) yang boleh di-provide di `app.dart`. Cubit khusus fitur wajib di-provide di level page menggunakan pola `static Widget create()` yang mengembalikan `MultiBlocProvider` membungkus page tersebut. Router (`app_router.dart`) memanggil `PageName.create()` agar tetap bersih.
- **Routing:** Daftarkan semua halaman terpusat menggunakan `go_router`. Hindari navigasi anonim (`Navigator.push`) sebisa mungkin.
- **Dependency Injection:** Jangan melakukan instansiasi dependensi secara langsung di UI, gunakan `GetIt` (`sl<MyRepository>()`).
- **Styling & Theming:** Gunakan extension `context.typography` (berisi standar *Design System* seperti `heading1`, `bodyLarge`) untuk mengatur `TextStyle` dan `context.colors` untuk mendapatkan referensi warna. Hindari penggunaan `Theme.of(context).textTheme` atau `Theme.of(context).colorScheme` secara langsung agar tampilan selalu konsisten.
- **Pagination:** Selalu gunakan standar komponen aplikasi untuk membuat *list* dengan paginasi (*infinite scroll*):
  - **Data/Domain:** Return data paginasi dari repository sebagai `PaginatedResponse<T>`.
  - **State Management:** Cubit wajib *extends* `BasePaginationCubit<T, Params>` dan cukup mengimplementasikan metode `fetchItems()`.
  - **UI/Widget:** Selalu gunakan widget `AppPaginatedListView<MyCubit, MyModel, MyParams>`. Jangan membuat `ListView.builder` dan `ScrollController` secara manual dari awal.

## 3. Error Handling
- Tangani segala bentuk exception atau kegagalan request API dengan mapping error khusus di layer *Data* (contoh mereturn object `Failure` atau me-lempar *ServerException*).
- Jangan membiarkan *unhandled exception* yang dapat menyebabkan red screen. Tangkap error di Cubit dan *emit* state error untuk ditampilkan di UI (misal: *Snackbar* atau dialog).

## 4. Alur Kerja (Workflow)
- Jangan membuat file dengan lebih dari 300 baris. Jika UI terlalu besar, pecah komponennya ke folder `widgets` di dalam `presentation` fitur tersebut.
- Selalu buat widget *reusable* jika akan dipakai di lebih dari satu fitur (masukkan ke `lib/core/widgets`).
- Kelompokkan *custom widget* di dalam folder `widgets` (baik di core maupun fitur) ke dalam subfolder berdasarkan jenis widgetnya (contoh: `buttons/`, `inputs/`, `cards/`, `dialogs/`) agar struktur lebih rapi dan mudah dicari.
