---
name: add-pagination
description: >-
  Use this skill whenever implementing a paginated list or infinite scroll feature.
---

# Runbook: Menambahkan List dengan Pagination (Infinite Scroll)

Gunakan standar komponen proyek untuk fitur daftar dengan scroll pagination.

## Langkah-langkah Integrasi:

### 1. Di Repository (Domain & Data Layer)
Pastikan method repository mengembalikan `PaginatedResponse<T>`:
```dart
Future<Either<Failure, PaginatedResponse<MyEntity>>> getItems({
  required int page,
  String? filter,
});
```

### 2. Buat Cubit turunan `BasePaginationCubit`
```dart
// presentation/cubit/my_list_cubit.dart
import '../../../../core/bloc/pagination/base_pagination_cubit.dart';
import '../../../../core/models/paginated_response.dart';
import '../../domain/entities/my_entity.dart';
import '../../domain/repositories/my_repository.dart';

class MyListCubit extends BasePaginationCubit<MyEntity, String> {
  final MyRepository repository;

  MyListCubit({required this.repository});

  @override
  Future<PaginatedResponse<MyEntity>> fetchItems(int page, String? filter) async {
    final result = await repository.getItems(page: page, filter: filter);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );
  }
}
```

### 3. Di UI Page / Widget
Gunakan widget `AppPaginatedListView`:
```dart
import '../../../../core/widgets/list/app_paginated_list_view.dart';

class MyListPageContent extends StatelessWidget {
  const MyListPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPaginatedListView<MyListCubit, MyEntity, String>(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, item) {
        return MyItemCard(item: item);
      },
    );
  }
}
```

### 4. Trigger First Page di Page State
```dart
@override
void initState() {
  super.initState();
  context.read<MyListCubit>().fetchFirstPage();
}
```

### 5. Verifikasi
```bash
dart run scripts/validate_ai_rules.dart
```
