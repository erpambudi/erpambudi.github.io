import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/list/app_paginated_list_view.dart';
import '../../../../injection_container.dart';

import '../../../auth/presentation/cubit/auth_cubit.dart';

import '../cubit/order_list_cubit.dart';
import '../widgets/order_card.dart';
import '../../domain/entities/order.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({super.key});

  static Widget create() {
    return BlocProvider<OrderListCubit>(
      create: (_) => sl<OrderListCubit>(),
      child: const OrderListPage(),
    );
  }

  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderListCubit>().fetchFirstPage();
  }

  void _showLogoutConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<AuthCubit>().logout();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pesanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _showLogoutConfirmation,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilters(context),
          Expanded(
            child: AppPaginatedListView<OrderListCubit, Order, String>(
              itemBuilder: (context, order) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: OrderCard(order: order),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters(BuildContext context) {
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
