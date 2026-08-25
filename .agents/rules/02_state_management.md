---
trigger: always_on
---

# State Management Conventions (Cubit / Bloc)

Proyek ini menggunakan `flutter_bloc` (terutama `Cubit`) untuk mengelola state dan memisahkan *business logic* dari UI.

## 1. Aturan Penamaan State Class (Naming Rule)

Semua class yang merepresentasikan State untuk Cubit/Bloc **WAJIB** berakhiran dengan kata `State`.

### Contoh Penamaan State:
- `OrderInitialState` (bukan `OrderInitial`)
- `OrderLoadingState` (bukan `OrderLoading`)
- `OrderLoadedState` (bukan `OrderLoaded` atau `OrderSuccess`)
- `OrderErrorState` (bukan `OrderFailure`)

## 2. Provider Scope & Pola `static Widget create()`

- Cubit global (seperti `AuthCubit`, `LocaleCubit`) disediakan di root `app.dart`.
- Cubit lokal per fitur **DILARANG** di-provide di `app.dart`. Wajib di-scope di level Page menggunakan pola factory static `create()`.
- Router (`app_router.dart`) hanya memanggil `PageName.create()`.

### ✅ Contoh Pola Standar Page:
```dart
// lib/features/orders/presentation/pages/order_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection_container.dart';
import '../cubit/order_list_cubit.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  // Entrypoint untuk Router dengan DI injection
  static Widget create() {
    return BlocProvider<OrderListCubit>(
      create: (_) => sl<OrderListCubit>(),
      child: const OrderListPage(),
    );
  }

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}
```

## 3. Dependency Injection (GetIt)

- Semua Cubit dan Repository didaftarkan di `lib/injection_container.dart`.
- Dilarang membuat instance Repository atau Data Source secara manual (`new MyRepository()`) di dalam Page/Widget. Selalu gunakan `sl<T>()`.

## 4. Validasi Otomatis
Skrip validasi akan memeriksa apakah seluruh class state berakhiran `State`.
```bash
dart run scripts/validate_ai_rules.dart
```