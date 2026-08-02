import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/order_list_cubit.dart';

class OrderFilterChips extends StatelessWidget {
  const OrderFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'label': 'Semua', 'value': null},
      {'label': 'Diterima', 'value': 'diterima'},
      {'label': 'Sedang Dicuci', 'value': 'sedang_dicuci'},
      {'label': 'Sedang Dikeringkan', 'value': 'sedang_dikeringkan'},
      {'label': 'Sedang Disetrika', 'value': 'sedang_disetrika'},
      {'label': 'Selesai', 'value': 'selesai'},
      {'label': 'Sudah Diambil', 'value': 'sudah_diambil'},
    ];

    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final label = filter['label'] as String;
          final value = filter['value'];
          final currentFilter = context
              .watch<OrderListCubit>()
              .state
              .currentFilter;
          final isSelected = currentFilter == value;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  context.read<OrderListCubit>().applyFilter(value ?? '');
                }
              },
            ),
          );
        },
      ),
    );
  }
}
