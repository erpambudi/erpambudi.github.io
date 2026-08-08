import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/l10n_extension.dart';
import '../cubit/order_list_cubit.dart';

class OrderFilterChips extends StatelessWidget {
  const OrderFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = [
      {'label': context.l10n.all, 'value': null},
      {'label': context.l10n.received, 'value': 'diterima'},
      {'label': context.l10n.washing, 'value': 'sedang_dicuci'},
      {'label': context.l10n.drying, 'value': 'sedang_dikeringkan'},
      {'label': context.l10n.ironing, 'value': 'sedang_disetrika'},
      {'label': context.l10n.completed, 'value': 'selesai'},
      {'label': context.l10n.taken, 'value': 'sudah_diambil'},
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
