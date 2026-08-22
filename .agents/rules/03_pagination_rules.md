---
id: RULE-PAGINATE-003
name: pagination-and-infinite-scroll
severity: STRICT
trigger: file_path:lib/features/**
---

# Pagination & Infinite Scroll Rules

Untuk membuat tampilan daftar dengan fitur pagination / infinite scroll, **WAJIB** menggunakan komponen standar berikut untuk menjaga konsistensi arsitektur dan menghindari duplikasi logika scroll.

## 1. Tiga Komponen Wajib Pagination

1. **Data / Domain Layer**:
   - Return type dari Repository adalah `Future<Either<Failure, PaginatedResponse<T>>>` atau `PaginatedResponse<T>`.
   - Gunakan model `PaginatedResponse<T>` dari `lib/core/models/paginated_response.dart`.

2. **Presentation Cubit Layer**:
   - Cubit wajib mewarisi `BasePaginationCubit<T, Params>` dari `lib/core/bloc/pagination/base_pagination_cubit.dart`.
   - Cukup mengimplementasikan metode `fetchItems(int page, Params? filter)`.

3. **Presentation UI Layer**:
   - Gunakan widget `AppPaginatedListView<CubitClass, ModelClass, ParamsClass>` dari `lib/core/widgets/list/app_paginated_list_view.dart`.
   - ❌ **DILARANG** membuat `ScrollController` dan `ListView.builder` manual dari awal untuk pagination!

---

## 2. Contoh Standar Implementasi

### A. Cubit:
```dart
// lib/features/orders/presentation/cubit/order_list_cubit.dart
import '../../../../core/bloc/pagination/base_pagination_cubit.dart';
import '../../../../core/models/paginated_response.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';

class OrderListCubit extends BasePaginationCubit<Order, String> {
  final OrderRepository repository;

  OrderListCubit({required this.repository});

  @override
  Future<PaginatedResponse<Order>> fetchItems(int page, String? filter) async {
    final result = await repository.getOrders(page: page, status: filter);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );
  }
}
```

### B. UI Widget:
```dart
// lib/features/orders/presentation/widgets/order_list_content.dart
import 'package:flutter/material.dart';
import '../../../../core/widgets/list/app_paginated_list_view.dart';
import '../../domain/entities/order.dart';
import '../cubit/order_list_cubit.dart';

class OrderListContent extends StatelessWidget {
  const OrderListContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaginatedListView<OrderListCubit, Order, String>(
      itemBuilder: (context, order) => ListTile(
        title: Text('Order #${order.id}'),
        subtitle: Text(order.status),
      ),
    );
  }
}
```
