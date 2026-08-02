import 'package:flutter/material.dart';

import '../../../../core/widgets/list/app_paginated_list_view.dart';
import '../../domain/entities/order.dart';
import '../cubit/order_list_cubit.dart';
import '../widgets/order_card.dart';
import '../widgets/order_filter_chips.dart';

class OrderListMobileLayout extends StatelessWidget {
  final VoidCallback onLogout;

  const OrderListMobileLayout({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pesanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Column(
        children: [
          const OrderFilterChips(),
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
}
