---
trigger: always_on
---

# Clean Architecture & Layer Boundaries

Proyek ini menerapkan **Clean Architecture - Feature First**. Setiap fitur wajib terisolasi dalam 3 layer utama (`data`, `domain`, `presentation`).

## 1. Struktur Wajib Fitur (`lib/features/[feature_name]/`)

```text
lib/features/[nama_fitur]/
├── data/
│   ├── datasources/    # RemoteDataSource & LocalDataSource (Dio / Storage)
│   ├── models/         # Model data (extends entity + fromJson/toJson)
│   └── repositories/   # Implementasi kontrak repository dari Domain
├── domain/
│   ├── entities/       # Pure business objects (tanpa dependensi JSON/UI)
│   └── repositories/   # Contract interface repository (abstract class)
└── presentation/
    ├── cubit/          # State management (Cubit & State classes)
    ├── layouts/        # Responsive layouts (mobile, tablet, desktop jika ada)
    ├── pages/          # Entry pages (memiliki static Widget create())
    └── widgets/        # Komponen UI spesifik fitur (buttons, cards, dll)
```

## 2. Batasan Keras (Strict Constraints)

- ❌ **DILARANG** mengimpor `data/` ke dalam `presentation/`. Presentation hanya boleh berkomunikasi dengan interface di `domain/`.
- ❌ **DILARANG** mengimpor package eksternal (seperti `dio`, `flutter/material.dart`, `hive`, `shared_preferences`) ke dalam `domain/`. Domain harus 100% *Pure Dart*.
- ❌ **DILARANG** melakukan HTTP call atau pemanggilan database langsung di dalam widget / Presentation layer.
- ❌ **DILARANG** melewati batas fitur (Feature cross-import liar). Jika komponen digunakan lintas fitur, pindahkan ke `lib/core/`.

## 3. Contoh Kontras (Code Examples)

### ❌ BAD (Pelanggaran Layer):
```dart
// lib/features/orders/presentation/cubit/order_cubit.dart
// SALAH: Mengimpor DataSource dan Dio langsung ke Cubit/Presentation!
import 'package:dio/dio.dart';
import '../../data/datasources/order_remote_data_source.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRemoteDataSource dataSource;
  // ...
}
```

### ✅ GOOD (Sesuai Standar):
```dart
// lib/features/orders/presentation/cubit/order_cubit.dart
// BENAR: Mengimpor repository contract dari Domain layer
import '../../domain/repositories/order_repository.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepository repository;

  OrderCubit({required this.repository}) : super(OrderInitialState());
}
```

## 4. Validasi Otomatis
Jalankan validasi import:
```bash
dart run scripts/validate_ai_rules.dart
```