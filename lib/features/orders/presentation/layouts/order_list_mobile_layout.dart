import 'package:flutter/material.dart';

import '../../../../core/utils/l10n_extension.dart';
import '../../../../core/widgets/list/app_paginated_list_view.dart';
import '../../domain/entities/order.dart';
import '../cubit/order_list_cubit.dart';
import '../widgets/order_card.dart';
import '../widgets/order_filter_chips.dart';

class OrderListMobileLayout extends StatelessWidget {
  const OrderListMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.orderList),
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
